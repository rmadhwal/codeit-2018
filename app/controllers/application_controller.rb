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
    s1[0] = 1
    s2[0] = 1
    s=0
    for j in 0..n-1 do
      s+=array1[j].to_i
      i = s
      while i>=array1[j].to_i do
        s1[i]=(s1[i]+s1[i-array1[j].to_i])
        i = i - 1
      end
    end
    for k in 0..n-1 do
      t+=array2[k].to_i
      i = t
      while i>=array2[k].to_i do
        s2[i]=(s2[i]+s2[i-array2[k].to_i])
        i = i - 1
      end
    end
    result = s1.map.with_index do |el, index|
      total = 0
      for i in (-1*d)..d
        total += s2[index+i] if (index+i>=0 && index+i<=sum2)
      end
      el*total
    end.inject(0, :+)
    return {"result": (result) }
  end
end