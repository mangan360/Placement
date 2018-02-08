app.controller('MainController', function ($scope, $http) {
    $scope.myData = [];
    $http.get("http://www.json-generator.com/api/json/get/bIugkcZneG?indent=2")
        .success(function (data) {
            $scope.myData = data;
        });
});