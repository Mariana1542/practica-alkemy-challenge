module Api 
 module V1 
   class CharactersController < ApplicationController
     def index
      #   characters = Character.all 
 
         render json: characters, each_serializer: CharacterSerializer,  status: :ok
     end
 
     def show
        character 
        render json: character, serializer: ShowCharacterSerializer::CharacterSerializer,  status: :ok 
     end

     def update

     end

     def create 
      create_character = Character.new(creation_character_params)
      create_character.movie = movie 
      if create_character.save 
        render json: create_character, serializer: CreateCharacterSerializer::CharacterSerializer, status: :created  
      else
        render json: { error: "cannot load" }, status: :unprocessable_entity
      end
     end

     def destroy 

     end

     private

     def characters
      @characters ||= fetch_characters 
     end

     def fetch_characters 
      chrts = Character.all
     # chrts = chrts.for_name(name) if name 
      chrts = chrts.for_name(age) if age 
      chrts = chrts.for_name(weight) if weight 
      chrts
     end

     def name 
      params[:name]
     end 

     def age 
      params[:age]
     end 

     def weight 
      params[:weight]
     end



       def character 
        @character ||= Character.find(params[:name])
       end

       def creation_character_params
        params.permit(
           :image_url,
           :name,
           :age,
           :weight,
           :history
        )
       end

       def movie
        @movie ||= Movie.find()
       end
   end
 end
end