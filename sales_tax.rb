class Item

   attr_accessor :name, :price, :import_tax, :sales_tax

   @@total_price = 0
   @@total_tax = 0
   @@list = []

   #accept individual items and put in a list
   def initialize(name, price, import_tax, sales_tax)
     @name = name
     @price = price
     @new_price = 0
     @import_tax = import_tax
     @sales_tax = sales_tax
   end  #calculate total tax for item
   def calculate
     if (@sales_tax == true) && (@import_tax == true)
       @new_price = (@price * 1.15).round(2)
     elsif (@sales_tax == true) && (@import_tax == false)
       @new_price = (@price * 1.10).round(2)
     elsif (@sales_tax == false) && (@import_tax == true)
       @new_price = (@price * 1.05).round(2)
     elsif (@sales_tax == false) && (@import_tax == false)
       @new_price = (@price).round(2)
    end

     #add price of item to total price
     @@total_price += @new_price

     #add tax of item to total tax
     @@total_tax += (@new_price - @price)
     @@total_tax = @@total_tax.round(2)

     #populate list
     @@list << [@name, @price, @import_tax]
   end

 end

 class Receipt < Item
   #print out list of all items
   def self.display
     for i in 0..@@list.length-1
         p "1 #{"imported" if @@list[i][2] == true} #{@@list[i][0]}: #{@@list[i][1]}"
     end

     puts "Sales Taxes: #{@@total_tax}"
     puts "Total: #{@@total_price}"
   end

   def self.clear_cart
     @@total_tax = 0
     @@total_price = 0
     @@list.clear
   end

 end


 #input
 (Receipt.new("book", 12.49, false, false)).calculate
 (Receipt.new("music CD", 14.99, false, true)).calculate
 (Receipt.new("chocolate bar", 0.85, false, false)).calculate
 Receipt.display
 Receipt.clear_cart

 #second receipt
 (Receipt.new("box of chocolates", 10.00, true, false)).calculate
 (Receipt.new("bottle of perfume",47.50,true, true)).calculate
 Receipt.display
 Receipt.clear_cart

 #third receipt
 (Receipt.new("bottle of perfume", 27.99, true, true)).calculate
 (Receipt.new("bottle of perfume",18.99,false,true)).calculate
 (Receipt.new("packet of headache pills",9.75, false,false)).calculate
 (Receipt.new("box of chocolates",11.25,true,false)).calculate
 Receipt.display
 Receipt.clear_cart
