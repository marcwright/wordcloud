class Wordcloud < ActiveRecord::Base

def self.cloud(input)

  input ||= Song.last.lyrics

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