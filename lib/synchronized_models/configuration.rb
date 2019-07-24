module SynchronizedModels
  class Configuration
    attr_accessor(
      :adapter,
      :encoding,
      :host,
      :username,
      :password,
      :database,
      :kinedu_url
    )

    def initialize
      @adapter = nil
      @encoding = 'utf8'
      @host = nil
      @username = nil
      @password = nil
      @database = nil
      @kinedu_url = nil
    end
  end
end