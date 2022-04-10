let gulp = require("gulp");
let autoprefixer = require("gulp-autoprefixer");
let rename = require("gulp-rename");
let del = require("del");

var configs = {
  autoprefixer: {
    browsers: [
      "last 2 versions",
      "> 1%",
      "Chrome >= 40",
      "Firefox >= 40",
      "ie >= 10",
      "Safari >= 8",
    ],
  },
  cleanCSS: {
    compatibility: "ie10",
  },
};

function copyDist() {
  return gulp.src("dist/**/*").pipe(gulp.dest("public"));
}

function copyAssets() {
  return gulp.src("src/**/*").pipe(gulp.dest("public"));
}

function clean() {
  return del(["public/**/*"]);
}

exports.clean = clean;
exports.copyDist = copyDist;
exports.copyAssets = copyAssets;

gulp.task("build", gulp.series(clean, gulp.series(copyAssets, copyDist)));

gulp.task("default", gulp.series("build"));

gulp.task("watch", function () {
  gulp.watch("src/**", gulp.series("build"));
});
