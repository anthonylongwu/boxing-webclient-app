class Boxer 

attr_accessor :id, :first_name, :last_name, :weight_class, :current_record, :titles_held, :home_town

  def initialize(hash)
    @id = hash["id"]
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @weight_class = hash["weight_class"]
    @current_record = hash["current_record"]
    @titles_held = hash["titles_held"]
    @home_town = hash["home_town"]
  end


  def self.all
    boxers = []
    boxer_hashes = Unirest.get("http://localhost:3000/api/v1/boxers.json").body
    boxer_hashes.each do |boxer_hash|
     boxers << Boxer.new(boxer_hash)
    end
    return boxers 
  end

  def self.find(id)
    boxer_hash = Unirest.get("http://localhost:3000/api/v1/boxers.json").body
    Boxer.new(boxer_hash)
  end

  def self.create(attributes)
    boxer_hash = Unirest.post("http://localhost:3000/api/v1/boxers.json", headers: {"Accept" => "application/json"}, parameters: attributes).body
    Boxer.new(boxer_hash)
  end
  
  def update(attributes)
    boxer_hash = Unirest.patch("http://localhost:3000/api/v1/boxers.json/#{params[:id]}.json", headers: {
    "Accept" => "application/json"}, parameters: attributes).body
    Boxer.new(boxer_hash)
  end

  def destroy
    Unirest.delete("http://localhost:3000/api/v1/boxers.json/#{id}.json").body
    redirect_to '/boxers'
  end

  




end