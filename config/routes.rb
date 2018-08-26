Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do

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

    # notebook data
    post '/notebook_data' => 'notebook_data#create'

    # students
    post '/students' => 'students#create'
    # patch '/students/:id' => 'students#update'
    # delete '/students/:id' => 'students#destroy'

    # teachers
    post '/teachers' => 'teachers#create'
    # patch '/teachers/:id' => 'teachers#update'
    # delete '/teachers/:id' => 'teachers#destroy'

    # teacher sessions
    post '/teacher_sessions' => 'teacher_sessions#create'

    # student sessions
    post '/student_sessions' => 'student_sessions#create'

    # student teacher pairs
    # get '/student_teacher_pairs' => 'student_teacher_pairs#index'
    get '/student_teacher_pairs/:id' => 'student_teacher_pairs#show'
    post '/student_teacher_pairs' => 'student_teacher_pairs#create'
    # patch '/student_teacher_pairs/:id' => 'student_teacher_pairs#update'
    delete '/student_teacher_pairs/:id' => 'student_teacher_pairs#destroy'
  end
end
