// js/profileController
'use strict';

app.controller('profileCtrl', function($scope,$window,$ionicLoading,$timeout,$cordovaGeolocation,$location, profile,resourceService, pictureResourceService,trackResourceService, $ionicBackdrop, $ionicModal, $ionicSlideBoxDelegate, $ionicScrollDelegate,MediaManager) {

    var profile_data = resourceService.get({id: profile}, 
      function success() { 
        //console.log(profile_data['id']); 
        $scope.profile = profile_data;

        // Loading  
        $ionicLoading.show({
          template: 'Loading Profile',
          noBackdrop: true,
          duration: 1000
        });
      }, 
      function err() { 
        // Loading  
        $ionicLoading.show({
          template: 'Error Loading',
          noBackdrop: true,
          duration: 1000
        });
  
      });



  /* gallery profile */

  $scope.zoomMin = 1;
  $scope.data = { "ImageURI" :  "Select Image" };
  //console.info("got upload url :: "+GetUU.tous);
  // loadData 
  //function loadData () {
    
    $ionicLoading.show({template: 'Recherche de photos en cours...'});   

    // get id data  
    $scope.items = pictureResourceService.get({id:profile});

    $ionicLoading.hide();
  //}

  // Options galerie / zoom
  $scope.showImages = function(index) {
    //console.info('index image :: '+index);
    $scope.activeSlide = index;
    $scope.showModal('templates/gallery-zoomview.html');
  };

  $scope.showModal = function(templateUrl) {
    $ionicModal.fromTemplateUrl(templateUrl, {
      scope: $scope
    }).then(function(modal) {
      $scope.modal = modal;
      $scope.modal.show();
    });
  }
  $scope.closeModal = function() {
    $scope.modal.hide();
    $scope.modal.remove()
  };
  
  $scope.updateSlideStatus = function(slide) {
    var zoomFactor = $ionicScrollDelegate.$getByHandle('scrollHandle' + slide).getScrollPosition().zoom;
    if (zoomFactor == $scope.zoomMin) {
      $ionicSlideBoxDelegate.enableSlide(true);
    } else {
      $ionicSlideBoxDelegate.enableSlide(false);
    }
  };

  /* track profile */
  $scope.dynamicTrack = {};
  $scope.tracks       =  trackResourceService.get({id:profile});


});
