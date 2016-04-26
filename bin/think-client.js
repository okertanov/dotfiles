#!/usr/bin/env node

//
// Requires
//
var async = require('async');
var r = require('rethinkdb');
var config = require(__dirname + '/think-config.js');

//
// Config file format:
//
//module.exports = {
//    rethinkdb: {
//        host: "",
//        port: 28015,
//        authKey: "",
//        db: "",
//        table: "facts",
//        timeout: 5
//    }
//}
//

//
// Payload format:
//
// [{ type: 'event', name: 'event1', severity: 0,
//   timestamp: r.now(), message: 'Hello, iOS.',
//   color: '#FFFFFF' }]
//
// or
//
// [{ "timestamp": "r.now()", "message": "Hello, iOS", "color": "#FFFFFF" }]
//

//
// CreateConnection
//
function CreateConnection(callback) {
    console.log('Connecting to', config.rethinkdb.host);
    r.connect(config.rethinkdb)
    .then(function(connection) {
        rdbConn = connection;
        if (callback) {
            callback(connection);
        }
    })
    .error(function(err) {
        console.error('Error:', err.message || err);
    });
}

//
// SendPayload
//
function SendPayload(connection, payload, callback) {
    console.log('Executing Insert query, payload:', payload);
    var jsonPayload = JSON.parse(payload);
    r.db(config.rethinkdb.db).table(config.rethinkdb.table)
        .insert(jsonPayload).run(connection, function(err, cursor) {
            if (err) {
                throw err;
            }

            console.log('Executed Insert query, result:', cursor);

            if (callback) {
                callback(connection);
            }
        });
}

//
// CloseConnection
//
function CloseConnection(connection) {
    if (connection) {
        console.log('Disconnecting from', config.rethinkdb.host);
    }
    connection.close();
}

//
// Main
//
function Main() {
    var args = process.argv.slice(2);
    var payload = args.join(' ');
    console.log('Started with args:', args)
    CreateConnection(function(connection) {
        SendPayload(connection, payload, function(connection) {
            CloseConnection(connection);
        });
    });
}

Main();
