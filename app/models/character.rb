class Character < ApplicationRecord
    #Associations
    belongs_to :movie, optional: false
   

    #Validations
    validates :name, presence: true
    validates :age, presence: true, numericality: {only_integer: true}
    validates :weight, numericality: { greater_than_or_equal_to: 0 }, presence: true
    validates :history, presence: true

    #Scopes
    scope :for_name, -> (name) { where name: name } 
    scope :for_age, -> (age) { where age: age } 
    scope :for_weight, -> (weight) { where weight: weight }  
    scope :for_movie, -> (movie) { joins(:movie).where(movie: {id: movie}) }  #o where(movies: {id: movie}) }  
   # scope :for_find_movie, -> (movie_id) { where movie_id: movie_id }
    
end
