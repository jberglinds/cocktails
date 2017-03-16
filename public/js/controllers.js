angular.module('cocktails')

.controller('DrinksController', ['$scope', 'drinks', 'api',
	function($scope, drinks, api) {
		$scope.drinks = drinks.data;
	}
])

.controller('AddDrinkController', ['$scope', 'api',
	function($scope, api) {
		$scope.onlyID = '\\d+';

		$scope.spirits = api.getSpirits().then((response) => {
			return response.data;
		});
		$scope.mixers = api.getMixers().then((response) => {
			return response.data;
		});

		$scope.noOfSpirits = 1;
		$scope.noOfMixers = 1;
		$scope.noOfInstructions = 1;
		$scope.range = function(n) {
        	return new Array(n);
    	};

		$scope.submit = function() {
			// Do request
			console.log($scope.form.spiritIngredient);
        }

		$scope.cancel = function() {
            $scope.newDrinkForm.$setPristine();
			$scope.form = {};
			$scope.noOfSpirits = 1;
			$scope.noOfMixers = 1;
			$scope.noOfInstructions = 1;
        }

	}
])

.controller('DrinkController', ['$scope', 'drink',
	function($scope, drink) {
		$scope.drink = drink.data;
	}
])

.controller('SpiritsController', ['$scope', 'spirits',
	function($scope, spirits) {
		$scope.spirits = spirits.data;
	}
])

.controller('MixersController', ['$scope', 'mixers',
	function($scope, mixers) {
		$scope.mixers = mixers.data;
	}
])

.controller('EventsController', ['$scope', 'events',
	function($scope, events) {
		$scope.events = events.data;
	}
])

.controller('AddEventController', ['$scope', 'api',
	function($scope, api) {

		$scope.submit = function() {
			// Do request
			console.log($scope.form);
		}

		$scope.cancel = function() {
			$scope.newEventForm.$setPristine();
			$scope.form = {};
		}

	}
])

.controller('EventController', ['$scope', 'event', 'api',
	function($scope, event, api) {
		$scope.event = event.data;

		$scope.onlyID = '\\d+';

		$scope.spirits = api.getSpirits().then((response) => {
			return response.data;
		});
		$scope.mixers = api.getMixers().then((response) => {
			return response.data;
		});

		function getSpiritsInventory() {
			api.getSpiritsForEvent($scope.event.id, $scope.event.passphrase).then((response) => {
				$scope.spiritinventory = response.data;
			});
		}
		getSpiritsInventory();

		function getMixersInventory() {
			api.getMixersForEvent($scope.event.id, $scope.event.passphrase).then((response) => {
				$scope.mixerinventory = response.data;
			});
		}
		getMixersInventory();


		$scope.addSpiritToInventory = function(id) {
			api.postAddSpiritToEvent($scope.event.id, $scope.event.passphrase, id).then((success) => {
				getSpiritsInventory();
				$scope.spiritID = '';
				$scope.addSpiritForm.$setPristine();
			});
		}

		$scope.addMixerToInventory = function(id) {
			api.postAddMixerToEvent($scope.event.id, $scope.event.passphrase, id).then((success) => {
				getMixersInventory();
				$scope.mixerID = '';
				$scope.addMixerForm.$setPristine();
			});
		}

		$scope.removeSpiritFromInventory = function(id) {
			api.postRemoveSpiritFromEvent($scope.event.id, $scope.event.passphrase, id).then((success) => {
				getSpiritsInventory();
			});
		}

		$scope.removeMixerFromInventory = function(id) {
			console.log(id);
			api.postRemoveMixerFromEvent($scope.event.id, $scope.event.passphrase, id).then((success) => {
				getMixersInventory();
			});
		}

	}
]);
