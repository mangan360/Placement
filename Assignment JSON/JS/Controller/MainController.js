app.controller('MainController', function ($scope, $http) {
    $scope.myData = [];
    $http.get("http://www.json-generator.com/api/json/get/bIugkcZneG?indent=2")
        .success(function (data) {
            $scope.myData = data;
        });
        $scope.lst = [];
	$scope.change = function(list,myVar){
        if (myVar)
            $scope.lst.push(list);
        else
            $scope.lst.splice($scope.lst.indexOf(list), 1);
	};
});