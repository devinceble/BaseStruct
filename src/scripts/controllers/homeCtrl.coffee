appClient = angular.module('goEngas')

appClient.controller "HomeCtrl", ($scope)->
  args = [
    '%c %c It Works! %c ',
    'background: #0f2034',
    'color: #e2e2e2; background: #0f2036',
    'background: #0f2034'
  ]
  console.log.apply(console, args)

  $scope.selectedState = "Home Controller"
  @game = new Phaser.Game 800, 600, Phaser.Auto
  @game.state.add 'boot', new BootState, true
  # @game.state.add 'preloader', new PreloaderState, true
  @game.state.start 'boot'

  true
