Template.result.helpers
  timestamp: ->
    moment.locale('nl')
    return moment(@addedAt).fromNow()