Template.navigationButton.events
  'click #navigation_button': (e) ->
    e.stopPropagation()
    e.preventDefault()
    $('#threed_wrapper').addClass('navigation-open')
