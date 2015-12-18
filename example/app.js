var Rooted = require('com.collinprice.rooted');
if (Rooted.isRooted()) {
	Ti.API.info("DEVICE IS ROOTED!!!");
} else {
	Ti.API.info("DEVICE IS NOT ROOTED.....");
}