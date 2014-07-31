# Mandrill API settings
Meteor.startup ->
  Meteor.Mandrill.config
    username: "app27953947@heroku.com"
    key: "Sy0jOkpfNADrhRVvVWNF4g"

# Meteor methods
Meteor.methods
  # Sending emails using Mandrill
  sendEmail: (to, subject, htmlText) ->
    Meteor.Mandrill.send
      to: to
      from: "no-reply@formtastic.io"
      subject: subject
      html: htmlText
