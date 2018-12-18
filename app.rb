require 'sinatra/base'
# require_relative './lib/message'

class MessageApp < Sinatra::Base
  enable :sessions

  before do
    session[:history]==nil ? session[:history] = [] : session[:history]
  end

  get '/' do
    @messages = session[:history]
    erb :index
  end

  post '/new-message' do
    session[:history] << { Time.new => params[:message] }
    redirect '/'
  end

  run! if app_file == $0
end
