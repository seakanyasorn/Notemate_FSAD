// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import Rails from "@rails/ujs"; // Import Rails UJS for method: :delete
Rails.start(); // Start Rails UJS

//= require jquery
//= require jquery_ujs