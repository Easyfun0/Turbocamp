// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "stylesheets";
import "stylesheets/tailwind";
import "@fortawesome/fontawesome-free/css/regular";
import "@fortawesome/fontawesome-free/css/solid";
import "@fortawesome/fontawesome-free/css/fontawesome";

Turbolinks.start();
Rails.start();
ActiveStorage.start();

import "controllers";
