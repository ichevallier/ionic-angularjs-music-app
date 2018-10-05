// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
var app = angular.module('starter', ['ionic','ngCordova','ngResource','ngStorage','ngCookies','ngSanitize','ionic-audio']).run(function(
  $window,
  $ionicLoading,
  $log,
  $ionicModal,
  $ionicPlatform,
  $localStorage,
  api
) {

  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    // $cordovaPlugin.someFunction().then(success, error);
    if(window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
    }
    if(window.StatusBar) {
      StatusBar.styleDefault();
    }
    // camera
    if (!navigator.camera)
    {
      // error handling
      return;
    }
    //pictureSource=navigator.camera.PictureSourceType.PHOTOLIBRARY;
    pictureSource=navigator.camera.PictureSourceType.CAMERA;
    destinationType=navigator.camera.DestinationType.FILE_URI;

    // simple autentication 
    //$httpProvider.responseInterceptors.push('httpInterceptor');

    $ionicHistory.nextViewOptions({
      disableBack: true
    });
    
  });
  // clear cache
  //$ionicConfigProvider.views.maxCache(0);

  // api simple authentication
  // api.init();
})
/* for camera */
app.config(function($compileProvider){
  $compileProvider.imgSrcSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|tel):/);
})

//app.config(function($stateProvider, $urlRouterProvider, $httpProvider,USER_ROLES) {
app.config(function($stateProvider, $urlRouterProvider, $httpProvider) {
  
  // simple autentication 
  //$httpProvider.responseInterceptors.push('httpInterceptor');
  $httpProvider.interceptors.push('httpInterceptor');

  $urlRouterProvider.otherwise('/home')
  $stateProvider.state('app', {
    //url: '/app',
    abstract: true,
    templateUrl: 'templates/menu.html',
    controller: 'AppCtrl'
  })
 .state('app.profiles', {
    abstract: true,
    url: '/profiles',
    views: {
      //profiles: {
      'menuContent': {
        template: '<ion-nav-view></ion-nav-view>'
      }
    }
  })
 .state('app.profiles.index', {
    url: '',
    templateUrl: 'templates/profiles.html',
    controller: 'profilesCtrl'
  })

  .state('app.profiles.detail', {
    cache: false,
    url: '/:profile',
    templateUrl: 'templates/profile.html',
    controller: 'profileCtrl',
    resolve: {
      profile: function($stateParams, resourceService) {
        return $stateParams.profile;
      }
    } 
  })
  .state('app.home', {
    url: '/home',
    views: {
      'menuContent': {
        templateUrl: 'templates/bands.html'
      }
    }/*,
    data: {
      authorizedRoles: [USER_ROLES.admin]
    }*/
  })
  .state('app.bands', {
    cache: false,
    url: '/bands',
    views: {
      'menuContent': {
        templateUrl: 'templates/bands.html'
      }
    }
  })
});

app.controller('profilesCtrl', function($scope,$rootScope, resourceService) {
  $scope.profiles = resourceService.query();
  
});