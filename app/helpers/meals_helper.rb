module MealsHelper
  DAY_MARKERS = %w(M T W H F S N)

  def nice_print(date)
    "#{date.strftime '%01m/%-1d'} #{DAY_MARKERS[date.days_to_week_start]}"
  end
end
