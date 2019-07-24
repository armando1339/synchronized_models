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
  config.adapter    =   ENV['EXTERNAL_DB_ADAPTER']
  config.host       =   ENV['EXTERNAL_DB_HOST']
  config.username   =   ENV['EXTERNAL_DB_USERNAME']
  config.password   =   ENV['EXTERNAL_DB_PASSWORD']
  config.database   =   ENV['EXTERNAL_DB_NAME']
end