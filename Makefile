
# Default target
all: deps minify-sass up

# Install application dependencies
deps:
	@npm install

# Create minified CSS from Sass
minify-sass: compile-sass
	@sass ./style/app.scss --style compressed > "./public/app.min.css";

# Create CSS from Sass
compile-sass:
	@sass ./style/app.scss --style expanded > "./public/app.css";

# Run the application
up:
	@npm start
