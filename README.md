#BaseStruct
Base Structure for Client Web Applications

My personal Starter Kit for Building Client Web Application and PhaserJS Game

### Building Dependencies and Structure

####Dependencies
```
    - node.js
        - npm
            - check: npm list
        - bower
            - check: bower list
        - gulp
    - java
        - jre //for selenium testing
```

####Install Build Dependencies

```bash
Vendors Library Dependencies
$ bower install

Development Dependencies
$ npm install
```

####Building
```bash
Build All Packages
$ gulp

Build Debug Package
$ gulp debug

Build Release Package
$ gulp build
```

####Packaging Zip

```bash
Package Debug
$ gulp zip-debug

Package Release
$ gulp zip-release
```

####Testing Unit and E2E

```bash
ALL Test
$ gulp test

Unit Test
$ gulp unit-test

E2E Test
$ gulp e2e-test
```

###Changelog

####v0.0.3

    [x] Update Unit and E2E Test Karma and Protractor
    [x] Group Directory By Feature
    [x] Clean Up bower.json for minimal dependencies use bower to add more libraries

####v0.0.2
* Update Vendor Dependencies for bower and npm

####v0.0.1update
* Update Unit-Testing
* Fixed Protractor Testing

####v0.0.1
* Basic Base Structure
