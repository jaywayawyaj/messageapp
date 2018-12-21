require 'data_mapper'

DataMapper.setup(:default, "postgres://jayway@localhost/messageapp_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
ENV['RACK_ENV'] == 'test' ? DataMapper.auto_migrate! : DataMapper.auto_upgrade!
