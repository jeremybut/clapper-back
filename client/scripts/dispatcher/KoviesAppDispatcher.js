var KoviesConstants = require('../constants/KoviesConstants.js');
var Dispatcher = require('flux').Dispatcher;
var assign = require('object-assign');

var PayloadSources = KoviesConstants.PayloadSources;

var KoviesAppDispatcher = assign(new Dispatcher(), {

  handleServerAction: function(action) {
    var payload = {
      source: PayloadSources.SERVER_ACTION,
      action: action
    };
    console.log(payload);
    this.dispatch(payload);
  },

  handleViewAction: function(action) {
    console.log(action);

    var payload = {
      source: PayloadSources.VIEW_ACTION,
      action: action
    };
    this.dispatch(payload);
  }
});

module.exports = KoviesAppDispatcher;

