let controllerModule = angular.module('controllers', []);

controllerModule.controller('DrinksController', ['$scope',
	function($scope) {
		$scope.test = 'test';
	}
]);
