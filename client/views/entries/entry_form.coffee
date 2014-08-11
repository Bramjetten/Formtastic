Template.entryForm.events
  'click .delete-entry': (e) ->
    e.preventDefault()

    entryId = this._id
    Entries.remove(entryId)

  'change form': (e) ->
    e.preventDefault()

    # Get current entryId
    entryId = this._id

    # Get the form
    form = $(e.target).closest('form')

    # Set entry properties
    entryProperties = {
      placeholder:  form.find('input[name="placeholder"]').val()
      label:        form.find('textarea[name="label"]').val()
    }

    # Update entry with new placeholder text
    Entries.update entryId, {$set: entryProperties}, (error) ->
      if error
        alert(error.reason)

Template.entryForm.rendered = () ->
  if !this._rendered
    this._rendered = true
    console.log 'Template load!'
    $('textarea').autosize()