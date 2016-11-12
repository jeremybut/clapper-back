var KoviesAppDispatcher = require('../dispatcher/KoviesAppDispatcher.js');
var KoviesConstants = require('../constants/KoviesConstants.js');

var ActionTypes = KoviesConstants.ActionTypes;

module.exports = {

  redirect: function(route) {
    KoviesAppDispatcher.handleViewAction({
      type: ActionTypes.REDIRECT,
      route: route
    });
  }

};


