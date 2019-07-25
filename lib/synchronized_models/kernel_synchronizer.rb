module Kernel
  #
  # => This method is executed as a callback to generate an
  # ActiveRecord::Base constant, within the scope of the same
  # model where it is called, which will be connected to a
  # second database.
  #
  # Example:
  #
  # class Account < ActiveRecord::Base
  #   sync_remote_model model_name: :account
  # end
  #
  # Then:
  #
  # Account::RemoteAccount.last
  # Account::RemoteAccount.create name: "Some name"
  #
  # Or:
  #
  # class Account < ActiveRecord::Base
  #   sync_remote_model model_name: :user
  # end
  #
  # Then:
  #
  # Account::RemoteUser.last
  # Account::RemoteUser.create email: user@example.com, password: 123456
  #
  # Or:
  #
  # class Account < ActiveRecord::Base
  #   sync_remote_model model_name: :user, table_name: :admins
  # end
  #
  # Then:
  #
  # Account::RemoteUser.last
  # Account::RemoteUser.create email: user@example.com, password: 123456
  #
  def sync_remote_model(*args)
    configure_sync_constant(*args) do |const|
      yield const if block_given?
    end
  end

  private

  # => Create an ActiveRecord::Base constant and add
  # the remote database configuration that was configured
  # in config/initializers/synchronized_models.rb
  #
  def configure_sync_constant(args={})
    return false unless ancestors.include? ActiveRecord::Base

    initialize_sync_constant args.fetch(:model_name) do |conts|
      conts.send :table_name=, select_table_name(args).to_s.tableize
      conts.establish_connection database_adapter
    end

    yield synchronized_constant args.fetch(:model_name)
  end

  # => *
  def initialize_sync_constant(model_name)
    const_set(
      "Remote#{model_name.to_s.camelcase}",
      Class.new(ActiveRecord::Base)
    )

    yield synchronized_constant(model_name)
  end
  
  # => *
  def synchronized_constant(model_name)
    "#{name}::Remote#{model_name.to_s.camelcase}".constantize
  end

  # => *
  def select_table_name(args)
    args.include?(:table_name) ? args.fetch(:table_name) : args.fetch(:model_name)
  end

  # => *
  def database_adapter
    SynchronizedModels.configuration.instance_values
  end
end