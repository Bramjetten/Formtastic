@Results = new Meteor.Collection('results')

Meteor.methods
  addResult: (resultAttributes) ->
    result = resultAttributes
    result._id = Results.insert(result)
    return result._id