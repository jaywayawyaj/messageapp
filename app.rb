require 'sinatra/base'
require_relative './lib/message'

class MessageApp < Sinatra::Base
  enable :sessions

  get '/' do
    p session[:history]
    @message = session[:history]
    erb :index
  end

  post '/new-message' do
    @messages = []
    @messages << session[:history]
    @messages << [params[:Message]]
    session[:history] = @messages
    p session[:history]
    redirect '/'
  end

  run! if app_file == $0
end
