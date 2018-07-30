Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    # classrooms
    get '/classrooms' => 'classrooms#index'
    get '/classrooms/:id' => 'classrooms#show'
    post '/classrooms' => 'classrooms#create'
    patch '/classrooms/:id' => 'classrooms#update'
    delete '/classrooms/:id' => 'classrooms#destroy'

    # courses
    get '/courses' => 'courses#index'
    get '/courses/:id' => 'courses#show'
    post '/courses' => 'courses#create'
    patch '/courses/:id' => 'courses#update'
    delete '/courses/:id' => 'courses#destroy'

    # labs
    get '/labs' => 'labs#index'
    get '/labs/:id' => 'labs#show'
    post '/labs' => 'labs#create'
    patch '/labs/:id' => 'labs#update'
    delete '/labs/:id' => 'labs#destroy'

    # notebook sections
    get '/notebook_sections' => 'notebook_sections#index'
    get '/notebook_sections/:id' => 'notebook_sections#show'
    post '/notebook_sections' => 'notebook_sections#create'
    patch '/notebook_sections/:id' => 'notebook_sections#update'
    delete '/notebook_sections/:id' => 'notebook_sections#destroy'

    # students
    get '/students' => 'students#index'
    get '/students/:id' => 'students#show'
    post '/students' => 'students#create'
    patch '/students/:id' => 'students#update'
    delete '/students/:id' => 'students#destroy'

    # teachers
    get '/teachers' => 'teachers#index'
    get '/teachers/:id' => 'teachers#show'
    post '/teachers' => 'teachers#create'
    patch '/teachers/:id' => 'teachers#update'
    delete '/teachers/:id' => 'teachers#destroy'
  end
end
