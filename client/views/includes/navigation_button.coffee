Template.navigationButton.events
  'click #navigation_button': (e) ->
    e.stopPropagation()
    $('#threed_wrapper').addClass('navigation-open')
