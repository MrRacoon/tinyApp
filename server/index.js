'use strict';

const WebSocketServer = require('ws').Server;
const fs = require('fs');
const watch = require('node-watch');

// =============================================================================
// Configuration

const PORT =
  process.env.SIMPLE_APP_PORT || 8081;

const HOST =
  process.env.SIMPLE_APP_HOST || '127.0.0.1';

const CONFIG =
  process.env.SIMPLE_APP_CONFIG || `${__dirname}/../config.json`;

// =============================================================================
// Web socketeering

const wss = new WebSocketServer({ port: PORT });
console.log('starting websockets server at %s on %s', HOST, PORT);

let conId = 0;

wss.on('connection', ws => {
  ws.id = conId++;
  console.log('CON: %s', ws.id)
  ws.on('message', message => {
    console.log('MSG: %s', message);
    const msg = JSON.parse(message);
  });
  ws.on('close', function diconnected(code, message) {
    console.log('DIS: %s %s', code, message);
  });
});

// =============================================================================
// File watching

watch(CONFIG, { persistent: true }, (evt, name) => {
  if (evt === 'update') {
    readConfig().map(
      config => sendToAll(config)
    );
  }
})

// =============================================================================
// Utility

function readConfig () {
    try {
      const str = fs.readFileSync(CONFIG, 'utf8');
      console.log('Contents:', str);
      const msg = JSON.stringify(JSON.parse(str));
      console.log('Parse Success');
      return [msg];
    } catch (e) {
      console.error(e);
      return [];
    }
}

function sendToOne(sock, msg) {
  console.log('SND: %s %s', sock.id, msg)
  sock.send(msg);
}

function sendToAll(str) {
  console.log('S2A: %s', str)
  wss.clients.forEach(client =>
    client.send(str)
  );
}
