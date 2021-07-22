namespace :db do
    desc "Populate local/staging data for testing purpose"
     task populate: :environment do

        character_name = [
            "Arturo", 
            "Mickey", 
            "Dumbo", 
            "Alice", 
            "Tod"
        ]

        #GENRES
        adventure_genre = Genre.create!(
            image_url: "image_url_genre",
            name: "adventure"
        )

        drama_genre = Genre.create!(
            image_url: "image_url_genre",
            name: "drama"
        )

        fantasy_genre = Genre.create!(
            image_url: "image_url_genre",
            name: "fantasy"
        )

        action_genre = Genre.create!(
            image_url: "image_url_genre",
            name: "action"
        )

        #MOVIES
        fantasia = Movie.create!(
            genre: fantasy_genre,
            image_url: "image_url_movie",
            title: "Fantasia",
            date_of_creation: Date.current,
            rating: 4
        )

        dumbo = Movie.create!(
            genre: drama_genre,
            image_url: "image_url_movie",
            title: "Dumbo",
            date_of_creation: Date.current,
            rating: 5
        )

        foxAndHound = Movie.create!(
            genre: drama_genre,
            image_url: "image_url_movie",
            title: "The Fox and the Hound",
            date_of_creation: Date.current,
            rating: 4
        )

        aliceWonderland = Movie.create!(
            genre: adventure_genre,
            image_url: "image_url_movie",
            title: "Alice in Wonderland",
            date_of_creation: Date.current,
            rating: 5
        )

        swordInStone = Movie.create!(
            genre: action_genre,
            image_url: "image_url_movie",
            title: "The Sword In The Stone",
            date_of_creation: Date.current,
            rating: 4
        )

        swordInStone = Movie.create!(
            genre: action_genre,
            image_url: "image_url_movie",
            title: "The Sword In The Stone",
            date_of_creation: Date.current,
            rating: 4
        )





        def get_movie_for(name)
            case name
            when "Arturo"  
                Movie.find_by(title: "The Sword In The Stone")
            when "Mickey"
                Movie.find_by(title: "Fantasia")
            when "Dumbo" 
                Movie.find_by(title: "Dumbo")
            when "Alice"
                Movie.find_by("Alice in Wonderland")
            when "Tod" 
                Movie.find_by(title: "The Fox and the Hound")
            end
        end

        def get_date_of_creation_for(title)
            case title
            when "The Sword In The Stone"
                "25/12/1963"
            when "Fantasia"
                "13/11/1940"
            when "Dumbo"
                "29/03/2019"  
            when "Alice in Wonderland"
                "5/03/2010"  
            when "The Fox and the Hound"
                "10/07/1981" 
            end
        end

      # Characters

      character_name.count.times do |i|
        name = character_names[i]
        movie = get_movie_for(name)

        
      Character.create!(
       movie: movie,
       image_url: "image_url_character",
       name: name,
       age: 12,
       weight: 120.5,
       history: "History"
      )
     end
   end
end
   
   