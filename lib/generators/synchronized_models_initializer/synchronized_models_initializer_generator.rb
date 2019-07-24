class SynchronizedModelsInitializerGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def copy_initializer_file
    copy_file 'synchronized_models.rb', 'config/initializers/synchronized_models.rb'
  end
end
