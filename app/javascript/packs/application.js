import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("bootstrap")
import "../stylesheets/application";
document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('.alert').alert()
        $('.collapse').collapse()
        $('.dropdown-toggle').dropdown()
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})

require('admin-lte');
import "@fortawesome/fontawesome-free/js/all";
