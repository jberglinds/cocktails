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

		function getSpiritsForEvent(id, password) {
			return $http.get("/api/events/"+id+"/spirits?password="+password);
		}

		function getMixers() {
			return $http.get("/api/mixers");
		}

		function getMixersForEvent(id, password) {
			return $http.get("/api/events/"+id+"/mixers?password="+password);
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
			return $http.post("/api/drinks/add", {
				name: name,
				description, description,
				image_url: image_url,
				spirits: spirits,
				mixers: mixers,
				instructions: instructions
			});
		}

		function postNewEvent(name, description, date, password) {
			return $http.post("/api/events/add", {
				name: name,
				description, description,
				date: date,
				passphrase: password
			});
		}

		function postAddSpiritToEvent(eventId, password, spiritId) {
			return $http.post("/api/events/"+eventId+"/add-spirit", {
				spiritId: spiritId,
				passphrase: password
			});
		}

		function postAddMixerToEvent(eventId, password, mixerId) {
			return $http.post("/api/events/"+eventId+"/add-mixer", {
				mixerId: mixerId,
				passphrase: password
			});
		}

		function postRemoveSpiritFromEvent(eventId, password, spiritId) {
			return $http.post("/api/events/"+eventId+"/remove-spirit", {
				spiritId: spiritId,
				passphrase: password
			});
		}

		function postRemoveMixerFromEvent(eventId, password, mixerId) {
			return $http.post("/api/events/"+eventId+"/remove-mixer", {
				mixerId: mixerId,
				passphrase: password
			});
		}


		// function postNewDrink(name, description, image_url, spirits, mixers, instructions) {
		// 	let requestData = {
		// 		name: name,
		// 		description: description,
		// 		image_url: image_url,
		// 		spirits: spirits,
		// 		mixers: mixers,
		// 		instructions: instructions
		// 	}
		// 	return $http.get("/api/newDrink", requestData);
		// }
		//
		// function postNewEvent(name, description, date, password) {
		// 	let requestData = {
		// 		name: name,
		// 		description: description,
		// 		date: date,
		// 		password: password
		// 	}
		// 	return $http.get("/api/newEvent", requestData);
		// }

		// Public for service
		return {
			getDrinks: getDrinks,
			getDrink: getDrink,
			getSpirits: getSpirits,
			getSpiritsForEvent: getSpiritsForEvent,
			getMixers: getMixers,
			getMixersForEvent, getMixersForEvent,
			getEvents: getEvents,
			getEvent: getEvent,

			postNewEvent: postNewEvent,
			postNewDrink: postNewDrink,
			postAddSpiritToEvent: postAddSpiritToEvent,
			postAddMixerToEvent: postAddMixerToEvent,
			postRemoveSpiritFromEvent: postRemoveSpiritFromEvent,
			postRemoveMixerFromEvent: postRemoveMixerFromEvent
		};
	}
]);
