class Store < ApplicationRecord
  validates_presence_of :name, :owner_name

  has_many :movements, class_name: 'Movement', dependent: :destroy
end
