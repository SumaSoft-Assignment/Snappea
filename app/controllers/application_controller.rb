class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def validate_api
    token = request.headers[:Authorization]
    render json: {success: false, error: 'Invalid params', data: []}, status: 422 and return unless token.present?
    user = User.find_by(guid: token)
    render json: { success: false, error: 'Invalid API KEY', data: []}, status: 404 unless user.present?
  end
end
