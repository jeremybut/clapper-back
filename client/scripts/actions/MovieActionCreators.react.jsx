var KoviesAppDispatcher = require('../dispatcher/KoviesAppDispatcher.js');
var KoviesConstants = require('../constants/KoviesConstants.js');
var WebAPIUtils = require('../utils/WebAPIUtils.js');

var ActionTypes = KoviesConstants.ActionTypes;

module.exports = {

  loadMovies: function() {
    KoviesAppDispatcher.handleViewAction({
      type: ActionTypes.LOAD_MOVIES
    });
    WebAPIUtils.loadMovies();
  },

  loadMovie: function(movieId) {
    KoviesAppDispatcher.handleViewAction({
      type: ActionTypes.LOAD_MOVIE,
      movieId: movieId
    });
    WebAPIUtils.loadMovie(movieId);
  }

};

