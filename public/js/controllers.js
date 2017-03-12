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
			console.log($scope.form);
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

.controller('EventsController', ['$scope',
	function($scope) {

		let date = new Date();
		date.setDate(date.getDate() + 6);

		let date2 = new Date();
		date2.setDate(date2.getDate() + 10);

		$scope.events = [
			{
				id: 1234,
				name: 'Onsdagspub',
				date: new Date(),
			},
			{
				id: 1234,
				name: 'Torsdagspub',
				date: date,
			},
			{
				id: 1234,
				name: 'Mottagningstack',
				date: date2,
			},
		]

	}
])

.controller('EventController', ['$scope',
	function($scope) {


	}
]);
