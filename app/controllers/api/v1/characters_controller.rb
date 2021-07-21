module Api 
 module V1 
   class CharactersController < ApplicationController
     def index
         characters = Character.all 
 
         render json: characters, each_serializer: CharacterSerializer, status: :ok
 
     end
 
     def show
 
     end

     def update

     end

     def create 

     end

     def destroy 

     end
   end
 end
end