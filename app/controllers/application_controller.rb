require 'json'
class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def two_dinosaurs
    n = JSON.parse(params[:number_of_types_of_food])
    array1 = JSON.parse(params[:calories_for_each_type_for_raphael])
    array2 = JSON.parse(params[:calories_for_each_type_for_leonardo])
    d = JSON.parse(params[:maximum_difference_for_calories])
    puts array1.class.name
    return {"result": ( 100000123) }
  end
end