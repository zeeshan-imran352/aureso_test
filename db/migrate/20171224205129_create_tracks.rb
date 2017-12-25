class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, :null => false, :default => ""
      t.string :country, :null => false, :default => ""
      t.string :surface_type, :null => false, :default => ""
      t.string :slug, null: false
      t.string :timezone, :null => false, :default => "America/New_York"
      t.timestamps null: false
    end
  end
end
