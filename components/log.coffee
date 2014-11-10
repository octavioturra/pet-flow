noflo = require 'noflo'

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'terminal'
  
  label = 'Log'
  
  c.inPorts.add 'label', (event, payload) ->
    return unless event is 'data'
    label = payload
  
  c.inPorts.add 'in', (event, payload) ->
    return unless event is 'data'
    console.log payload
    setTimeout ()->
    	c.outPorts.out.send payload
  c.outPorts.add 'out'
  c