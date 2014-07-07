Router.configure
  layoutTemplate: 'layout'

Router.map ->
  this.route 'formNew', { 
    path: '/new'
    template: 'formEdit'
    data: -> 
      return Forms.findOne(Forms.insert({}))
  }

  this.route 'formEdit', {
    path: '/:id/edit'
    data: ->
      return Forms.findOne(this.params._id)
  }
