require 'sinatra/base'
#require './lib/message'
require 'data_mapper'
require_relative 'messages_db.rb'
load 'datamapper_setup.rb'

class MessageApp < Sinatra::Base
  enable :sessions

  before do
    session[:id] ||= 1
  end

  get '/' do
    @messages = Message.all
    erb :index
  end

  post '/new-message' do
    Message.create(
      :text => params[:message],
      :time => Time.now
    )
    redirect '/'
  end

  get '/messages/:id' do |id|
    @messages = Message.get!(id.to_i)
    erb :message
  end


  # put '/todo/:id/complete' do |id|
  #    #raise 'something'
  #    todo = Todo.get!(id)
  #    todo.complete = true
  #    todo.save

    #Show each to do
    # get '/todo/:id' do |id|
    #   @todo = Todo.get!(id)
    #   erb :'todos/show'
    # end

  run! if app_file == $0
end
