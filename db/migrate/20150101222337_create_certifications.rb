class CreateCertifications < ActiveRecord::Migration
  def change
    create_table :certifications do |t|
      t.string :title
      t.string :short_name
      t.text :description
      t.integer :peer_approvements
      t.integer :level_id
      t.integer :move_type_id
      t.integer :moves_goal
      t.integer :duration

      t.timestamps
    end
  end
end
