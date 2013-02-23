
# Default target
all: deps minify up

# Install application dependencies
deps:
	@npm install

# Clean everything
clean:
	@rm -rf ./node_modules .sass-cache public/app.css public/app.js public/app.min.css public/app.min.js

# Compile and minify all front-end files
minify: minify-js minify-sass

# Compile all front-end files
compile: compile-js compile-sass

# Create minified JavaScript
minify-js: compile-js
	@./node_modules/.bin/uglifyjs public/app.js --output public/app.min.js;

# Compile JavaScript modules
compile-js:
	@./node_modules/.bin/browserify script/app.js --outfile public/app.js;

# Create minified CSS from Sass
minify-sass: compile-sass
	@sass ./style/app.scss --style compressed > ./public/app.min.css;

# Create CSS from Sass
compile-sass:
	@sass ./style/app.scss --style expanded > ./public/app.css;

# Run the application
up:
	@npm start
