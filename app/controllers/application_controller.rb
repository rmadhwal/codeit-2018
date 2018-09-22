require 'json'
class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def two_dinosaurs
    n = params["number_of_types_of_food"]
    array1 = params["calories_for_each_type_for_raphael"]
    array2 = params["calories_for_each_type_for_leonardo"]
    d = params["maximum_difference_for_calories"]
    sum1 = array1.inject(0, :+)
    sum2 = array2.inject(0, :+)
    s1 = Array.new(sum1+1, 0)
    s2 = Array.new(sum2+1, 0)
    for i in 0..(2**n-1) do
      sum = i.to_s(2).rjust(n, "0").split("").map.with_index do |el, index|
        el == "1" ? array1[index] : 0
      end.inject(0, :+)
      s1[sum] += 1
    end
    for i in 0..(2**n-1) do
      sum = i.to_s(2).rjust(n, "0").split("").map.with_index do |el, index|
        el == "1" ? array2[index] : 0
      end.inject(0, :+)
      s2[sum] += 1
    end
    result = s1.map.with_index do |el, index|
      total = 0
      for i in (-1*d)..d
        total += s2[index+i] if index+i>=0
      end
      el*total
    end.inject(0, :+)
    return {"result": (result) }
  end
end