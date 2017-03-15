angular.module('cocktails.api', [])

.factory('api', ['$http',
	function($http) {

		function getDrinks() {
			return $http.get("/api/drinks");
		}

		function getDrink(id) {
			return $http.get("/api/drinks/"+id);
		}

		function getSpirits() {
			return $http.get("/api/spirits");
		}

		function getMixers() {
			return $http.get("/api/mixers");
		}

		function getEvents() {
			return $http.get("/api/events");
		}

		function getEvent(id, password) {
			return $http.get("/api/events/"+id, {
				params: {
					'passphrase': password
				}
			});
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

		function postNewEvent(name, description, date, password) {
			let requestData = {
				name: name,
				description: description,
				date: date,
				password: password
			}
			return $http.get("/api/newEvent", requestData);
		}

		// Public for service
		return {
			getDrinks: getDrinks,
			getDrink: getDrink,
			getSpirits: getSpirits,
			getMixers: getMixers,
			getEvents: getEvents,
			getEvent: getEvent,
			postNewDrink: postNewDrink,
			postNewEvent: postNewEvent
		};
	}
]);
