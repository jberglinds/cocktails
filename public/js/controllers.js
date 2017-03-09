let controllerModule = angular.module('controllers', []);

controllerModule.controller('DrinksController', ['$scope',
	function($scope) {

		$scope.noOfIngredients = 1;
		$scope.range = function(n) {
        	return new Array(n);
    	};
	}
]);

controllerModule.controller('SpiritsController', ['$scope',
	function($scope) {
		$scope.test = 'test';
	}
]);

controllerModule.controller('MixersController', ['$scope',
	function($scope) {
		$scope.test = 'test';
	}
]);

controllerModule.controller('EventsController', ['$scope',
	function($scope) {
		$scope.date = new Date();
	}
]);
