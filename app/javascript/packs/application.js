// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
import "jquery";
require.context('../assets/images/', true)

import "../assets/stylesheets/application";
import "../assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css";
import "../assets/fonts/Linearicons-Free-v1.0.0/icon-font.min.css";
import "../vendor/bootstrap/css/bootstrap.min.css";
import "../vendor/animate/animate.css";
import "../vendor/css-hamburgers/hamburgers.min.css";
import "../vendor/animsition/css/animsition.min.css";
import "../vendor/select2/select2.min.css";
import "../vendor/daterangepicker/daterangepicker.css";

Rails.start();
Turbolinks.start();
ActiveStorage.start();
