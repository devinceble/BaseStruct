appClient = angular.module('baseStruct')

appClient.controller "HomeCtrl", ($scope)->
  $scope.sample = "Test1"
  $scope.selectedState = "Home Controller"
  
  @game = new Phaser.Game 800, 600, Phaser.Auto
  @game.state.add 'boot', new BootState, true
  # @game.state.add 'preloader', new PreloaderState, true
  @game.state.start 'boot'

  true
