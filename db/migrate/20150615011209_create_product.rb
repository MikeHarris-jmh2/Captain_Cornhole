class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :price, :string
      t.column :user_id, :integer

      t.timestamp
    end
  end
end
