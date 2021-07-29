module Api 
    module V1 
      class MoviesController < ApiController
        def index
         #   characters = Character.all 
    
            render json: movies, each_serializer: MovieSerializer,  status: :ok
        end
    
        def show
           movie 
           render json: movie, serializer: ShowMovieSerializer::MovieSerializer,  status: :ok 
        end
   
        def update
          if movie.update(movie_params)
            render json: movie, serializer: ShowMovieSerializer::MovieSerializer,  status: :ok  
          else 
            render json: movie.errors, status: :unprocessable_entity
          end
   
        end
   
        def create 
         create_movie = Movie.new(movie_params) 
         genre_selection_id                #funcion opcional por si se especifica genero
         character_selection_or_creation   #funcion opcional por si se especifican personajes

         if create_movie.save    
          render json: create_movie, serializer: CreateMovieSerializer::MovieSerializer, status: :created  
         else  
           render json:  create_movie.errors , status: :unprocessable_entity
          end
        end
   
        def destroy 
          @movie = Movie.find_by("id": params[:id])  #el find_by() returns nill si no hay
       
        if  @movie.nil?    #
          render json: { error: "cannot destroy, it does not exist" }, status: :unprocessable_entity
        else  
          movie    #ahora si puedo usar find()
          if movie.destroy 
          render json: { message: "movie destroyed"}, status: :ok
          end
        end
   
        end
   
        private
   
        def movies
         @movies ||= fetch_movies 
        end
   
        def fetch_movies 
         mvs = Movie.all   
         mvs = mvs.for_title(title) if title       #llamo cada escope que defini dentro del modelo Movie
         mvs = mvs.for_genre(genre) if genre 
         mvs = mvs.for_date_of_creation(order) if order 
         mvs
        end
   
        def title 
         params[:title]
        end 
   
        def genre
         params[:genre]
        end 
   
        def order 
         params[:order]
        end

        def character_id 
          params[:character_id]
        end


 
          def movie 
           @movie ||= Movie.find(params[:id])
          end
   
          def movie_params
           params.require(:movie).permit( :image_url, :title, :date_of_creation, :rating, :order ,
            :character_id , :genre_id
       #       character_attributes: [
       #        :name, 
       #        :image_url, 
       #        :age, 
       #        :weight,
       #        :history  
       #       ]
            )
          end

          def character_selection_or_creation
            if character_id
              create_movie.character = Character.find(params[:character_id])  #ver bien si es 'create_movie.characters' o con buid 
            end
          end

          def genre_selection_id
            if genre
              create_movie.genre = Genre.find(params[:genre_id])
            end
          end
   
      end
    end
   end