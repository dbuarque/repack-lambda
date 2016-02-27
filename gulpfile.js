var gulp = require('gulp'),
    zip = require('gulp-zip'),
    del = require('del'),
    install = require('gulp-install'),
    runSequence = require('run-sequence'),
    lambda = require("node-aws-lambda"),
    rimraf = require('rimraf');

//load release-it tasks
require('gulp-release-it')(gulp);

gulp.task('modules', function() {
    return gulp.src('./package.json')
        .pipe(gulp.dest('dist/'))
        .pipe(install({production: true}));
});

gulp.task('zip', function() {
    return gulp.src(['dist/**/*', '!dist/package.json'])
        .pipe(zip('./tmp/dist.zip'))
        .pipe(gulp.dest('./'));
});

gulp.task('upload', function(callback) {
    lambda.deploy('./tmp/dist.zip', require('./config/'+process.env.APP+'.config.js'), callback);
});

gulp.task('deploy', function(callback) {
    return runSequence(
        ['modules'],
        ['zip'],
        ['upload'],
        callback
    );
});