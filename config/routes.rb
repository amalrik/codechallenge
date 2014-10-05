Rails.application.routes.draw do
  resource :directions, :only => [] do
    member do
      get 'simple_path'
    end
  end
end
