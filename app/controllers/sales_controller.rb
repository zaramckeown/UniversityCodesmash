class SalesController < WebServiceController

  def index # Show all the Sales
    render json: Sale.all
  end

  def show # Show a single Sale by 'id'
    id = params['id'] # Hint: look at the 'params' hash
    sale = Sale.find id
    render json: sale
  end

  def create
    # Hint: check if your newly created sale is valid
    #       by checking sale.valid? and looking at the
    #       sale.errors array in the debugger
    total = 0
    sale_params['items'].each do |item|
	total += item['price'].to_f 
 	if item.has_key? 'discount' 
	   total -= item['discount']['amount'].to_f
	end	
    end
    sale_params['total'] = total
    sale = Sale.new sale_params
    sale.save
    render json: sale
  end

  private

  def sale_params
    params.require(:sale).permit!
  end

end
