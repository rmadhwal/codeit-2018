Rails.application.routes.draw do
  post '/two-dinosaurs' => 'application#two_dinosaurs'
  post '/prime-sum' => 'application#prime_sum'
  post '/customers-and-hotel/minimum-distance' => 'application#minimum_distance'
  post '/customers-and-hotel/minimum-camps' => 'application#minimum_camps'
  post '/imagesGPS' => 'application#images_gps'
end