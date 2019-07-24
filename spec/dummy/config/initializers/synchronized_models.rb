# => This initializer contains the references
# to the external database. The assigned values
# depend on the environment that is running
# (develpment, staging or production).
#
SynchronizedModels.configure do |config|
  # => optional parameter that 
  # contain the values 'utf8'
  # by default
  #
  # config.encoding = 'utf8'
  #
  # => Required parameters without
  # default values.
  #
  config.adapter    =   'mysql2' # ENV['EXTERNAL_DB_ADAPTER']
  config.host       =   'localhost' # ENV['EXTERNAL_DB_HOST']
  config.username   =   'root' # ENV['EXTERNAL_DB_USERNAME']
  config.password   =   '' # ENV['EXTERNAL_DB_PASSWORD']
  config.database   =   'kinedu_development' # ENV['EXTERNAL_DB_NAME']
end

User = Class.new

class User; end