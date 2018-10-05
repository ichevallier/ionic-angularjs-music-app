// js/bandController
'use strict';
// band list
app.controller('listeCtrl',['$scope','$rootScope','$http','$window','leafletData','resourceService',function($scope,$rootScope,$http,$window,leafletData, resourceService) {
  
  // use resourcesService  
  $scope.profiles = resourceService.query();
 
}]);