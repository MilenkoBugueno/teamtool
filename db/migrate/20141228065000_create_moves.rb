class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :title
      t.text :description
      t.text :results
      t.datetime :start_date
      t.datetime :end_date
      t.integer :user_id
      t.integer :project_id
      t.integer :category_id
      t.integer :inscription_id
      t.integer :container_id

      t.timestamps
    end
  end
end
