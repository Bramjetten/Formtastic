Template.navigation.events
  'click #navigation li > a': (e) ->
    $('#threed_wrapper').toggleClass('navigation-open')

Template.navigation.helpers
  forms: ->
    return Forms.find({userId: Meteor.userId()}) if Meteor.user()