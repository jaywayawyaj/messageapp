
ENV["RACK_ENV"] ||= 'development'

require 'data_mapper'
require 'pry'
require 'sinatra/base'
require_relative './lib/messages_db.rb'
load './config/datamapper_setup.rb'

class MessageApp < Sinatra::Base
  enable :sessions

  get '/' do
    @message = Message.all
    erb :index
  end

  post '/new-message' do
    Message.create(
      :text => params[:message],
    )
    redirect '/'
  end

  get '/messages/:id' do |id|
    @message = Message.get!(id.to_i)
    erb :display_message
  end

  get '/edit-message/:id' do |id|
    @message = Message.get!(id.to_i)
    erb :edit
  end

  post '/update-message/:id' do |id|
    message = Message.get!(id.to_i)
    message.update(:text => params[:message])
    redirect"/messages/#{id}"
  end

  run! if app_file == $0
end
