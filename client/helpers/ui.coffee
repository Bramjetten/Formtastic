UI.registerHelper 'selected', (key, value) ->
  return if key is value then {selected: 'selected'} else ''