// application.js
import Rails from "@rails/ujs";
import { Turbo } from "@hotwired/turbo-rails";

Rails.start();
Turbo.start();


// Import your controllers
import "controllers"

// Import additional JavaScript files
import "bootstrap/dist/js/bootstrap.bundle.min"
import "tiny-slider/dist/tiny-slider"
import "custom"

// Optionally, if you have external libraries
// import "path/to/external/library"

// Note: Ensure that the paths are correct based on your project structure and installed npm packages.
