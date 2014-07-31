Template.navigationButton.events
  'click #navigation_button': (e) ->
    $('body').toggleClass('navigation-open')

  'keyup': (e) ->
    alert 'yo'