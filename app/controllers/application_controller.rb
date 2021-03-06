require 'json'
require 'prime'
require "net/http"
require "open-uri"

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def two_dinosaurs
    mod_val = 100000123
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
        s1[i]=(s1[i]+s1[i-array1[j].to_i])%mod_val
        i = i - 1
      end
    end
    t=0
    for k in 0..n-1 do
      t+=array2[k].to_i
      i = t
      while i>=array2[k].to_i do
        s2[i]=(s2[i]+s2[i-array2[k].to_i])%mod_val
        i = i - 1
      end
    end
    summation_array1 = Array.new(sum1+2, 0)
    summation_array1.each.with_index do |_, index|
      if index != 0
        summation_array1[index] = s1[index-1] + summation_array1[index-1]
      end
    end
    result = s2.map.with_index do |el, index|
      (el * (summation_array1[[sum1+1, index+d+1].min] - summation_array1[[0, [index - d, sum1 + 1].min].max]+mod_val)%mod_val)%mod_val
    end.inject(0, :+)
    render json: {"result": (result % mod_val) }
  end

  def prime_sum
    render json: find_prime_component(params["input"])
  end

  def minimum_distance
    xaxis = params["_json"].sort
    diff = 9999999999999
    xaxis.each.with_index do |el, index|
      next if index == (xaxis.size - 1)
      if(xaxis[index+1] - el < diff)
        diff = xaxis[index+1] - el
      end
    end
    render json: {"answer": diff }
  end

  def minimum_camps
    mixed_array = params["_json"].map do |el|
      [[el["pos"]-el["distance"], 0].max, el["pos"]+el["distance"]]
    end
    puts "mixed array"
    p mixed_array
    camps_locations = []
    mixed_array.each do |el|
      flag = false
      camps_locations.each do |sub_el|
        if sub_el[0] <= el[0] && el[0] <= sub_el[1]
          flag = true
          sub_el[0] = el[0]
          if el[1] <= sub_el[1]
            sub_el[1] = el[1]
          end
        elsif el[0] < sub_el[0]
          if el[1] <= sub_el[1] && sub_el[0] <= el[1]
            flag = true
            sub_el[1] = el[1]
          elsif sub_el[1] <= el[1]
            flag = true
          end
        end
      end
      puts "camps locations"
      p camps_locations
      camps_locations.push(el) unless flag
    end
    render json: {"answer": camps_locations.size }
  end

  private


  def find_prime_component(x)
    for z in (x).downto(0)
      if Prime.prime?(z)
        if z == x
          return [x]
        elsif z == x - 1
          next
        else
          return find_prime_component(x - z).unshift(z)
        end
      end
    end
  end
end