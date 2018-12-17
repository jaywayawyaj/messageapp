require 'sinatra/base'

class MessageApp < Sinatra::Base

  get '/' do
    erb :index
  end

  run! if app_file == $0
end
