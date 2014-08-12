UI.registerHelper 'selected', (key, value) ->
  return if key is value then {selected: 'selected'} else ''

UI.registerHelper 'routeIs', (routeName) ->
  return Router.current().route.name is routeName