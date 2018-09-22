require 'json'
class ApplicationController < ActionController::Base
  def two_dinosaurs(jsonPayload)
    puts JSON.pretty_generate(jsonPayload)
  end
end