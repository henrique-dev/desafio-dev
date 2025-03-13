class Movement < ApplicationRecord
  enum :kind, %i[lifetime test commercial custom], validate: true, suffix: true

  validates_presence_of :occurred_on, :value, :personal_code, :card_number, :occurred_at

  belongs_to :store, class_name: "Store"
end
