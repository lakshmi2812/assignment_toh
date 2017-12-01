//Installation steps:
//Socket.io ---> npm install express socket.io socket.io-client --save
let express = require('express');
let app = express();
const server = require('http').createServer(app);
const io = require('socket.io')(server);
const bodyParser = require('body-parser');
const handlebars = require('express-handlebars');
//use middleware to include sockets client library
app.use(
	'/socket.io',
	express.static(__dirname + 'node_modules/socket.io-client/dist/')
);

const hbs = handlebars.create({
	defaultLayout: 'main'
});
app.use(bodyParser.urlencoded({ extended: true }));
app.engine('handlebars', hbs.engine);
app.set('view engine', 'handlebars');

app.get('/', (req, res) => {
	res.render('index');
});

let newStr = 'I am trying out sockets!';

// io.on('connection', client => {
// 	console.log('New connection!');
// 	io.sockets.emit('new str', newStr); //this event 'new str' is emitted to all clients connected to socket whenever a new connection is made.
// 	//newStr is now available at the client side when 'new str' event occurs
// });

io.on('connection', client => {
	console.log('New connection!');
	client.on('myClick', () => {
		//when myClick event occurs, emit newStr to all clients
		io.sockets.emit('new str', newStr);
	});
});
server.listen(3000);
