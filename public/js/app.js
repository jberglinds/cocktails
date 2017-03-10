let app = angular.module('cocktails', ['ui.router', 'controllers', 'angular-loading-bar', 'ngAnimate']);

app.config(['cfpLoadingBarProvider', function(cfpLoadingBarProvider) {
    cfpLoadingBarProvider.includeSpinner = false;
    // cfpLoadingBarProvider.latencyThreshold = 0;
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

    let drink = {
        name: 'drink',
        url: '/drinks/:id',
        templateUrl: 'views/drink.html',
        controller: 'DrinkController'
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

    let event = {
        name: 'event',
        url: '/events/:id',
        templateUrl: 'views/event.html',
        controller: 'EventController'
    }

    $stateProvider.state(welcome);
    $stateProvider.state(drinks);
    $stateProvider.state(drink);
    $stateProvider.state(spirits);
    $stateProvider.state(mixers);
    $stateProvider.state(events);
    $stateProvider.state(event);

    $urlRouterProvider.otherwise('/')
});
