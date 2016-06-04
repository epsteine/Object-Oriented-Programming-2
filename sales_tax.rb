class Item #Cart
  attr_accessor :name, :price, :sales_tax, :import_tax

  def initialize(name, price, sales_tax = nil, import_tax = nil)
    @name = name
    @price = price
    @sales_tax = sales_tax
    @import_tax = import_tax
  end

  def sales_tax
    @sales_tax = (0.10 * @price)
  end

  def import_tax
    @import_tax = (0.05 * @price)
  end
end


class Receipt < Item
  def total_sales_tax
    @import_tax + @sales_tax
  end

  def total
    @price + @import_tax + @sales_tax
  end
end

chocolate = Item.new("chocolate", 2, true, false)
