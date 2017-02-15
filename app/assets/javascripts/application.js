// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery
//= require bootstrap-sprockets
//= require jquery.validate
//= require contacts
//= require_tree .

$(document).ready(function(){
  $("#home-blurb").fadeTo(900, 1);
  $("#img-caption").delay(300).fadeTo(900,1)
  $("#skills").delay(400).fadeTo(900,1)
  $("#development-fade").delay( (Math.floor(Math.random() * 1300) + 850) ).fadeTo(550, 1);
  $("#about-fade").delay( (Math.floor(Math.random() * 1300) + 850) ).fadeTo(550, 1);
  $("#design-fade").delay( (Math.floor(Math.random() * 1300) + 850) ).fadeTo(550, 1);
  $("#info-fade").delay( (Math.floor(Math.random() * 1300) + 850) ).fadeTo(550, 1);
});
