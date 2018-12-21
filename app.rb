
ENV["RACK_ENV"] ||= 'development'

require 'data_mapper'
require 'pry'
require 'sinatra/base'
require_relative './lib/messages_db.rb'
load './config/datamapper_setup.rb'

class MessageApp < Sinatra::Base
  enable :sessions

  get '/' do
    @messages = Message.all
    erb :index
  end

  post '/new-message' do
    Message.create(
      :text => params[:message],
    )
    redirect '/'
  end

  get '/messages/:id' do |id|
    @messages = Message.get!(id.to_i)
    erb :message
  end

  run! if app_file == $0
end
