var React = require('react');
var WebAPIUtils = require('../../utils/WebAPIUtils.js');
var MovieStore = require('../../stores/MovieStore.react.jsx');
var ErrorNotice = require('../../components/common/ErrorNotice.react.jsx');
var MovieActionCreators = require('../../actions/MovieActionCreators.react.jsx');
var Router = require('react-router');
var Link = Router.Link;
var moment = require('moment');

var MoviesPage = React.createClass({

  getInitialState: function() {
    return {
      movies: MovieStore.getAllMovies(),
      errors: []
    };
  },

  componentDidMount: function() {
    MovieStore.addChangeListener(this._onChange);
    MovieActionCreators.loadMovies();
  },

  componentWillUnmount: function() {
    MovieStore.removeChangeListener(this._onChange);
  },

  _onChange: function() {
    this.setState({
      movies: MovieStore.getAllMovies(),
      errors: MovieStore.getErrors()
    });
  },

  render: function() {
    var errors = (this.state.errors.length > 0) ? <ErrorNotice errors={this.state.errors}/> : <div></div>;
    return (
      <div>
        {errors}
        <div className="row">
          <MoviesList movies={this.state.movies} />
        </div>
      </div>
    );
  }
});

var MovieItem = React.createClass({
  render: function() {
    return (
      <li className="movie">
        <div className="movie__title">
          <Link to="movie" params={ {movieId: this.props.movie.id} }>
            {this.props.movie.title}
          </Link>
        </div>
      </li>
    );
  }
});

var MoviesList = React.createClass({
  render: function() {
    return (
      <ul className="large-8 medium-10 small-12 small-centered columns">
        {this.props.movies.map(function(movie, index){
          return <MovieItem movie={movie} key={"movie-" + index}/>
        })}
      </ul>
    );
  }
});

module.exports = MoviesPage;

