class AddSomeProductsData < ActiveRecord::Migration[5.2]
  def change
    Product.create(name: "Laptop", price: 200)
    Product.create(name: "Notebook", price: 10)
  end
end
