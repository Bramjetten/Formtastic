Template.form.helpers
  entries: ->
    return Entries.find({formId: this._id}, {sort: {addedAt: 1}})

Template.form.events
  'submit form': (e) ->
    e.preventDefault()

    # Get form data
    result = {
      formId: this._id
      content: $(e.target).serializeArray()
      addedAt: new Date().getTime()
    }

    console.log result

    # Compose email
    mailContent = ""
    for field in result.content
      mailContent += "#{field.name}: #{field.value}<br />"

    if confirm("Heb je alles goed ingevuld?")
      # Add filled in form as result
      Meteor.call 'addResult', result, (error, resultId) ->
        if error
          return alert(error.reason)

      # Send email with Mandrill
      Meteor.call('sendEmail', this.email, "Ingevuld formulier: #{this.name}", mailContent)

      # Disable button
      $(e.target).find('button[type="submit"]').prop('disabled', true).text('Formulier verzonden').removeClass('icon-mail').addClass('icon-tick')
