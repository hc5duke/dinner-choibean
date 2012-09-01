class RenameName < ActiveRecord::Migration
  def change
    rename_column :meals, :name, :dinner
    add_column    :meals, :lunch, :string
  end
end
