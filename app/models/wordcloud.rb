class Wordcloud < ActiveRecord::Base

def self.cloud(input)

  input ||= "I love thee, I love thee not"

  response = Unirest.post "https://gatheringpoint-word-cloud-maker.p.mashape.com/index.php",
    headers:{
      "X-Mashape-Key" => "dY7VxOzIykmshvAKH0BNohS7g5Afp1taVT3jsnJipvlBNDXdtN",
      "Content-Type" => "application/x-www-form-urlencoded",
      "Accept" => "application/json"
    },
    parameters:{
      "config" => "n/a",
      "height" => 400,
      "textblock" => "#{input}",
      "width" => 600
    }

    response.body["url"]
    
  end
end