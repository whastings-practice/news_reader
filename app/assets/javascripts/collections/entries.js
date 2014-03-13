NewsReader.Collections.Entries = Backbone.Collection.extend({
  url: function() {
    return 'feeds/' + this.feed.get('id') + '/entries'
  },

  model: NewsReader.Models.Entry,

  initialize: function(items, options) {
    this.feed = options.feed;
  }
});