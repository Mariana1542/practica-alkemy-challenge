class Character < ApplicationRecord
    #Associations
    belongs_to :movie

    #Validations
    validates :name, 
              :age, 
              :weight,
              :history,
              presence: true
end
