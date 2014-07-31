@Forms = new Meteor.Collection('forms')

Meteor.methods
  newForm: ->
    formId = Forms.insert(userId: Meteor.userId())
    return formId