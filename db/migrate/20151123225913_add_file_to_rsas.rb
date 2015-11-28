class AddFileToRsas < ActiveRecord::Migration
  def change
    add_column :rsas, :file, :string
  end
end
