NewsReader.Views.FeedView = Backbone.View.extend({

  template: JST['feed_view'],

  events: {
    "click .refresh-button": 'refresh',
    "click .favorite": 'toggleFavorite'
  },

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render)
  },

  render: function() {
    var content = this.template({ feed: this.model });
    this.$el.html(content);
    return this;
  },

  refresh: function(event) {
    this.model.entries.fetch();
  },

  toggleFavorite: function(event) {
    $.ajax({
      url: '/feeds/' + this.model.get('id') + '/favorite',
      type: 'PATCH',
      success: function() {
        var star = $(event.target);
        star.toggleClass('glyphicon-star-empty glyphicon-star')
      }
    });
  }

});