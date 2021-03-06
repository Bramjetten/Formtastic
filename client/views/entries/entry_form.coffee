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
      description:  form.find('textarea[name="description"]').val()
      entryType:    form.find('input[name="entry-type"]').val()
    }

    # Update entry with new placeholder text
    Entries.update entryId, {$set: entryProperties}, (error) ->
      if error
        alert(error.reason)

Template.entryForm.helpers
  entryTypeLabel: ->
    entryTypes =
      text:         'Tekstregel'
      textarea:     'Tekstveld'
      email:        'Email'
      postal_code:  'Postcode'
      numeric:      'Numeriek'
      currency:     'Valuta'
      date:         'Datum'
      time:         'Tijd'
      radio:        'Enkele keuze'
      checkbox:     'Meerkeuze'

    return entryTypes[this.entryType]

Template.entryForm.entryIs = (entryType) ->
  return this.entryType is entryType

Template.entryForm.rendered = ->
  if !this._rendered
    this._rendered = true
    $('textarea.control-label-textarea').autosize()
    new Sortable document.getElementById('formEntries'),
      handle: '.drag-handle'
      onUpdate: (event) ->
        $('#formEntries .entry-form').each (index) ->
          Entries.update $(this).data('id'), {$set: {order: index}}, (error) ->
            if error
              alert(error.reason)
