NewsReader.Views.FeedFormView = Backbone.View.extend({
  template: JST['feed_form'],

  events: {
    "submit #feed-form": "submit"
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  submit: function(event) {
    event.preventDefault();
    var url = this.$('#feed-url').val();
    var feed = new NewsReader.Models.Feed({
      url: url
    });
    feed.save({}, {
      success: function() {
        Backbone.history.navigate('feeds/' + feed.get('id'), {trigger: true});
      }
    });
  }
});