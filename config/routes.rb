Rails.application.routes.draw do
  resource :directions, :only => [] do
    member do
      get 'shortest_path'
      get 'estimated_time'
    end
  end
end
