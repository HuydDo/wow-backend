class Character < ApplicationRecord
  belongs_to :player
  validates :name, presence: true
  validates_inclusion_of :gender, :in => ['Male','Female']
end
