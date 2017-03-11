angular.module('cocktails.api', [])

.factory('api', ['$http',
	function($http) {

		function getSpirits() {
			return $http.get("/api/spirits");
		}

		function getMixers() {
			return $http.get("/api/mixers");
		}

		// Public for service
		return {
			getSpirits: getSpirits,
			getMixers: getMixers
		};
	}
]);
