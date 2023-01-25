class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  scope :custom_display, ->{order(:created_at).last(10)}

  after_create_commit { broadcast_append_to 'messages' }
end
