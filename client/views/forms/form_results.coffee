Template.formResults.helpers
  results: ->
    return Results.find({formId: this._id}, {sort: {addedAt: -1}})