describe 'angularjs homepage', ->
  it 'should have a title', ->
    browser.get 'http://localhost:8000'
    expect browser.getTitle()
      .toEqual "BaseStruct Client - 0.0.3"
