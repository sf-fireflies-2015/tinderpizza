class CreatePizzas < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :name
      t.integer :diameter_inches
      t.integer :price_cents
    end
  end
end
