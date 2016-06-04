class Item #Cart
  attr_accessor :name, :price, :sales_tax, :import_tax

  def initialize(name, price, sales_tax = nil, import_tax = nil)
    @name = name
    @price = price
    @sales_tax = sales_tax
    @import_tax = import_tax
  end

  def total  #accounts for final price in all tax scenarios

    if (@sales_tax == true) && (@import_tax == true)
      (@price * 1.15).round(2)
    elsif (@sales_tax == true) && (@import_tax == false)
      (@price * 1.10).round(2)
    elsif (@sales_tax == false) && (@import_tax == true)
      (@price * 1.05).round(2)
    elsif (@sales_tax == false) && (@import_tax == false)
      (@price).round(2)
    end
  end
end

# class Receipt < Item
#
#   def total
#     @price + @taxes
#   end
# end

chocolate = Item.new("chocolate", 2.00, true, true)
catheter = Item.new("catheter", 10.50, false, false)
anna_karenina = Item.new('anna_karenina', 9.25, true, false)
dress = Item.new('dress', 35.95, false, true)

p chocolate.total
p catheter.total
p anna_karenina.total
p dress.total
