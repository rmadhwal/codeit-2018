Rails.application.routes.draw do
  post '/two-dinosaurs' => 'application#two_dinosaurs'
  post '/prime-sum' => 'application#prime_sum'
end