var KoviesAppDispatcher = require('../dispatcher/KoviesAppDispatcher.js');
var KoviesConstants = require('../constants/KoviesConstants.js');

var ActionTypes = KoviesConstants.ActionTypes;

module.exports = {

  receiveLogin: function(json, errors) {
    KoviesAppDispatcher.handleServerAction({
      type: ActionTypes.LOGIN_RESPONSE,
      json: json,
      errors: errors
    });
  },

  receiveMovies: function(json) {
    KoviesAppDispatcher.handleServerAction({
      type: ActionTypes.RECEIVE_MOVIES,
      json: json
    });
  },

  receiveMovie: function(json) {
    KoviesAppDispatcher.handleServerAction({
      type: ActionTypes.RECEIVE_MOVIE,
      json: json
    });
  }

};

