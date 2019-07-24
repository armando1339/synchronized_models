module SynchronizedModels
  class Configuration
    attr_accessor :adapter, :encoding, :host, :username, :password, :database

    def initialize
      @adapter = 'postgresql'
      @encoding = 'utf8'
      @host = nil
      @username = nil
      @password = nil
      @database = nil
    end
  end
end