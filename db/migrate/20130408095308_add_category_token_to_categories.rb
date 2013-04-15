class AddCategoryTokenToCategories < ActiveRecord::Migration
  def change
  	add_column :categories, :remember_token, :string
    add_index  :categories, :remember_token
  end
end
