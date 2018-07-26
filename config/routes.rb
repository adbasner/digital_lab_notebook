Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    # classrooms
    get '/classrooms' => 'classrooms#index'

    # courses
    get '/courses' => 'courses#index'

    # labs
    get '/labs' => 'labs#index'

    # notebook sections
    get '/notebook_sections' => 'notebook_sections#index'

    # students
    get '/students' => 'students#index'

    # teachers
    get '/teachers' => 'teachers#index'
  end
end
