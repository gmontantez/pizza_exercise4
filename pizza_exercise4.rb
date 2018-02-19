menu_title = ["\nCatalona's Pizza"]
menu = ["\n\nPizza Sizes\nSmall $13.00  Medium $16.00  Large $16.00"]
menu_crust = ["\nCrust Flavors\nPlain  Garlic  Stuffed"]
menu_sauces = ["\nSauces\nTomato  Alfredo"]
menu_toppings = ["\nToppings\nPepperoni  Sausage  Ham  Mushrooms  Black Olive  Green Pepper  Chicken  Spinach  Anchovies"]
menu_extra_toppings = ["\nExtra Toppings\nExtra Cheese $1.00  Double Pepperoni $2.00  Feta Cheese $3.00"]
menu_wings = ["\nWings\nBBQ  Honey Mustard  Garlic  Hot\n8 Piece $6.00  16 Piece $11.00  24 Piece $16.00"]
menu_salad = ["\nSalads\nHouse Salad  Ceaser Salad  Greek Salad  $5.00 each\nSalad Dressing\nRanch  Blue Cheese  House  Ceaser  Greek"]
menu_drinks = ["\nBottled Drinks\nCoke  Diet Coke  Sprite  Iced Tea  Water"]
crust = ["plain","garlic","stuffed"]
meats = ["pepperoni","sausage","ham","ground beef"]
veggies = ["mushrooms","black olives","green peppers"]
toppings = ["anchovies","chicken","spinach"]
sauces = ["tomato","alfredo"]
other_options = ["extra cheese","double pepperoni","feta cheese"] #special toppings costing extra
wings = ["bbq","honey mustard","garlic","hot"]
salad = ["house salad","ceaser salad","greek salad"]
salad_dressings = ["ranch","blue cheese","house","ceaser","greek"]
drinks = ["coke","diet coke","sprite","iced tea","water"]
size = ["small","medium","large"]
wings_size = ["8 piece","16 piece","24 piece"]
wing_order = ["yes","no"]
salad_order = ["yes","no"]
drink_order = ["yes","no"]
delivery = ["yes","no"]


def cost(size)
	if size == "small"
      13.00
	elsif size == "medium"
      16.00
   elsif size == "large"
      19.00
   end
end

def special_options(other_options)
   if other_options == "extra cheese"
      1.00
   elsif other_options == "double pepperoni"
      2.00
   elsif other_options == "feta cheese"
      3.00
   end
end

def amount(wings_size)
   if wings_size == "8 piece"
      6.00
   elsif wings_size == "16 piece"
      11.00
   elsif wings_size == "24 piece"
      16.00
   end
end
def wings_choice(wing_order)
   if wing_order == "yes"
      puts wings_size
   end
end

def delivery_choice(delivery)
   if delivery == "yes"
      3
   else 
      0
   end
end

puts menu_title
puts menu
puts menu_crust
puts menu_sauces
puts menu_toppings
puts menu_extra_toppings
puts menu_wings
puts menu_salad
puts menu_drinks

puts "\n\nHow many pizzas would you like?"
pizzas = gets.chomp.to_i

puts "\nNow please tell me what size, the type of crust, and the toppings."
puts "\nAny of the special toppings will be extra."
puts "The special toppings are extra cheese, double pepperoni, and feta cheese."


pizza = 1
subtotal = 0
while pizza <= pizzas do
   pizza_size = size.sample
   pizza_cost = cost(pizza_size)
   other = other_options.sample
   other_cost = special_options(other)
   puts "\nPizza #{pizza}"
   puts "So, you would like a #{pizza_size} pizza at $#{sprintf("%0.02f", pizza_cost)}."
	puts "You would like a #{crust.sample} crust, with #{sauces.sample} sauce, your toppings will be #{veggies.sample}, #{meats.sample} and #{toppings.sample}."  
   puts "You would also like #{other} at $#{sprintf("%.02f", other_cost)}.\n"
   pizza +=1
end
puts "\nWould you like to add wings, salad, or drinks to your order?"
additional_items_choice = gets.chomp
if additional_items_choice == "yes" || additional_items_choice == "Yes"
   puts "\nWould you like wings?"
   wings_option = gets.chomp
   puts "\nWould you like a salad?"
   salad_option = gets.chomp
   puts "\nWould you like a drink?"
   drink_option = gets.chomp
   if wings_option == "yes"
      wings_amount = wings_size.sample
      wings_cost = amount(wings_amount)
      puts "\nSo, you would like #{wings_amount} for $#{sprintf("%.02f", wings_cost)}."
   end
   if salad_option == "yes"
      salad_type = salad.sample
      salad_cost = 5.00
      puts "\nWould you like dressing with your salad?"
      dressing_choice = gets.chomp
      if dressing_choice == "yes"
         dressing_type = salad_dressings.sample
         puts "\nSo you would like #{salad_type} with #{dressing_type}."
      else
         puts "\nSo you would like #{salad_type}."
      end
   end
   if drink_option == "yes"
      drink_type = drinks.sample
      drink_cost = 1.75
      puts "\nSo you would like #{drink_type} for $#{sprintf("%.02f", drink_cost)}."
   end
else
   drink_cost = 0
   salad_cost = 0
   wings_cost = 0
   puts "So, you would not like any additonal items added to your order."
end

tax = 1.07
subtotal += pizza_cost + other_cost + wings_cost + salad_cost + drink_cost
total_cost = subtotal * tax


delivery_option = delivery.sample
delivery_cost = delivery_choice(delivery_option)

if delivery_option == "yes"
   puts "\nWhat would you like to tip?"
   tip = gets.chomp.to_f
else
   tip = 0
end
puts "\nThe tip amount is $#{sprintf("%.02f", tip)}."

puts "\nThe total cost including tax is $#{sprintf("%.02f", total_cost)}."
puts "\nYour choice for delivery is #{delivery_option}."
puts "\nThe delivery cost is $#{sprintf("%.02f", delivery_cost)}."
