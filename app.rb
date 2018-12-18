require 'sinatra/base'
require './lib/message'

class MessageApp < Sinatra::Base
  enable :sessions

  before do
    session[:id] ||= 1
  end

  get '/' do
    session[:history] ||= []
    @messages = session[:history]
    erb :index
  end

  post '/new-message' do
    id = session[:id]
    message = Message.new(params[:message], id)
    session[:history] << message
    id += 1
    session[:id] = id
    redirect '/'
  end

  get '/messages/:id' do
    @messages = session[:history]
    @id = params[:id].to_i
    erb :message
  end

  run! if app_file == $0
end
