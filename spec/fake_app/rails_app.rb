FakeApp = Class.new(Rails::Application)
FakeApp.config.session_store :cookie_store, key: '_myapp_session'
FakeApp.config.eager_load = false
FakeApp.config.hosts << 'www.example.com' if FakeApp.config.respond_to?(:hosts)
FakeApp.config.root = File.dirname(__FILE__)
FakeApp.initialize!

FakeApp.routes.draw do
  resources :users
end

class ApplicationController < ActionController::Base
end

class UsersController < ApplicationController
  def create
    render json: { id: 1, nickname: 'willnet' }
  end

  def update
    raise ActionController::BadRequest if params[:id] == '0'

    render json: { id: 1 }
  end
end
