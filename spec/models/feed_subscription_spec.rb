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

require 'spec_helper'

describe FeedSubscription do
  pending "add some examples to (or delete) #{__FILE__}"
end
