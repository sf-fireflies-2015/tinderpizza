class CreateToppings < ActiveRecord::Migration
  def change
    create_table :toppings do |t|
      t.string :name
      t.integer :calories
      t.references :pizza
    end
  end
end
