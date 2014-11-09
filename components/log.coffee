noflo = require 'noflo'

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'terminal'
  c.inPorts.add 'in', (event, payload) ->
    return unless event is 'data'
    console.log payload
    c.outPorts.out.send payload
  c.outPorts.add 'out'
  c