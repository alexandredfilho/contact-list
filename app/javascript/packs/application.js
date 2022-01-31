import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery/dist/jquery"
require("bootstrap")
require('admin-lte');
import "popper.js/dist/popper"
import "../stylesheets/application";
import "@fortawesome/fontawesome-free/js/all";


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
    })
})
