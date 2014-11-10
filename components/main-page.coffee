noflo = require 'noflo'

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'newspaper-o'
  
  header = ''
  main = ''
    
  c.inPorts.add 'header', (event, payload)->
    return unless event is 'data'
    console.log payload, 'header'
    header = payload
    
  c.inPorts.add 'main', (event, payload)->
    return unless event is 'data'
    console.log payload, 'main'
    main = payload
    
  c.inPorts.add 'container', datatype: 'object', (event, payload) ->
    return unless event is 'data'
    setTimeout ()->
      payload.innerHTML = """
		<header class="navbar navbar-default navbar-fixed-top">
			#{header}
		</header>
		<main class="container-fluid">
			#{main}
		</main>
	  """  
    
      c.outPorts.element.send payload  
    
  c.outPorts.add 'element'
  c