var KoviesAppDispatcher = require('../dispatcher/KoviesAppDispatcher.js');
var KoviesConstants = require('../constants/KoviesConstants.js');
var WebAPIUtils = require('../utils/WebAPIUtils.js');

var ActionTypes = KoviesConstants.ActionTypes;

module.exports = {

  signup: function(email, password, passwordConfirmation) {
    KoviesAppDispatcher.handleViewAction({
      type: ActionTypes.SIGNUP_REQUEST,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation
    });
    WebAPIUtils.signup(email, password, passwordConfirmation);
  },

  login: function(username, password) {
    KoviesAppDispatcher.handleViewAction({
      type: ActionTypes.LOGIN_REQUEST,
      username: username,
      password: password
    });
    WebAPIUtils.login(username, password);
  },

  logout: function() {
    KoviesAppDispatcher.handleViewAction({
      type: ActionTypes.LOGOUT
    });
  }

};

