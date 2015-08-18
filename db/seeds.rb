puts "Starting Seed with #{Pizza.count} pizzas"
puts "Starting Seed with #{Topping.count} toppings"

pep_plus = Pizza.find_or_create_by! :name => 'Pepperoni Plus', :price_cents => 999, :diameter_inches => 12 
popeye = Pizza.find_or_create_by! :name => 'Popeye', :price_cents => 899, :diameter_inches => 10 
margherita = Pizza.find_or_create_by! :name => 'Margherita', :price_cents => 799, :diameter_inches => 10 
the_goat = Pizza.find_or_create_by! :name => 'The Fig and the Goat', :price_cents => 1799, :diameter_inches => 12


pep_plus.toppings.find_or_create_by!(:name => 'Mozarella', :calories => 330)
pep_plus.toppings.find_or_create_by!(:name => 'Pepperoni', :calories => 200)
pep_plus.toppings.find_or_create_by!(:name => 'Ham', :calories => 450)

popeye.toppings.find_or_create_by!(:name => 'Mozarella', :calories => 330)
popeye.toppings.find_or_create_by!(:name => 'Spinach', :calories => 130)

margherita.toppings.find_or_create_by!(:name => 'Cheddar', :calories => 430)
margherita.toppings.find_or_create_by!(:name => 'Mozarella', :calories => 330)

the_goat.toppings.find_or_create_by!(:name => 'Figs', :calories => 203)
the_goat.toppings.find_or_create_by!(:name => 'Goat Cheese', :calories => 450)


puts "Ending Seed with #{Pizza.count} pizzas"
puts "Ending Seed with #{Topping.count} toppings"
