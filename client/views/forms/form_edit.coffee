Template.formEdit.events
  'keyup #header input[name="name"]': (e) ->
    formId = this._id

    # Update form with new name
    Forms.update formId, {$set: {name: $(e.target).val()}}, (error) ->
      if error
        alert(error.reason)

  'click .add-entry': (e) ->
    e.preventDefault()

    # Create new dummy entry
    entry = {
      formId: this._id
      label: 'Label'
      placeholder: 'Vul hier in'
      addedAt: new Date().getTime()
    }

    # Actually call the method to add it
    Meteor.call 'addEntry', entry, (error, entryId) ->
      if error
        return alert(error.reason)

  'click .share-form': (e) ->
    e.preventDefault()
    $('#overlay').show()
    if $('.modal input[name="email"]').val() is ""
      $('.modal input[name="email"]').val("#{Meteor.user().emails[0].address}")

Template.formEdit.helpers
  entries: ->
    return Entries.find({formId: this._id}, {sort: {addedAt: 1}})