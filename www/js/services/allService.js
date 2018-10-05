angular.module('starter')
.factory('resourceService', function ($resource) {
    
    // distant 
    return $resource('http://yourwebsite.com/ionic-angularjs-stw/api/bands/:id',{id: '@id'},{
        'update': {method: 'PUT', id:'@id'}
    });
    
})
.factory('pictureResourceService', function ($resource) {
  
  // distant
  return $resource('http://yourwebsite.com/ionic-angularjs-stw/api/gallery/:id',{id: '@id'},{
        'update': {method: 'PUT', id:'@id'},
        'get' : {method:'GET',id:'@id',isArray:true}
    });
  
}) // end factory
/*.factory('GetUU', function() {
 
  // distant 
  var url = 'http://yourwebsite.com/ionic-angularjs-stw/api/gallery/';
  return  {
      service : url,
  }

})*/
// Tracks Services
.factory('trackResourceService', function ($resource) {
  
  return $resource('http://yourwebsite.com/ionic-angularjs-stw/api/tracks/:id',{id: '@id'},{
        'update': {method: 'PUT', id:'@id'},
        'get' : {method:'GET',id:'@id',isArray:true}
    });
  
}) // end factory
.factory('httpInterceptor', function httpInterceptor ($q, $window, $location) {
  return function (promise) {
      var success = function (response) {
          return response;
      };

      var error = function (response) {
          if (response.status === 401) {
              $location.url('/help');
              console.log('status 401');
          }

          return $q.reject(response);
      };

      return promise.then(success, error);
  };
})
.factory('api', function ($http, $cookies) {
  return {
      init: function (token) {
          $http.defaults.headers.common['X-Access-Token'] = token || $cookies.token;
      }
  };
})