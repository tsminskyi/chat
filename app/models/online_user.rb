class OnlineUser < ApplicationRecord
  belongs_to :user

  after_create_commit { broadcast_append_to "online_users" }
  after_destroy_commit { broadcast_remove_to "online_users", target: self }
end
