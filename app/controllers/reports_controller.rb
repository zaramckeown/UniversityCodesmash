class ReportsController < WebServiceController

  def total_sales
  totalSale = { number_of_sales: Sale.count, total: Sale.sum(:total) }
  render json: totalSale
  end

  def sales_per_item
  allSales = Sale.all
  burgerTotal = 0
  softDrinkTotal = 0
  chipTotal = 0
  answer = {}
  allSales.each do |sale|
     sale.items.each do |item|
       answer[item['name']] = ...
         if(item['name'].eql? 'burger')
          burgerTotal+=  
     end
  end
       
  
  salesPerItem = { 'burger'=> { 'number_of_sales'=> Sale.sum(:burger), 'total'=> }, 'soft drink'=> {}, 'chips'=> {}}
  binding.pry
  render json: salesPerItem
  end

end
