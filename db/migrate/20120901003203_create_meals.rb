class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.date :date
      t.text :comment

      t.timestamps
    end

    add_index :meals, :name
    add_index :meals, :date
  end
end
