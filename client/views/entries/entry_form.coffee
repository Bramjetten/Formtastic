Template.entryForm.events
  'click .delete-entry': (e) ->
    e.preventDefault()

    entryId = this._id
    Entries.remove(entryId)

  'click .entry-label': (e) ->
    e.preventDefault()
    e.stopPropagation()
    if $(e.target).closest('.entry-type').hasClass('opened')
      $('.entry-type').removeClass('opened')
    else
      $('.entry-type').removeClass('opened')
      $(e.target).closest('.entry-type').addClass('opened')
    

  'click .entry-type .dropdown a': (e) ->
    e.stopPropagation()
    e.preventDefault()
    value = $(e.target).attr('data-value')
    Entries.update this._id, {$set: {entryType: value}}
    $('.entry-type.opened').removeClass('opened')

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
      entryType:    form.find('input[name="entry-type"]').val()
    }

    # Update entry with new placeholder text
    Entries.update entryId, {$set: entryProperties}, (error) ->
      if error
        alert(error.reason)

Template.entry.helpers
  labelName: ->
    matches = this.label.match(/(.*)\n?/) if this.label
    if matches and matches.length > 1
      return matches[1]

  listItems: ->
    matches = this.label.match(/(.*)\n?/) if this.label
    if matches and matches.length > 1
      return ({name: matches[1], value: item} for item in this.placeholder.split("\n"))

Template.entry.entryIs = (entryType) ->
  return this.entryType is entryType

Template.entryForm.entryIs = (entryType) ->
  return this.entryType is entryType

Template.entryForm.rendered = () ->
  if !this._rendered
    this._rendered = true
    $('textarea.control-label-textarea').autosize()
