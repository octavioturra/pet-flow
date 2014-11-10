noflo = require 'noflo'

exports.getComponent = ->
  c = new noflo.Component
  
  ko = {}
  vm = {}
  
  c.inPorts.add 'ko', (event, payload) ->
    return unless event is 'data'
    ko = payload
  
  c.inPorts.add 'viewModel', (event, payload) ->
    return unless event is 'data'
    vm = payload
    
  c.inPorts.add 'el', (event, payload) ->
    return unless event is 'data'
    setTimeout ()->
      ko.applyBindings vm, ko
      c.outPorts.out.send payload
  c.outPorts.add 'out'
  c