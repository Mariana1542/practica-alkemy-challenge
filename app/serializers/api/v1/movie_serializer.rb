module Api
    module V1 
        class MovieSerializer < ApplicationSerializer
            attributes :id,
                       :title 
        end
    end
end