Router.configure
  layoutTemplate: 'layout'

Router.map ->
  this.route 'formNew', { 
    path: '/new'
    template: 'formEdit'
    data: -> return Forms.findOne(Forms.insert({}))
  }

  this.route 'formEdit', {
    path: '/:_id/edit'
    data: -> return Forms.findOne(this.params._id)
  }

  this.route 'form', {
    path: '/:_id'
    data: -> return Forms.findOne(this.params._id)
  }
