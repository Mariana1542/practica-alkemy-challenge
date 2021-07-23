class Character < ApplicationRecord
    #Associations
    belongs_to :movie

    #Validations
    validates :name, 
              :age, 
              :weight,
              :history,
              presence: true

    #Scopes
   # scope :for_name, -> (name) { where name: name } 
    scope :for_age, -> (age) { where age: age } 
    scope :for_weight, -> (weight) { where weight: weight }          
end
