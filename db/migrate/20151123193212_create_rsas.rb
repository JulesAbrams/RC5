class CreateRsas < ActiveRecord::Migration
  def change
    create_table :rsas do |t|
      t.timestamps null: false
    end
  end
end
