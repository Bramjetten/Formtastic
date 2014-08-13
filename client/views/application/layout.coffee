Template.layout.events
  'click .navigation-open #main_container': (e) ->
    $('#threed_wrapper').removeClass('navigation-open')

  'click #threed_wrapper': (e) ->
    $('.select-dropdown.opened').removeClass('opened')

Template.layout.rendered = ->
  skrollr.init
    forceHeight: false