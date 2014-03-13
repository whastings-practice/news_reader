# == Schema Information
#
# Table name: feed_subscriptions
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  feed_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  favorite   :boolean          default(FALSE)
#

class FeedSubscription < ActiveRecord::Base
  validates :user_id, :feed_id, presence: true

  belongs_to :user
  belongs_to :feed
end
