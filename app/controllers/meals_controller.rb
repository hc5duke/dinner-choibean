class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def create
    @meal = Meal.new(params[:meal])

    if @meal.save
      redirect_to @meal, notice: 'Meal was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @meal = Meal.find(params[:id])

    if @meal.update_attributes(params[:meal])
      redirect_to @meal, notice: 'Meal was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy

    redirect_to meals_url
  end
end
