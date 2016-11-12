var keyMirror = require('keymirror');

var APIRoot = "http://localhost:3002";

module.exports = {

  APIEndpoints: {
    LOGIN:          APIRoot + "/oauth/token",
    REGISTRATION:   APIRoot + "/api/v1/users",
    MOVIES:         APIRoot + "/api/v1/movies"
  },

  PayloadSources: keyMirror({
    SERVER_ACTION: null,
    VIEW_ACTION: null
  }),

  ActionTypes: keyMirror({
    // Session
    LOGIN_REQUEST: null,
    LOGIN_RESPONSE: null,

    // Routes
    REDIRECT: null,

    LOAD_MOVIES: null,
    RECEIVE_MOVIES: null,
    LOAD_MOVIE: null,
    RECEIVE_MOVIE: null
  })

};
