NewsReader.Routers.AppRouter = Backbone.Router.extend({
  routes: {
    "": "index",
    "feeds/new": "addFeed",
    "feeds/:id": "show",
    "entries/:id": "showEntry"
  },

  initialize: function(feedData) {
    feedData = JSON.parse(feedData);
    this.feedData = _.map(feedData, function(feed) {
      return new NewsReader.Models.Feed(feed);
    });
  },

  index: function() {
    var indexView = new NewsReader.Views.FeedsIndexView({
      collection: new NewsReader.Collections.Feeds()
    });

    if (this.feedData) {
      indexView.collection.add(this.feedData);
    } else {
      indexView.collection.fetch();
    }
    this._swapView(indexView);
  },

  show: function(id) {
    var feed = new NewsReader.Models.Feed({ id: id });
    var feedView = new NewsReader.Views.FeedView({ model: feed });

    feed.fetch();
    this._swapView(feedView);
  },

  showEntry: function(id) {
    var entry = new NewsReader.Models.Entry({ id: id });
    var entryView = new NewsReader.Views.EntryView({ model: entry });

    entry.fetch();
    this._swapView(entryView);
  },

  addFeed: function() {
    var view = new NewsReader.Views.FeedFormView();
    this._swapView(view);
  },

  _swapView: function(view) {
    if (this.currentView) {
      this.currentView.remove();
    }

    this.currentView = view;
    $('#content').html(view.render().$el);
  }
});