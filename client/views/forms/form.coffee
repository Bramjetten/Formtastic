Template.form.helpers
  entries: ->
    return Entries.find({formId: this._id}, {sort: {addedAt: 1}})