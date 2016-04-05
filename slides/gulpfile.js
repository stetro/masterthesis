var gulp = require('gulp');
var sass = require('gulp-sass');
var concat = require('gulp-concat');
var browserSync = require('browser-sync').create();


gulp.task('default', ['sass']);

gulp.task('sass', function () {
	gulp.src('css/*.scss')
		.pipe(sass().on('error', sass.logError))
		.pipe(concat('main.css'))
		.pipe(gulp.dest('css/'))
		.pipe(browserSync.stream());
});

gulp.task('serve', ['default'], function() {
    browserSync.init({
        server: "./"
    });

    gulp.watch("css/*.scss", ['sass']);
    gulp.watch("index.html").on('change', browserSync.reload);
});