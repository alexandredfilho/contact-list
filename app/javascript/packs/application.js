import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require("jquery/src/jquery")
require("bootstrap")
require('admin-lte');
import "popper.js/dist/popper"
import "../stylesheets/application";
import "@fortawesome/fontawesome-free/js/all";
global.toastr = require("toastr")

window.jQuery = $;
window.$ = $;

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('.alert').alert()
        $('.collapse').collapse()
        $('.dropdown-toggle').dropdown()
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
        $('[data-toggle=dropdown]').dropdown()
    })
})
