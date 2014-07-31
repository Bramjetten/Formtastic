Router.configure
  layoutTemplate: 'layout'

Router.map ->
  this.route 'formNew', { 
    path: '/'
  }

  this.route 'formNew', {
    path: '/new'
  }

  this.route 'formEdit', {
    path: '/:_id/edit'
    data: -> return Forms.findOne(this.params._id)
  }

  this.route 'form', {
    path: '/:_public_link'
    data: -> return Forms.findOne(public_link: this.params._public_link)
  }
