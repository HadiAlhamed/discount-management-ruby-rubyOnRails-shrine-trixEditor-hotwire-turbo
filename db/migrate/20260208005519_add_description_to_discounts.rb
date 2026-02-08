class AddDescriptionToDiscounts < ActiveRecord::Migration[8.1]
  def change
    add_column :discounts, :description, :text
  end
end
