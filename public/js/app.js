let app = angular.module('cocktails', ['cocktails.api', 'ui.router', 'angular-loading-bar', 'ngAnimate', 'mgcrea.ngStrap.typeahead']);

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
        controller: 'DrinksController',
        resolve: {
            drinks: function(api) {
                return api.getDrinks();
            }
        }
    }

    let drink = {
        name: 'drink',
        url: '/drinks/:id',
        templateUrl: 'views/drink.html',
        controller: 'DrinkController',
        resolve: {
            drink: function(api, $stateParams) {
                return api.getDrink($stateParams.id);
            }
        }
    }

    let spirits = {
        name: 'spirits',
        url: '/spirits',
        templateUrl: 'views/spirits.html',
        controller: 'SpiritsController',
        resolve: {
            spirits: function(api) {
                return api.getSpirits();
            }
        }
    }

    let mixers = {
        name: 'mixers',
        url: '/mixers',
        templateUrl: 'views/mixers.html',
        controller: 'MixersController',
        resolve: {
            mixers: function(api) {
                return api.getMixers();
            }
        }
    }

    let events = {
        name: 'events',
        url: '/events',
        templateUrl: 'views/events.html',
        controller: 'EventsController',
        resolve: {
            events: function(api) {
                return api.getEvents();
            }
        }
    }

    let event = {
        name: 'event',
        url: '/events/:id',
        templateUrl: 'views/event.html',
        controller: 'EventController',
        params: {
            password: null
        },
        resolve: {
            event: function(api, $stateParams) {
                return api.getEvent($stateParams.id, $stateParams.password);
            }
        }
    }

    let eventDrinks = {
        name: 'eventDrinks',
        url: '/events/:id/drinks',
        templateUrl: 'views/drinks.html',
        controller: 'EventDrinksController',
        resolve: {
            event: function(api, $stateParams) {
                return api.getEvents().then((response) => {
                    for (event of response.data) {
                        if (event.id == $stateParams.id) {
                            return event;
                        }
                    }
                });
            },
            drinks: function(api, $stateParams) {
                return api.getEventDrinklist($stateParams.id);
            }
        }
    }

    $stateProvider.state(welcome);
    $stateProvider.state(drinks);
    $stateProvider.state(drink);
    $stateProvider.state(spirits);
    $stateProvider.state(mixers);
    $stateProvider.state(events);
    $stateProvider.state(event);
    $stateProvider.state(eventDrinks);

    $urlRouterProvider.otherwise('/')
});
