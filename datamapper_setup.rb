require 'data_mapper'

DataMapper.setup(:default, 'postgres://jayway@localhost/messages')
DataMapper::Logger.new($stdout, :debug)
DataMapper.auto_upgrade!
DataMapper.finalize
