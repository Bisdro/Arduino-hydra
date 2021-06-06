msg.setPort(51000)
msg.on('/test', (args) => {
 blueMapHydra = args[0]

})
osc(100)
.color(()=>blueMapHydra)
.out()
  
