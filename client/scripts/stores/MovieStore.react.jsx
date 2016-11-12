var KoviesAppDispatcher = require('../dispatcher/KoviesAppDispatcher.js');
var KoviesConstants = require('../constants/KoviesConstants.js');
var EventEmitter = require('events').EventEmitter;
var assign = require('object-assign');
var WebAPIUtils = require('../utils/WebAPIUtils.js');

var ActionTypes = KoviesConstants.ActionTypes;
var CHANGE_EVENT = 'change';

var _movies = [];
var _errors = [];
var _movie = { title: "" };

var MovieStore = assign({}, EventEmitter.prototype, {

  emitChange: function() {
    this.emit(CHANGE_EVENT);
  },

  addChangeListener: function(callback) {
    this.on(CHANGE_EVENT, callback);
  },

  removeChangeListener: function(callback) {
    this.removeListener(CHANGE_EVENT, callback);
  },

  getAllMovies: function() {
    return _movies;
  },

  getMovie: function() {
    return _movie;
  },

  getErrors: function() {
    return _errors;
  }

});

MovieStore.dispatchToken = KoviesAppDispatcher.register(function(payload) {
  var action = payload.action;

  switch(action.type) {
    case ActionTypes.RECEIVE_MOVIES:
      _movies = action.json.movies;
      MovieStore.emitChange();
      break;

    case ActionTypes.RECEIVE_MOVIE:
      if (action.json) {
        _movie = action.json.movie;
        _errors = [];
      }
      if (action.errors) {
        _errors = action.errors;
      }
      MovieStore.emitChange();
      break;
  }

  return true;
});

module.exports = MovieStore;

