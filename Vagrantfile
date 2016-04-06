# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.7.2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'shopkeep-dev'

  config.vm.box = "hashicorp/precise32"

  config.vm.network "forwarded_port", guest: 3000, host: 3000

  config.vm.provider "virtualbox" do |vb|
     vb.gui = true
     vb.memory = "1024"
  end

  # Native packages
  config.vm.provision :shell, inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y \
      build-essential \
      curl \
      git \
      vim \
      python-pygments \
      node \
      samba 
  SHELL

  # RVM and Ruby
  ruby_version = File.read('.ruby-version')
  
  synced_folder = "/home/vagrant/#{File.basename(Dir.pwd)}"
  config.vm.provision :file, source: '.', destination: synced_folder
  config.vm.provision :shell, path: 'scripts/install-rvm.sh',  args: 'stable', privileged: false
  config.vm.provision :shell, path: 'scripts/install-ruby.sh', args: "#{ruby_version} uni-code-smash", privileged: false
  
  # Samba File sharing for windows + mac
  config.vm.provision :shell, path: 'scripts/samba.sh', args: "#{synced_folder}/scripts", privileged: true
end
