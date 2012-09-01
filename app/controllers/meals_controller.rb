class MealsController < ApplicationController
  def index
    Time.zone = 'Pacific Time (US & Canada)'
    @today = Time.zone.now.to_date

    if params[:date]
      center = Date.parse(params[:date]) rescue @today
    else
      center = @today
    end

    @first = center.beginning_of_week - 1.week
    @last  = center.end_of_week + 1.week
    @last_week = (@first..@first.end_of_week)
    @this_week = (center.beginning_of_week..center.end_of_week)
    @next_week = (@last.beginning_of_week..@last)

    @meals = {}
    Meal.where('date >= ? and date <= ?', @first, @last).each do |meal|
      @meals[meal.date] = meal
    end
    @places = histogram(Meal.all.map(&:name))
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
      redirect_to action: 'index'
    else
      render action: "new"
    end
  end

  def update
    @meal = Meal.find(params[:id])

    if @meal.update_attributes(params[:meal])
      redirect_to action: 'index'
    else
      render action: "edit"
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy

    redirect_to meals_url
  end

  private

  def histogram(array)
    hist = Hash.new(0)
    array.each{ |i| hist[i] += 1 }
    hist
  end
end
