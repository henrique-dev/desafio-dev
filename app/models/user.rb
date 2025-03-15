class User < ApplicationRecord
  validates_presence_of :provider, :uid, :name, :email
end
