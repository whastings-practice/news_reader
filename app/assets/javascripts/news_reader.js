window.NewsReader = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new NewsReader.Routers.AppRouter($('#feeds-bootstrap').html());
    Backbone.history.start();
  }
};

$(document).ready(function(){
  NewsReader.initialize();
});
