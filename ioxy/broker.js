const aedes = require('aedes')()
const server = require('net').createServer(aedes.handle)
const port = 1884

server.listen(port, function () {
    console.log("\n==== Remote Door Controller ====\n") 
    console.log("[+] MQTT broker started and listening on port ", port)
})

aedes.on('publish', async function (packet, client) {
    if (client != null) {
        // console.log(client.id)
        console.log("[!] Command received! Opening \x1b[31mDoor " + packet.topic.substring(18,19) + '\x1b[0m')
        // console.log('[!] Client \x1b[31m' + client.id + '\x1b[0m has published', packet.payload.toString(), 'Topic: ', packet.topic)
    }
})