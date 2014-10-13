appClient = angular.module 'baseStruct', ['ui.router']

appClient.run () ->
  args = [
    '%c %c It Works! %c ',
    'background: #0f2034',
    'color: #e2e2e2; background: #0f2036',
    'background: #0f2034'
  ]
  console.log.apply(console, args)


appClient.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise "/home"
  $stateProvider.state "home",
    url: "/home"
    templateUrl: "home.html"
    controller: "HomeCtrl"
  true
