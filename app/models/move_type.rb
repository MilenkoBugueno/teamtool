class MoveType < ActiveRecord::Base
  validates_presence_of :title, :icon_path

  has_many :moves
end
