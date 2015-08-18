class AddSecretKeyToPizzas < ActiveRecord::Migration
  def change
    add_column :pizzas, :secret_key, :string
  end
end
