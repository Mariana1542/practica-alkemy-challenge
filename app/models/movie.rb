class Movie < ApplicationRecord
    #Associations
    belongs_to :genre, optional: true
    has_many :characters

    #Validations
    validates :rating, numericality: { greater_than_or_equal_to: 1,less_than_or_equal_to:5 }

    validates :title, 
              :date_of_creation, 
              :rating,
              presence: true
end
