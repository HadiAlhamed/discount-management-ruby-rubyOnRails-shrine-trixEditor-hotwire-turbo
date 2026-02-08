class RemoveDescriptionFromDiscounts < ActiveRecord::Migration[8.1]
  def change
    remove_column :discounts, :description, :text
  end
end
