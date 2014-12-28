class CreateMoveTypes < ActiveRecord::Migration
  def change
    create_table :move_types do |t|
      t.string :title
      t.string :icon_path
      t.boolean :sprint
      t.boolean :day_plan
      t.boolean :user_story

      t.timestamps
    end
  end
end
