Template.layout.events
  'click .navigation-open #main_container': (e) ->
    $('#threed_wrapper').removeClass('navigation-open')

Template.layout.rendered = ->
  skrollr.init
    forceHeight: false