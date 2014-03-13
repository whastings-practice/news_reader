class AddFavoriteToFeedSubscription < ActiveRecord::Migration
  def change
    add_column :feed_subscriptions, :favorite, :boolean, default: false
    add_index :feed_subscriptions, :favorite
  end
end
