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

		function postNewDrink(name, description, image_url, spirits, mixers, instructions) {
			let requestData = {
				name: name,
				description: description,
				image_url: image_url,
				spirits: spirits,
				mixers: mixers,
				instructions: instructions
			}
			return $http.get("/api/newDrink", requestData);
		}

		// Public for service
		return {
			getDrinks: getDrinks,
			getDrink: getDrink,
			getSpirits: getSpirits,
			getMixers: getMixers,
			postNewDrink: postNewDrink
		};
	}
]);
