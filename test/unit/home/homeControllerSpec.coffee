describe "baseStruct", ->
  beforeEach module('baseStruct')
  beforeEach inject ($rootScope, $controller) ->
    @scope = $rootScope.$new()
    @ctrl = $controller "HomeCtrl", $scope: @scope
    true

  it "should have a value", () ->
    expect @scope.sample
      .toBe "Test1"
  true
