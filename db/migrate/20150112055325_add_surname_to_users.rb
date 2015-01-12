class AddSurnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :surname, :string
    add_column :users, :user_name, :string
  end
end
