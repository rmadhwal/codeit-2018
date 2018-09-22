require 'json'
class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def two_dinosaurs
    n = params["number_of_types_of_food"]
    array1 = params["calories_for_each_type_for_raphael"]
    array2 = params["calories_for_each_type_for_leonardo"]
    d = params["maximum_difference_for_calories"]
    sum1 = 0
    sum2 = 0
    array1.each do |el|
      sum1 += el
    end
    array2.each do |el|
      sum2 += el
    end
    s1 = Array.new(sum1+1, 0)
    s2 = Array.new(sum2+1, 0)
    s1[0] = 1
    s2[0] = 1
    s=0
    for j in 0..n do
        s+=array1[j]
        i = s
        while i>=a[j] do
          x[i]=(x[i]+x[i-a[j]])
          i = i - 1
        end
    end
    t=0
    for k in 0..n do
      t+=array2[k]
      i = t
      while i>=a[k] do
        x[i]=(x[i]+x[i-a[k]])
        i = i - 1
      end
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