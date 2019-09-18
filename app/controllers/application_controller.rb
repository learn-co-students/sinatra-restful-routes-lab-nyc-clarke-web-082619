require "pry"
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get "/recipes/new" do
    erb :new
  end

  post "/recipes" do
    @recipe = Recipe.create(params[:recipe])
    #binding.pry
    redirect to "/recipes/#{@recipe.id}"
  end

  get "/recipes" do
     @recipes = Recipe.all 
     erb :index
    #binding.pry
  end

  get "/recipes/:id" do
     @recipe = Recipe.find(params[:id])
     erb :show
  end

  delete "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
    redirect "/recipes"
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id]).update(params[:recipe])
    redirect to "/recipes/#{@recipe.id}"
  end

end
