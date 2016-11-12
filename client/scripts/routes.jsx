var React = require('react');
var Router = require('react-router');
var Route = Router.Route;
var DefaultRoute = Router.DefaultRoute;

var KoviesApp = require('./components/KoviesApp.react.jsx');
var LoginPage = require('./components/session/LoginPage.react.jsx');
var MoviesPage = require('./components/movies/MoviesPage.react.jsx');
var MoviePage = require('./components/movies/MoviePage.react.jsx');
var SignupPage = require('./components/session/SignupPage.react.jsx');

module.exports = (
  <Route name="app" path="/" handler={KoviesApp}>
    <DefaultRoute handler={MoviesPage} />
    <Route name="login" path="/login" handler={LoginPage}/>
    <Route name="signup" path="/signup" handler={SignupPage}/>
    <Route name="movies" path="/movies" handler={MoviesPage}/>
    <Route name="movie" path="/movies/:movieId" handler={MoviePage} />
  </Route>
);

