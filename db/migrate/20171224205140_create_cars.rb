class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name, :null => false, :default => ""
      t.float :max_speed, :null => false, :default => ""
      t.string :slug, null: false
      t.timestamps null: false
    end
  end
end
