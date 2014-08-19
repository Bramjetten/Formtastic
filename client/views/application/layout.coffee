Template.layout.events
  'click #main_container': (e) ->
    $('body').removeClass('navigation-open')
    $('.select-dropdown.opened').removeClass('opened')

Template.layout.rendered = ->
  skrollr.init
  new FastClick(document.body)