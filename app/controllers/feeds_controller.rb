class FeedsController < ApplicationController
  include SessionsHelper

  before_action :require_signed_in

  def index
    @feeds = current_user.feeds

    @feeds.each do |feed|
      set_feed_favorite(feed)
    end

    @feeds_json = render_to_string(template: 'feeds/index.json.jbuilder')

    respond_to do |format|
      format.html { render :index }
      format.json { render 'feeds/index' }
    end
  end

  def show
    @feed = Feed.find(params[:id])
    @feed.reload
    set_feed_favorite(@feed)
    @entries = @feed.entries
    render 'feeds/show'
  end

  def create
    feed = Feed.find_or_create_by_url(feed_params[:url])
    current_user.subscriptions.create(feed_id: feed.id)
    if feed
      render :json => feed
    else
      render :json => { error: "invalid url" }, status: :unprocessable_entity
    end
  end

  def favorite
    @feed = Feed.find(params[:id])
    subscription = @feed.subscriptions.find_by(user_id: current_user.id)
    subscription.toggle(:favorite)
    subscription.save!
    head :ok
  end

  def set_feed_favorite(feed)
    subscription = feed.subscriptions.find_by(user_id: current_user.id)

    feed.define_singleton_method(:favorite) do
      subscription.favorite
    end
  end

  private
  def feed_params
    params.require(:feed).permit(:title, :url)
  end
end
