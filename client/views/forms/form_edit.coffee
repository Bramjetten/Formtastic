Template.formEdit.events
  'click .add-entry': (e) ->
    e.preventDefault()

    # Create new dummy entry
    entry = {
      formId: this._id
      label: 'Label'
      placeholder: 'Vul hier in'
    }

    # Actually call the method to add it
    Meteor.call 'addEntry', entry, (error, entryId) ->
      if error
        return alert(error.reason)

Template.formEdit.helpers
  entries: ->
    return Entries.find(formId: this._id)