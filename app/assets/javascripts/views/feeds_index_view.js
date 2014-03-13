NewsReader.Views.FeedsIndexView = Backbone.View.extend({
  template: JST["feed_index"],

  initialize: function(options) {
    this.listenTo(this.collection, 'add sync remove change', this.render);
  },

  render: function() {
    var results = _.partition(this.collection.models, function(feed) {
      return feed.get('favorite');
    });
    var favorites = results[0];
    var nonFavorites = results[1];
    var content = this.template({
      favorites: favorites,
      nonFavorites: nonFavorites
    });
    this.$el.html(content);
    return this;
  }

});