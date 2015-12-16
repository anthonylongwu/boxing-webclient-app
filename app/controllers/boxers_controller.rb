class BoxersController < ApplicationController
  
  def index
    @boxers = Boxer.all
  end

  def show
    @boxer = Boxer.find(params[:id])
  end
  
  def new
  end


  def create
    @boxer = Unirest.post("http://localhost:3000/boxers.json", headers: {
      "Accept" => "application/json"}, parameters: {first_name: params[:first_name], last_name: params[:last_name], weight_class: params[:weight_class], current_record: params[:current_record], titles_held: params[:titles_held], home_town: params[:home_town]}).body

    redirect_to "/boxers/#{@boxer["id"]}"
  end

  def edit
    @boxer = Unirest.get("http://localhost:3000/boxers/#{params[:id]}.json").body
  end

  def update
    @boxer = Unirest.patch("http://localhost:3000/boxers/#{params[:id]}.json", headers: {
      "Accept" => "application/json"}, parameters: {first_name: params[:first_name], last_name: params[:last_name], weight_class: params[:weight_class], current_record: params[:current_record], titles_held: params[:titles_held], home_town: params[:home_town]}).body
        redirect_to "/boxers/#{@boxer["id"]}"
  end

  def destroy
    Unirest.delete("http://localhost:3000/boxers/#{params[:id]}.json").body
    redirect_to "/boxers"
  end
end



  




#edit update destroy 