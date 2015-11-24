class AddFileToRc5s < ActiveRecord::Migration
  def change
    add_column :rc5s, :file, :string
  end
end
