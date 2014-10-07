Rails.application.routes.draw do
  resource :directions, :only => [] do
    member do
      get 'some_path'
      get 'shortest_path'
      get 'estimated_time'
    end
  end
end
