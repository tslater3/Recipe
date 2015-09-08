class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all

    @recipe_array = []
    @recipes.each do |name|
      @recipe_array << name.name
    end
  end


  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @user = User.where(id: params[:user_id])
  end

  def create
    @user = User.where(id: params[:id])
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to user_path(@recipe.user_id)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to user_path(@recipe.user_id)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:user_id, :name, :prep_time, :occasion, :description, :ethnicity)
    end


end
