Template.entry.events
  'change input[type="text"]': (e) ->
    e.preventDefault()

    # Get current entryId
    entryId = this._id
    
    # Set entry properties
    entryProperties = {
      placeholder: $(e.target).val()
    }

    # Update entry with new placeholder text
    Entries.update entryId, {$set: entryProperties}, (error) ->
      if error
        alert(error.reason)
