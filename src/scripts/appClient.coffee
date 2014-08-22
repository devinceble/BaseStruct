appClient = angular.module 'goEngas', ['ui.router']

appClient.config ($stateProvider, $urlRouterProvider)->
  $urlRouterProvider.otherwise "/home"
  $stateProvider.state "home",
    url: "/home"
    templateUrl: "home.html"
    controller: "HomeCtrl"
  true
