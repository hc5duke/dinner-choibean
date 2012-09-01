module MealsHelper
  DAY_MARKERS = %w(M T W H F S N)
  def weekdays; DAY_MARKERS; end

  def nice_print(date)
    date.strftime '%-1m/%-1d'
  end

end
