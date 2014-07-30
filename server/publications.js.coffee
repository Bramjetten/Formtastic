# in server code
Meteor.startup ->
  Meteor.Mandrill.config
    username: "app27953947@heroku.com"
    key: "Sy0jOkpfNADrhRVvVWNF4g"

# server method to send email via mandrill
Meteor.methods
  sendEmail: (to, subject, htmlText) ->
    Meteor.Mandrill.send
      to: to
      from: "no-reply@formtastic.io"
      #cc, bcc, replyTo
      subject: subject
      html: htmlText
