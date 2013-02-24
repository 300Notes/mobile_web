
exports.Client = (function () {

    // Constructor
    function Client (url) {
        var self = this;
        this.isOpen = false;
        this.messageHandlers = [];
        this.ws = new (WebSocket || MozWebSocket)(url);
        this.ws.onopen = function () {
            self.isOpen = true;
            self.ws.onmessage = function (event) {
                var data = event.data;
                if (typeof data !== 'string') {
                    return;
                }
                data = JSON.parse(data);
                var i; len = self.messageHandlers.length;
                for (i = 0; i < len; i ++) {
                    self.messageHandlers[i](data);
                }
            };
            self.send({
                command: 'post',
                messageType: 'settings',
                binary: false
            });
        };
        this.ws.onclose = function () {
            this.isOpen = false;
        };
    }

    // Add a message handler
    Client.prototype.onMessage = function (handler) {
        this.messageHandlers.push(handler);
    };

    // Send a message
    Client.prototype.send = function (message) {
        this.ws.send(JSON.stringify(message));
    };

    // Exports
    return Client;

} ());
