class Account < ApplicationRecord
  sync_remote_model model_name: :user, table_name: :users
end
