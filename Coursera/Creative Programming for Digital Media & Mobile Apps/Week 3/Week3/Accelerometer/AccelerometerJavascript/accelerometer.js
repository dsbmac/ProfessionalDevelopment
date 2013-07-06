
function Accelerometer(){
	
	accelerometer =  {
		acceleration : new Array(),
		getValues : function(){return this.acceleration;},
		getX      : function(){return this.acceleration[0];},
		getY      : function(){return this.acceleration[1];},
		getZ      : function(){return this.acceleration[2];}
	}
	
	accelerometer.acceleration[0] = 0.0;
	accelerometer.acceleration[1] = 0.0;
	accelerometer.acceleration[2] = 0.0;
	
	window.ondevicemotion = function(event) {
		accelerometer.acceleration[0] = event.acceleration.x;
		accelerometer.acceleration[1] = event.acceleration.y;
		accelerometer.acceleration[2] = event.acceleration.z;
	}
	
	return accelerometer;
}
