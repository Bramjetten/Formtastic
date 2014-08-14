Template.navigation.events
  'click #navigation li > a': (e) ->
    $('body').toggleClass('navigation-open')

Template.navigation.helpers
  forms: ->
    return Forms.find({userId: Meteor.userId()}) if Meteor.user()