NewsReader.Models.Feed = Backbone.Model.extend({
  urlRoot: "/feeds",

  initialize: function(options) {
    this.entries = new NewsReader.Collections.Entries([], {
      feed: this
    });
  },

  parse: function(data) {
    var feed = this;

    if (data.entries) {
      feed.entries.reset(data.entries);

      delete data.entries;
    }

    return data;
  }
});