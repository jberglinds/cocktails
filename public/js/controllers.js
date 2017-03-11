angular.module('cocktails')

.controller('DrinksController', ['$scope', 'api',
	function($scope, api) {
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


		$scope.spirits = api.getSpirits().then((response) => {
			return response.data;
		})

		$scope.noOfIngredients = 1;
		$scope.noOfInstructions = 1;
		$scope.range = function(n) {
        	return new Array(n);
    	};


	}
])

.controller('DrinkController', ['$scope', '$stateParams',
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
