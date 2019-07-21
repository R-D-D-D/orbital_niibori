document.addEventListener("turbolinks:load", function() {

  // search form autocomplete

  $input = $("[data-behavior='autocomplete']");

  var controller = $('.form-control').data('controller');
  var action     = $('.form-control').data('action');

  var options = {
    getValue: "title",
    url: function(phrase) {

      if (controller === "tutors") {
        if (action === "show") {
          id = $('.form-control').data('id');
          return "/tutors/" + id + "/courses.json?search_profile=" + phrase;
        } 
      } else if (controller === "students") {
        id = $('.form-control').data('id');
        return "/students/" + id + "/courses.json?search_profile=" + phrase;
      } else {
        return "/courses.json?search=" + phrase; 
      }

    },
    list: {
      onChooseEvent: function() {
        var url = $input.getSelectedItemData().url;
        $input.val("");
        Turbolinks.visit(url);
      },
    }
  };

  $input.easyAutocomplete(options);

  // course card hover shadow

  $(document).on({
    mouseenter: function() {
      $(this).removeClass("shadow-sm");
      $(this).addClass("shadow");
      $(this).css({"width": "101%", "height": "101%", "margin-top": "-0.5%", "margin-left": "-0.5%"});
    },
    mouseleave: function() {
      $(this).removeClass("shadow");
      $(this).addClass("shadow-sm");
      $(this).css({"width": "100%", "height": "100%", "margin-top": "0%", "margin-left": "0%"});
    }
  }, '.course-card');

  // disable inputs and links on form submits

  $('form').submit(function() {
    // greys out form links and inputs only if the form was not a search form
    if ($(this).hasClass("search-bar") === false) {
      $('.form-control').attr("readonly", true);
      $('.form-control-file').css({"display": "none"});

      var links = $('a,#logo').not($(this));
      links.addClass("disabled");
    }
  });
});
