exports.config =
    seleniumServerJar: './node_modules/protractor/selenium/selenium-server-standalone-2.43.1.jar'
    # seleniumAddress: 'http://localhost:4444/wd/hub'
    specs: "test/e2e/**/*.coffee"
