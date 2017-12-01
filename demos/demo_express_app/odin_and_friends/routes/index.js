// var express = require('express');
// var router = express.Router();
//
// var gods = require('../models/gods').gods
//
// // Notice how we're calling get on the router
// // This register the root route (/) and associates a callback as a functionality
// // which will be triggered for any incoming request matching this URL
// router.get('/', function(req, res, next) {
//   res.render('index', { gods: gods })
// })
//
// /* GET home page. */
// router.get('/', function(req, res, next) {
//   res.render('index', { title: 'Express' });
// });
//
// module.exports = router;
////
var express = require('express');
var router = express.Router();
const {God, gods} = require('../models/gods')

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { gods: gods });
});

module.exports = router;
