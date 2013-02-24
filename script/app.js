
var Client = require('./client').Client;

var host = window.document.location.host.replace(/:.*/, '');
var sock = new Client('ws://' + host + ':1234');

sock.onMessage(function (data) {
    console.log(data);
});
