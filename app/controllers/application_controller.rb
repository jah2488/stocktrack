# typed: true
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :request_basic_auth

  def request_basic_auth
    unless ENV['BASIC_AUTH_USERNAME'].blank?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USERNAME'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end
