#BaseStruct
Base Structure for Client Web Applications

### Building the game

Dependencies
    - node.js
        - npm
        - bower
        - gulp

Install Build Dependencies

```bash
Vendors Library Dependencirs
$ bower install

Development Dependencies
$ npm install
```

Building
```bash
Build All Packages
$ gulp

Build Debug Package
$ gulp debug

Build Release Package
$ gulp build
```

Packaging Zip

```bash
Package Debug
$ gulp zip-debug

Package Release
$ gulp zip-release
```

Testing Unit and E2E

```bash
Unit Test
$ gulp unit-test

E2E Test
$ webdriver-manager start
$ protractor protractor.config.coffee
```
