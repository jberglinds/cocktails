(function(){
	let app = angular.module("cocktails", [
		'ngRoute'
	]);

	app.config(['$routeProvider',
	function($routeProvider) {
		$routeProvider.
		when('/', {
			templateUrl: 'views/welcome.html'
		}).
		otherwise({
			redirectTo: '/welcome'
		});
	}]);
})();
