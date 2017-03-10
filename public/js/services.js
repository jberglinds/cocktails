let serviceModule = angular.module('services', []);

serviceModule.factory('API', ['$http',
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
