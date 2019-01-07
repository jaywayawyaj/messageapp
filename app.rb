
ENV["RACK_ENV"] ||= 'development'

require 'data_mapper'
require 'pry'
require 'sinatra/base'
require_relative './lib/message.rb'
require_relative './lib/tag.rb'
require_relative './lib/tagging.rb'
load './config/datamapper_setup.rb'

class MessageApp < Sinatra::Base
  enable :sessions

  get '/' do
    @message = Message.all
    erb :index
  end

  post '/new-message' do
    message = Message.create(:text => params[:message])
    tag = Tag.first_or_create(:text => params[:tag])
    message.tags << tag
    message.save
    redirect '/'
  end

  get '/messages/:id' do |id|
    @message = Message.get!(id.to_i)
    binding.pry
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

  post "/delete-message/:id" do |id|
    message = Message.get!(id.to_i)
    message.taggings.destroy
    message.destroy
    redirect '/'
  end

  run! if app_file == $0
end
