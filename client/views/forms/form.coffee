Template.form.helpers
  entries: ->
    return Entries.find({formId: this._id}, {sort: {addedAt: 1}})

Template.form.events
  'submit form': (e) ->
    e.preventDefault()

    # Get form data
    form = $(e.target).serializeArray()

    # Compose email
    mailContent = ""
    for field in form
      mailContent += "#{field.name}: #{field.value}<br />"

    if confirm("Heb je alles goed ingevuld?")
      # Send email with Mandrill
      Meteor.call('sendEmail', this.email, "Ingevuld formulier: #{this.name}", mailContent)

      # Disable button
      $(e.target).find('button[type="submit"]').prop('disabled', true).text('Formulier verzonden').removeClass('icon-mail').addClass('icon-tick')