let controllerModule = angular.module('controllers', []);

controllerModule.controller('DrinksController', ['$scope',
	function($scope) {
		$scope.test = 'test';
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
