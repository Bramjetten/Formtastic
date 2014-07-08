Template.formShare.events
  'click #overlay': (e) ->
    $('#overlay').hide()

  'click .modal-container': (e) ->
    e.stopPropagation()

  'click .close-modal': (e) ->
    e.preventDefault()
    $('#overlay').hide()

  'submit form': (e) ->
    e.preventDefault()

    # Get current form
    formId = this._id

    # Set new properties
    formProperties = {
      creator: $(e.target).find('input[name="creator"]').val()
      email: $(e.target).find('input[name="email"]').val()
      personal_message: $(e.target).find('textarea[name="personal_message"]').val()
    }

    # Update form with new name
    Forms.update formId, {$set: formProperties}, (error) ->
      if error
        alert(error.reason)

    # Hide the share modal
    $('#overlay').hide()