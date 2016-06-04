class Item #Cart
  attr_accessor :name, :price, :sales_tax, :import_tax

  def initialize(name, price, sales_tax = nil, import_tax = nil)
    @name = name
    @price = price
    @sales_tax = sales_tax
    @import_tax = import_tax
  end

  def taxes #accounts for all tax scenarios

    if (@sales_tax == true) && (@import_tax == true)
      @price * 1.15
    elsif (@sales_tax == true) && (@import_tax == false)
      @price * 1.1
    elsif (@sales_tax == false) && (@import_tax == true)
      @price * 1.05
    elsif (@sales_tax == false) && (@import_tax == false)
      @price
    end
  end
end
#@sales_tax = (0.10 * @price)
#   end
#
#   def import_tax
#     @import_tax = (0.05 * @price)
#   end
#
#   def total_sales_tax
#     @import_tax + @sales_tax
#   end
#
# end


# class Receipt < Item
#
#   def total
#     @price + @taxes
#   end
# end

chocolate = Item.new("chocolate", 2, true, false)
p chocolate.taxes
