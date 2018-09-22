require 'json'
class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def two_dinosaurs
    n = params["number_of_types_of_food"]
    r = params["calories_for_each_type_for_raphael"]
    l = params["calories_for_each_type_for_leonardo"]
    d = params["maximum_difference_for_calories"]
    puts("n" + JSON.pretty_generate(n))
    puts("r" + JSON.pretty_generate(r))
    puts("l" + JSON.pretty_generate(l))
    puts("d" + JSON.pretty_generate(d))
    return {"result": 8}
  end
end