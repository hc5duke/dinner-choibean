class MealsController < ApplicationController
  def index
    Time.zone = 'Pacific Time (US & Canada)'
    @today = Time.zone.now.to_date
    @first = @today.beginning_of_week - 1.week
    @last  = @today.end_of_week + 1.week
    @last_week = (@first..@first.end_of_week)
    @this_week = (@today.beginning_of_week..@today.end_of_week)
    @next_week = (@last.beginning_of_week..@last)

    @meals = {}
    Meal.where('date >= ? and date <= ?', @first, @last).each do |meal|
      @meals[meal.date] = meal
    end
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
