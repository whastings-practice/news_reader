class EntriesController < ApplicationController
  def index
    feed = Feed.find(params[:feed_id])
    feed.reload
    @entries = feed.entries
    render 'entries/index'
  end

  def show
    @entry = Entry.find(params[:id])
    render 'entries/show'
  end

  private
  def entry_params
    params.require(:entry).permit(:guid, :link, :published_at, :title, :json, :feed_id)
  end
end
