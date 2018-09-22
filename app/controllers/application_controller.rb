require 'json'
class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def two_dinosaurs
    n = params["number_of_types_of_food"]
    array1 = params["calories_for_each_type_for_raphael"]
    array2 = params["calories_for_each_type_for_leonardo"]
    d = params["maximum_difference_for_calories"]
    number_of_ways = 0
    number_of_variations = (2**n)-1
    for x in 0..number_of_variations do
      suma = 0
      y = x.to_s(2).rjust(n, "0")
      z = array1.each.with_index do |el, index|
        if y[index] == '1'
          suma = suma + el.to_i
        end
      end
      for x2 in 0..number_of_variations do
        sumb = 0
        y2 = x2.to_s(2).rjust(n, "0")
        z2 = array2.each.with_index do |el, index|
          if y2[index] == '1'
            sumb = sumb + el.to_i
          end
        end
        if (suma-sumb).abs <= d
          number_of_ways = number_of_ways + 1
        end
      end
    end
    return {"result": ((number_of_ways) % 100000123) }
  end
end