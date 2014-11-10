noflo = require 'noflo'

exports.getComponent = ->
  c = new noflo.Component
  c.icon = ''
  c.inPorts.add 'head', datatype: 'object', (event, payload) ->
    return unless event is 'data'
    
    script = document.createElement('script')
    script.onload = ()->
      c.outPorts.out.send window.ko
      
    script.src = '//cdnjs.cloudflare.com/ajax/libs/knockout/3.2.0/knockout-min.js'
    
    payload.appendChild script
    
  c.outPorts.add 'library'
  c