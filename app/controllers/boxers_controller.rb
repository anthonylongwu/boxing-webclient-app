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
    @boxer = Boxer.create(first_name: params[:first_name], last_name: params[:last_name], weight_class: params[:weight_class], current_record: params[:current_record], titles_held: params[:titles_held], home_town: params[:home_town])
    redirect_to "/boxers/#{@boxer.id}"
  end

  def edit
    @boxer = Boxer.find(params[:id])
  end

  def update

    @boxer = Boxer.find(params[:id])
    @boxer.update(first_name: params[:first_name], last_name: params[:last_name], weight_class: params[:weight_class], current_record: params[:current_record], titles_held: params[:titles_held], home_town: params[:home_town])
    
    redirect_to "/boxers/#{@boxer.id}"
  end

  def destroy
    @boxer = Boxer.find(params[:id])
    @boxer.destroy

     Unirest.delete("http://localhost:3000/boxers/#{params[:id]}.json").body
    redirect_to "/boxers"
  end




end



  




