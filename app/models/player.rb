class Player < ApplicationRecord
  has_secure_password
  has_many :characters, dependent: :delete_all
  validates :name, :username, presence: true
  validates :username, uniqueness: true
end
