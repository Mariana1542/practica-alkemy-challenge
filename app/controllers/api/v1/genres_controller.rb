module Api 
    module V1 
      class GenresController < ApiController
         def index# .. lo uso para controlar solamente..
            @genres = Genre.all
            render json: @genres, each_serializer: GenreSerializer,  status: :ok
         end
    

   
        private
       
        end
   
    end
end
   
   