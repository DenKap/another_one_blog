//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require bootstrap-sprockets
//= require_tree .
setTimeout(function() {
    $('#notification').hide();
}, 2000);

$(document).ready(function() {
    $('#mycarousel').carousel({
        interval: 5000
    });
});
