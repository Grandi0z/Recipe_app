module RecipesHelper
  def minutes_to_hours(minutes)
    return "#{minutes}mins" unless minutes > 59

    hours = minutes / 60
    minute = minutes % 60
    return "#{hours}h #{minute}mins" unless minutes.zero?

    "#{hours}h"
  end
end
