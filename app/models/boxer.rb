class Boxer 

attr_accessor :first_name, :last_name, :weight_class, :current_record, :titles_held, :home_town

  def initialize(hash)
    @first_name = hash["first_name"]
    @last_name = hash["last_name"]
    @weight_class = hash["weight_class"]
    @current_record = hash["current_record"]
    @titles_held = hash["titles_held"]
    @home_town = hash["home_town"]
  end


  def self.all
    boxers = []
    boxer_hashes = Unirest.get("http://localhost:3000/boxers.json").body
    boxer_hashes.each do |boxer_hash|
     boxers << Boxer.new(boxer_hash)
    end
    return boxers 
  end

  def self.find(id)
    boxer_hash = Unirest.get("http://localhost:3000/boxers/#{id}.json").body
    Boxer.new(boxer_hash)
  end








end