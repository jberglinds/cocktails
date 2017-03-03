let app = angular.module('cocktails', ['ui.router', 'controllers']);

app.config(function($stateProvider) {
  let welcome = {
    name: 'welcome',
    url: '',
    templateUrl: 'views/welcome.html'
  }

  let drinks = {
    name: 'drinks',
    url: '/drinks',
    templateUrl: 'views/drinks.html',
    controller: 'DrinksController'
  }

  $stateProvider.state(welcome);
  $stateProvider.state(drinks);
});
