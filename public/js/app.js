let app = angular.module('cocktails', ['ui.router', 'controllers', 'angular-loading-bar']);

app.config(['cfpLoadingBarProvider', function(cfpLoadingBarProvider) {
    cfpLoadingBarProvider.includeSpinner = false;
}]);

app.config(function($stateProvider, $urlRouterProvider) {
    let welcome = {
        name: 'welcome',
        url: '/',
        templateUrl: 'views/welcome.html'
    }

    let drinks = {
        name: 'drinks',
        url: '/drinks',
        templateUrl: 'views/drinks.html',
        controller: 'DrinksController'
    }

    let spirits = {
        name: 'spirits',
        url: '/spirits',
        templateUrl: 'views/spirits.html',
        controller: 'SpiritsController'
    }

    let mixers = {
        name: 'mixers',
        url: '/mixers',
        templateUrl: 'views/mixers.html',
        controller: 'MixersController'
    }

    let events = {
        name: 'events',
        url: '/events',
        templateUrl: 'views/events.html',
        controller: 'EventsController'
    }

    $stateProvider.state(welcome);
    $stateProvider.state(drinks);
    $stateProvider.state(spirits);
    $stateProvider.state(mixers);
    $stateProvider.state(events);

    $urlRouterProvider.otherwise('/')
});
