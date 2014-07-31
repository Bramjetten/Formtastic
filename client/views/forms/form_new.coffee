Template.formNew.events
  'click .form-new-button': (e) ->
    e.preventDefault()

    # Create an empty form
    Meteor.call 'newForm', {}, (error, formId) ->
      if error
        return alert(error.reason)

      # Redirect to new form
      Router.go('formEdit', {_id: formId})
