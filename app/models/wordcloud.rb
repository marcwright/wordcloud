class Wordcloud < ActiveRecord::Base

def self.cloud(input)

  input ||= "I am he as you are he as you are me
And we are all together
See how they run like pigs from a gun see how they fly
I'm crying

Sitting on a cornflake waiting for the van to come
Corporation teeshirt, stupid bloody Tuesday
Man you been a naughty boy. You let your face grow long
I am the eggman, they are the eggmen
I am the walrus, goo goo goo joob

Mister City Policeman sitting, pretty little policemen in a row
See how they fly like Lucy in the sky, see how they run
I'm crying, I'm crying
I'm crying, I'm crying

Yellow matter custard dripping from a dead dog's eye
Crabalocker fishwife pornographic priestess
Boy you been a naughty girl, you let your knickers down
I am the eggman, they are the eggmen
I am the walrus, goo goo goo joob

Sitting in an English garden waiting for the sun
If the sun don't come
You get a tan from standing in the English rain
I am the eggman, they are the eggmen
I am the walrus, goo goo goo joob goo goo goo goo joob

Expert textpert choking smokers
Don't you think the joker laughs at you? (Ha ha ha! He he he! Ha ha ha!)
See how they smile like pigs in a sty, see how they snied
I'm crying

Semolina pilchard climbing up the Eiffel Tower
Elementary penguin singing Hare Krishna
Man you should have seen them kicking Edgar Alan Poe
I am the eggman, they are the eggmen
I am the walrus, goo goo goo joob goo goo goo joob
Goo goo goo joob goo goo goo joob
Goo gooooooooooo jooba jooba jooba jooba jooba jooba
Jooba jooba
Jooba jooba
Jooba jooba" 

  response = Unirest.post "https://gatheringpoint-word-cloud-maker.p.mashape.com/index.php",
    headers:{
      "X-Mashape-Key" => "dY7VxOzIykmshvAKH0BNohS7g5Afp1taVT3jsnJipvlBNDXdtN",
      "Content-Type" => "application/x-www-form-urlencoded",
      "Accept" => "application/json"
    },
    parameters:{
      "config" => "n/a",
      "height" => 450,
      "textblock" => "#{input}",
      "width" => 750
    }

    response.body["url"].gsub('ttp', 'ttps')
    
  end
end