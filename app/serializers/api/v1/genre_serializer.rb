module Api
    module V1 
        class GenreSerializer < ApplicationSerializer
            attributes :id,
                       :name,
                       :image_url

                       has_many :movies, serializer: MovieSerializer                       
        end
    end
end