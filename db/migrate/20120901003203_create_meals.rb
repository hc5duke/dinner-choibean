class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.date :date
      t.text :comment

      t.timestamps
    end
  end
end
