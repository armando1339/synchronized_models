require 'synchronized_models/kernel_synchronizer'
require 'synchronized_models/configuration'

module SynchronizedModels
  attr_accessor :configuration

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end