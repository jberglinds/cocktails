angular.module('cocktails.api', [])

.factory('api', ['$http',
	function($http) {

		function getDrinks() {
			return $http.get("/api/drinks");
		}

		function getDrink(id) {
			return $http.get("/api/drink/"+id);
		}

		function getSpirits() {
			return $http.get("/api/spirits");
		}

		function getMixers() {
			return $http.get("/api/mixers");
		}

		// Public for service
		return {
			getDrinks: getDrinks,
			getDrink: getDrink,
			getSpirits: getSpirits,
			getMixers: getMixers
		};
	}
]);
