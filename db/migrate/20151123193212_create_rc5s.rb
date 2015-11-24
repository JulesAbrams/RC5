class CreateRc5s < ActiveRecord::Migration
  def change
    create_table :rc5s do |t|
      t.string :key
      t.text :text

      t.timestamps null: false
    end
  end
end
