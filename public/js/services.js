angular.module('cocktails.api', [])

.factory('api', ['$http',
	function($http) {

		function getSpirits() {
			return $http.get("/api/spirits");
		}

		// Public for service
		return {
			getSpirits: getSpirits
		};
	}
]);
