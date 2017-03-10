let controllerModule = angular.module('controllers', []);

controllerModule.controller('DrinksController', ['$scope',
	function($scope) {

		$scope.drinks = [
			{
				id: 1234,
				name: 'Lolly',
				image: 'http://placeholder.pics/svg/300/FF9100-FF0093/FFFFFF-000000/Lolly',
				tags: [
					'Vodka',
					'Rum',
					'Tequila',
					'Gin'
				]
			},
			{
				id: 4321,
				name: 'GT',
				image: 'http://placeholder.pics/svg/300/FF9100-FF0093/FFFFFF-000000/GT',
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

controllerModule.controller('DrinkController', ['$scope', '$stateParams',
	function($scope, $stateParams) {

		// $stateParams.id

		$scope.drink = {
			id: $stateParams.id,
			name: 'Lolly',
			image: 'http://placeholder.pics/svg/500/FF9100-FF0093/FFFFFF-000000/Lolly',
			description: 'The absolute classic. The drink of the CS chapter.',
			ingredients: [
				{
					name: "Gin",
					amount: "2 cl"
				},
				{
					name: "Vodka",
					amount: "2 cl"
				},
				{
					name: "Tequila",
					amount: "2 cl"
				},
				{
					name: "Rum",
					amount: "2 cl"
				},
				{
					name: "Triple Sec",
					amount: "2 cl"
				},
				{
					name: "Rose's Lime",
					amount: "2 cl"
				},
				{
					name: "Sugar Syrup",
					amount: "2 cl"
				},
				{
					name: "Cola",
					amount: ""
				}
			],
			tags: [
				'Vodka',
				'Rum',
				'Tequila',
				'Gin'
			],
			howto: [
				"Do this, mate",
				"Then, that, bro"
			]
		}

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

controllerModule.controller('EventController', ['$scope',
	function($scope) {


	}
]);
