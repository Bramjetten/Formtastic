Template.entry.helpers
  labelName: ->
    matches = this.label.match(/(.*)\n?/) if this.label
    if matches and matches.length > 1
      return matches[1]

  listItems: ->
    matches = this.label.match(/(.*)\n?/) if this.label
    if matches and matches.length > 1
      return ({name: matches[1], value: item} for item in this.placeholder.split("\n"))

Template.entry.entryIs = (entryType) ->
  return this.entryType is entryType

Template.entry.rendered = ->
  if !this._rendered
    this._rendered = true

    switch this.data.entryType
      when 'postal_code'
        new Formatter $(this.firstNode).find('input')[0],
          'pattern': '{{9999}} {{aa}}'