#BaseStruct
Base Structure for Client Web Applications

### Building Dependencies and Structure

Dependencies
```
    - node.js
        - npm
        - bower
        - gulp
    - java
        - jre
```

Install Build Dependencies

```bash
Vendors Library Dependencies
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
ALL Test
$ gulp test

Unit Test
$ gulp unit-test

E2E Test
$ gulp e2e-test
```
