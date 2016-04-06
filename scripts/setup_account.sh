#!/usr/bin/env bash

username=$1
repository=spring-2015-uni-code-smash
ruby_version=ruby-2.2.2
chmod_no_public_access=751
user_home="/home/${username}"
user_setup_script=${user_home}/setup.sh

adduser --gecos "" ${username}
sudo smbpasswd -a ${username}

cp -r ./${repository} ${user_home}
chown -R ${username} ${user_home}/${repository}

cat > ${user_setup_script} <<_EOF_
   #!/bin/bash
   [ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"]
   source /etc/profile
  
   cd ${user_home}
   chmod -R ${chmod_no_public_access} ${user_home}

   cd ${user_home}/${repository}
   rvm --default use ${ruby_version}
   rvm user gemsets
   gem install bundler
   bundle

   echo 'Done!'
_EOF_

chmod +x ${user_setup_script}
chown -R ${username} ${user_setup_script}
sudo usermod -a -G rvm ${username}

sudo -i -u $username bash -l ${user_setup_script}
