app.directive('arrayInfo', function () {
  return {
    restrict: 'E',
    scope: {
      info: '='
    },
    templateUrl: 'JS/Directives/arrayInfo.html',
  };
});