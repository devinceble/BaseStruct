gulp = require 'gulp'
coffee = require 'gulp-coffee'
jade = require 'gulp-jade'
less = require 'gulp-less'
sourcemaps = require 'gulp-sourcemaps'
livereload = require 'gulp-livereload'
clean = require 'gulp-clean'
zip = require 'gulp-zip'
ngannotate = require 'gulp-ng-annotate'
uglify = require 'gulp-uglify'
cssminify = require 'gulp-minify-css'
concat = require 'gulp-concat'
config = require './package.json'

karma = require 'gulp-karma'
protractor = require('gulp-protractor').protractor

paths =
  vendor: [
    'bower_components/angular/angular.js'
    'bower_components/angular-ui-router/release/angular-ui-router.js'
    'bower_components/phaser/build/phaser.js'
  ]
  vendormin: [
    'bower_components/angular/angular.min.js'
    'bower_components/angular-ui-router/release/angular-ui-router.min.js'
    'bower_components/phaser/build/phaser.min.js'
  ]
  debug: './package/debug'
  release: './package/release'
  jade: './src/*.jade'
  coffee: './src/**/*.coffee'
  less: './src/**/*.less'

jadevar =
  debug:
    pretty: true
    locals:
      the_title: "GoEngas API Client - debug"
      debug: true
  release:
    locals:
      the_title: "GoEngas API Client"
      debug: false

gulp.task 'clean', ->
  gulp.src('package', {read: false})
    .pipe clean({force: true})
    .pipe gulp.dest '.'

gulp.task 'vendors-debug', ['clean'], ->
  gulp.src paths.vendor
    .pipe gulp.dest paths.debug + '/scripts/vendors'
  true

gulp.task 'jade-debug', ['clean'], ->
  gulp.src paths.jade
    .pipe sourcemaps.init()
    .pipe jade jadevar.debug
    .pipe sourcemaps.write '.'
    .pipe gulp.dest paths.debug
  true

gulp.task 'coffee-debug', ['clean'], ->
  gulp.src paths.coffee
    .pipe sourcemaps.init()
    .pipe coffee({bare:true})
    .pipe ngannotate()
    .pipe sourcemaps.write '.'
    .pipe gulp.dest paths.debug
  true

gulp.task 'less-debug', ['clean'], ->
  gulp.src paths.less
    .pipe sourcemaps.init()
    .pipe less()
    .pipe sourcemaps.write '.'
    .pipe gulp.dest paths.debug
  true

gulp.task 'jade-build', ['clean'], ->
  gulp.src paths.jade
    .pipe jade jadevar.release
    .pipe gulp.dest paths.release
  true

gulp.task 'coffee-build', ['clean'], ->
  gulp.src paths.coffee
    .pipe coffee({bare:true})
    .pipe ngannotate()
    .pipe concat('scripts/appClient.min.js')
    .pipe uglify()
    .pipe gulp.dest paths.release
  true

gulp.task 'less-build', ['clean'], ->
  gulp.src paths.less
    .pipe less()
    .pipe concat('styles/main.min.css')
    .pipe cssminify()
    .pipe gulp.dest paths.release
  true

gulp.task 'vendors-build', ['clean'], ->
  gulp.src paths.vendormin
    .pipe concat('scripts/vendors.min.js')
    .pipe uglify()
    .pipe gulp.dest  paths.release
  true

gulp.task 'zip-debug', ->
  gulp.src './package/debug/**/*'
    .pipe zip 'debug-'+config.version+'.zip'
    .pipe gulp.dest './package'

gulp.task 'zip-release', ->
  gulp.src './package/release/**/*'
    .pipe zip 'release-'+config.version+'.zip'
    .pipe gulp.dest './package'

gulp.task 'debug', ['jade-debug', 'coffee-debug', 'less-debug', 'vendors-debug']
gulp.task 'build', ['jade-build', 'coffee-build', 'less-build', 'vendors-build']
gulp.task 'test', ['unit-test', 'e2e-test']

gulp.task 'default' , ['debug', 'build']
# debug -> build with sourcemaps easy development
# build -> build without sourcemaps production

unitTest = [
  'test/unit/**/*Spec.coffee'
]

gulp.task 'unit-test', ->
  gulp.src unitTest
    .pipe karma
      configFile: 'karma.config.coffee'
      action: 'run'
    .on 'error', (err)->
      throw err

e2eTest = [
  'test/e2e/*.coffee'
]

gulp.task 'e2e-test', ->
  gulp.src e2eTest
    .pipe protractor
      configFile: 'protractor.config.coffee'
    .on 'error', (err)->
      throw err
  true
