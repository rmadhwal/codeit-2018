Rails.application.routes.draw do
  post '/two-dinosaurs' => 'application#two_dinosaurs'
  post '/prime-sum' => 'application#prime_sum'
  post '/customers-and-hotel/minimum-distance' => 'application#minimum_distance'
end