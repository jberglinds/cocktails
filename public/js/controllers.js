angular.module('cocktails')

.controller('DrinksController', ['$scope', 'drinks', 'api',
	function($scope, drinks, api) {
		$scope.drinks = drinks.data;
	}
])

.controller('AddDrinkController', ['$scope', '$state', 'api',
	function($scope, $state, api) {
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
			let spirits = valuesToArray($scope.form.spiritIngredient);
			let mixers = valuesToArray($scope.form.mixerIngredient);
			let instructions = valuesToArray($scope.form.instruction);
			api.postNewDrink($scope.form.name, $scope.form.description, $scope.form.image_url, spirits, mixers, instructions).then((success) => {
				$state.reload();
			});
        }

		function valuesToArray(object) {
			let arr = new Array;
			for(let key in object) {
				arr.push(object[key]);
			}
			return arr;
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

.controller('AddEventController', ['$scope', '$state', 'api',
	function($scope, $state, api) {

		$scope.submit = function() {
			// Do request
			api.postNewEvent($scope.form.name, $scope.form.description, $scope.form.date, $scope.form.password).then((success) => {
				$state.reload();
			});
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
		updateSpiritInventory();
		updateMixersInventory();

		$scope.onlyID = '\\d+';

		let socket = io('/events');
		socket.emit('join', {
			event_id: $scope.event.id
		});

		socket.on('spirit_update', (req) => {
			updateSpiritInventory();
		});

		socket.on('mixer_update', (req) => {
			updateMixersInventory();
		});

		// Used for autocompleting mixers and spirits in add to inventory form
		$scope.spirits = api.getSpirits().then((response) => {
			return response.data;
		});
		$scope.mixers = api.getMixers().then((response) => {
			return response.data;
		});

		function updateSpiritInventory() {
			api.getSpiritsForEvent($scope.event.id, $scope.event.passphrase).then((response) => {
				$scope.spiritinventory = response.data;
			});
		}

		function updateMixersInventory() {
			api.getMixersForEvent($scope.event.id, $scope.event.passphrase).then((response) => {
				$scope.mixerinventory = response.data;
			});
		}

		// Called from form
		$scope.addSpiritToInventory = function(id) {
			api.postAddSpiritToEvent($scope.event.id, $scope.event.passphrase, id).then((success) => {
				$scope.spiritID = '';
				$scope.addSpiritForm.$setPristine();
			});
		}

		// Called from form
		$scope.addMixerToInventory = function(id) {
			api.postAddMixerToEvent($scope.event.id, $scope.event.passphrase, id).then((success) => {
				$scope.mixerID = '';
				$scope.addMixerForm.$setPristine();
			});
		}

		// Called from table button
		$scope.removeSpiritFromInventory = function(id) {
			api.postRemoveSpiritFromEvent($scope.event.id, $scope.event.passphrase, id).then((success) => {
				// success
			});
		}

		// Called from table button
		$scope.removeMixerFromInventory = function(id) {
			api.postRemoveMixerFromEvent($scope.event.id, $scope.event.passphrase, id).then((success) => {
				// success
			});
		}

	}
]);
