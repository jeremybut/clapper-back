var React = require('react');
var WebAPIUtils = require('../../utils/WebAPIUtils.js');
var MovieStore = require('../../stores/MovieStore.react.jsx');
var MovieActionCreators = require('../../actions/MovieActionCreators.react.jsx');
var State = require('react-router').State;

var MoviePage = React.createClass({

  mixins: [ State ],

  getInitialState: function() {
    return {
      movie: MovieStore.getMovie(),
      errors: []
    };
  },

  componentDidMount: function() {
    MovieStore.addChangeListener(this._onChange);
    MovieActionCreators.loadMovie(this.getParams().movieId);
  },

  componentWillUnmount: function() {
    MovieStore.removeChangeListener(this._onChange);
  },

  _onChange: function() {
    this.setState({
      movie: MovieStore.getMovie(),
      errors: MovieStore.getErrors()
    });
  },

  render: function() {
    return (
      <div className="row">
        <div className="movie__id">{this.state.movie.id}</div>
        <div className="movie__title">{this.state.movie.title}</div>
      </div>
     );
  }

});

module.exports = MoviePage;

