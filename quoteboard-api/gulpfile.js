const gulp = require("gulp");

gulp.task("build",["clean", "incrementalBuild"]);

gulp.task("incrementalBuild", () => {
  const ts = require("gulp-typescript");
  const sourcemaps = require("gulp-sourcemaps");

  const tsProject = ts.createProject("tsconfig.json");
  const tsResult = gulp.src("src/**/*.ts")
      .pipe(sourcemaps.init())
      .pipe(tsProject());

      return tsResult.js
        .pipe(sourcemaps.write())
        .pipe(gulp.dest("build"));
});


gulp.task("clean", () =>{
  const clean = require("gulp-clean");
  return gulp.src("build/").pipe(clean());
});
