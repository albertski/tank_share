class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User', counter_cache: :followees_count
  belongs_to :followed, class_name: 'User', counter_cache: :followers_count

  validates :follower_id, uniqueness: { scope: :followed_id }
end
