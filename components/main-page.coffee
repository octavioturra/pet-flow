noflo = require 'noflo'

exports.getComponent = ->
  c = new noflo.Component
  c.icon = 'newspaper-o'
  
  header = ''
  main = ''
  
  template = """
		<header class="navbar navbar-default navbar-fixed-top">
			#{header}
		</header>
		<main class="container-fluid">
			#{main}
		</main>
	"""
  
  c.inPorts.add 'header', (event, payload)->
    header = payload
  c.inPorts.add 'main', (event, payload)->
    main = payload
    
  c.inPorts.add 'container', (event, payload) ->
    return unless event is 'data'
    
    payload.innerHTML = template  
    
    c.outPorts.element.send payload
    
  c.outPorts.add 'element'
  c