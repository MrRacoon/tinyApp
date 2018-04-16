'use strict';

const WebSocketServer = require('ws').Server;
const fs = require('fs');

// =============================================================================

const PORT =
  process.env.SIMPLE_APP_PORT || 8081;

const HOST =
  process.env.SIMPLE_APP_HOST || '127.0.0.1';

const CONFIG =
  process.env.SIMPLE_APP_CONFIG || `${__dirname}/../config.json`;

// =============================================================================

const wss = new WebSocketServer({ port: PORT });
console.log('starting websockets server at %s on %s', HOST, PORT);

// =============================================================================

let conId = 0;

wss.on('connection', function connection(ws) {
  ws.id = conId++;
  console.log('CON: %s', ws.id)
  conId = conId++;
  ws.on('message', function incoming(message) {
    console.log('MSG: %s', message);
    const msg = JSON.parse(message);
  });
  ws.on('close', function diconnected(code, message) {
    console.log('DIS: %s %s', code, message);
  });
  ws.send(readConfig());
});

// =============================================================================

function sendToOne(sock, msg) {
  console.log('SND: %s %s', sock.id, msg)
  sock.send(msg);
}

function sendToAll(str) {
  console.log('S2A: %s', str)
  wss.clients.forEach(function each(client) {
    client.send(str);
  });
}

// =============================================================================

function readConfig() {
  return fs.readFileSync(CONFIG, 'utf8');
}

fs.watch(CONFIG, { persistent: true }, (event, filename) => {
  console.log('event', event);
  console.log('filename', filename);
  if (event === 'change') {
    console.log('pushing new configs');
    sendToAll(readConfig());
  }
});
