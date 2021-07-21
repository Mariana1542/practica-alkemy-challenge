module Api
    module V1 
        class CharacterSerializer < ApplicationSerializer
            attributes :id,
                       :image,
                       :name 
        end
    end
end                           