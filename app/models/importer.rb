class Importer < ApplicationRecord
  enum :state, %i[created success], validate: true, suffix: true, default: :created

  has_one_attached :file
end
