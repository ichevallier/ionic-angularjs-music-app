# Label Project app with mp3 player. 
It has been built with ionic, angularjs and uses a Slim REST API connection

- 
## Getting started
- Download and install [nodejs](https://nodejs.org)
- Install cordova and ionic
```
npm install -g ionic cordova
```
- Clone the project
```
git clone https://github.com/ichevallier/ionic-angularjs-music-app.git
```
- Put band and api folders into your own directory
- import stw.sql into your database manager
- Install the ngStorage component
```
bower install ngStorage
```
- Install Cordova plugins
```
cordova plugin add cordova-plugin-camera cordova-plugin-file cordova-plugin-file-transfer
# for image picker
cordova plugin add https://github.com/Telerik-Verified-Plugins/ImagePicker.git 
```
- Define platforms
```
# for Android
ionic cordova platform add android
# for IOS
ionic cordova platform add ios
```

## Deployement
- for Android run
```
ionic cordova run android --prod
```
- for IOS run
```
ionic cordova run ios --prod
```

## File Structure of App
```
ionic-angularjs-stw/
|-- resources/
|   └── android/
|	|   ├── icon/
|	|	|	├── drawable-hdpi-icon.png
|	|	|	└── ....
|	|	└── splash/
|	|	    ├── drawable-land-hdpi-screen.png
|	|		└── ...
|   |
|	├── icon.png
|	└── splash.png
|
|-- hooks/
|	|-- after_prepare/
|	|   └── 010_add_platform_class.js
|   |
|	└── README.md
|
|-- plugins/
|   ├── com.synconset.imagepicker/
|	└── cordova-plugin-camera/
|	└── cordova-plugin-compat/
|	└── cordova-plugin-console/
|	└── cordova-plugin-device/
|	└── cordova-plugin-file/
|	└── cordova-plugin-file-transfer/
|	└── cordova-plugin-geofence/
|	└── cordova-plugin-geolocation/
|	└── cordova-plugin-media/
|	└── cordova-plugin-splashscreen/
|	└── cordova-plugin-statusbar/
|	└── cordova-plugin-whitelist/
|	└── es6-promise-plugin-camera/
|	└── ionic-plugin-keyboard/
|	└── android.json
|	└── fetch.js
|
|-- platforms/
|
|-- scss/
|    └── ionic.app.scss
|
|-- www/
|   └── css/
|   |   ├── leafleft.css
|   |   └── style.css
|   |
|   └── dist/
|   |   ├── ion-audio.js
|   |   └── ion-audio.min.js
|   |
|   └── img/
|   |   ├── ionic.png
|   |   └── no-profile-63x50.png
|   |   └── no-profile-188x150.png
|   |   └── no-profile-250x200.png
|   |   └── top-image.png
|	└── js/
|	|   ├── constants/
|   |   |   └── constants.js
|   |   |
|	|   └── controllers/
|   |   |   ├── bandController.js
|   |   |   └── profileController.js
|   |   |
|	|   └── directives/
|   |   |
|	|   └── services/
|   |   |   └── allService.js
|   |   |
|   |   |
|	|   └── app.js
|   |
|   |
|	└── lib/
|   |   ├── com.synconset.imagepicker/
|	|   └── angular/
|	|   └── angular-animate/
|	|   └── angular-cookies/
|	|   └── angular-resource/
|	|   └── angular-sanitize/
|	|   └── angular-ui-router/
|	|   └── ionic/
|	|   └── ngCordova/
|	|   └── ngStorage/
|   |
|	└── templates/
|   |   ├── bands.html
|   |   └── gallery-zoomview.html
|   |   └── menu.html
|   |   └── profile.html
|   |   └── profiles.html
|   |
|	└── index.html
|   
|
├── .bowerrc                            * Bower configuration file
├── .editorconfig                       * Defines coding styles between editors
├── .gitignore                          * Example git ignore file
├── bower.json                          * Bower json configuration file
├── README.md                           * This file
├── config.xml                          * Cordova configuration file
├── gulpfile.js                         * Gulp configuration file
├── ionic.project                       * Ionic configuration file
└── package.json                        * Defines our JavaScript dependencies
```