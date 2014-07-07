@Entries = new Meteor.Collection('entries')

Meteor.methods
  addEntry: (entryAttributes) ->
    entry = entryAttributes
    entry._id = Entries.insert(entry)
    return entry._id