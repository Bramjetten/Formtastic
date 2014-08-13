Template.navigationButton.events
  'click #navigation_button': (e) ->
    e.stopPropagation()
    e.preventDefault()
    $('body').addClass('navigation-open')
