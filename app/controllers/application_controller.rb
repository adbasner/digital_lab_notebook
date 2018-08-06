class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  # Student
  # --------------------------------------------
  def current_student
    if request.headers['Authorization'].present?
      token = request.headers['Authorization'].split(' ').last
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: 'HS256' }
        )
        Student.find_by(id: decoded_token[0]["student"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_student

  def authenticate_user
    unless current_student
      render json: {}, status: :unauthorized
    end
  end

  # Teacher
  # --------------------------------------------

  def current_teacher
    if request.headers['Authorization'].present?
      token = request.headers['Authorization'].split(' ').last
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: 'HS256' }
        )
        Teacher.find_by(id: decoded_token[0]["teacher"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  helper_method :current_teacher

  def authenticate_user
    unless current_teacher
      render json: {}, status: :unauthorized
    end
  end
  
end
