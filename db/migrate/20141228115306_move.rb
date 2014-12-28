class Move < ActiveRecord::Migration
  def change
    add_column :moves, :move_type_id, :integer
  end
end
