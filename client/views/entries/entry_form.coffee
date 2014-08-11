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
      placeholder:  form.find('[name="placeholder"]').val()
      label:        form.find('textarea[name="label"]').val()
      entryType:    form.find('select[name="entry-type"]').val()
    }

    # Update entry with new placeholder text
    Entries.update entryId, {$set: entryProperties}, (error) ->
      if error
        alert(error.reason)

Template.entry.helpers
  listItems: ->
    name = this.label.match(/(.*)\n/)[1]
    return this.placeholder.split("\n").map (item) => {name: name, item: item}

Template.entry.entryIs = (entryType) ->
  return this.entryType is entryType

Template.entryForm.entryIs = (entryType) ->
  return this.entryType is entryType

Template.entryForm.rendered = () ->
  if !this._rendered
    this._rendered = true
    $('textarea.control-label-textarea').autosize()
