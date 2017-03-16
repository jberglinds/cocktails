"use strict";

let events;

exports.setup = function(io) {
	events = io.of('/events');

	events.on('connection', (socket) => {

		socket.on('join', (req) => {
			let event_id = req.event_id;
		    socket.join(event_id);
			console.log("Client socket connected to event "+event_id);
		})

	})

};

exports.emitSpiritUpdate = function(event_id, spirit_id, action) {
	events.to(event_id).emit('spirit_update', {
		spirit_id: spirit_id,
		action: action // 'add' or 'remove'
	});
}

exports.emitMixerUpdate = function(event_id, mixer_id, action) {
	events.to(event_id).emit('mixer_update', {
		mixer_id: mixer_id,
		action: action // 'add' or 'remove'
	});
}
