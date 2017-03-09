let controllerModule = angular.module('controllers', []);

controllerModule.controller('DrinksController', ['$scope',
	function($scope) {

		$scope.drinks = [
			{
				id: 1234,
				name: 'Lolly',
				image: 'http://placeholder.pics/svg/200/FF9100-FF0093/FFFFFF-000000/Lolly',
				tags: [
					'Vodka',
					'Rum',
					'Tequila',
					'Gin'
				]
			},
			{
				id: 1234,
				name: 'GT',
				image: 'http://placeholder.pics/svg/200/FF9100-FF0093/FFFFFF-000000/GT',
				tags: [
					'Gin',
				]
			},
		]

		$scope.noOfIngredients = 1;
		$scope.range = function(n) {
        	return new Array(n);
    	};
	}
]);

controllerModule.controller('SpiritsController', ['$scope',
	function($scope) {

		$scope.spirits = [
			{
				id: 1234,
				name: 'Dragon Blood',
				type: 'Liqueur',
				abv: 50
			},
			{
				id: 1234,
				name: 'Bombay Sapphire London Dry Gin',
				type: 'Gin',
				abv: 40
			},
		]

	}
]);

controllerModule.controller('MixersController', ['$scope',
	function($scope) {

		$scope.mixers = [
			{
				id: 1234,
				name: 'Orange Juice',
				type: 'Juice',
			},
			{
				id: 1234,
				name: 'Milk',
				type: 'Dairy',
			},
			{
				id: 1234,
				name: 'Lemon Slice',
				type: 'Fruit',
			},
		]

	}
]);

controllerModule.controller('EventsController', ['$scope',
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
]);
