require 'json'
class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  def two_dinosaurs
    puts JSON.pretty_generate(params)
    return {"result": 8}
  end
end