var hexToRgb = {
	code: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9','a', 'b', 'c', 'd', 'e', 'f'],
	value: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],

	converter: function (color) {
		var rgb = [];
		var newArray = [];
		for ( var i = 1; i < color.length; i++ ) {
			for ( var j = 0; j < this.code.length; j++ ) {
				if ( color[i] === this.code[j] ) {
					newArray.push(this.value[j]);
				}
			}
		}
		var r = parseInt(newArray[0]) * 16 + parseInt(newArray[1]);
		var g = parseInt(newArray[2]) * 16 + parseInt(newArray[3]);
		var b = parseInt(newArray[4]) * 16 + parseInt(newArray[5]);
		rgb.push(r);
		rgb.push(g);
		rgb.push(b);
		return rgb;
	}
};

var randomColor = function () {
	var color = '#' + Math.random().toString(16).substring(2, 8);
	document.bgColor = color;
	// changes the value on the color pickert too
	$('#color').val(color);
	$('.palette').text("hex: " + color);
	$('.rgb_palette').text("rgb: " + hexToRgb.converter(color));
}

var addColor = function () {
	var $color = $( '#color' );
	var color = $color.val();
	document.bgColor = color;
	$('.palette').text("hex: " + color);
	$('.rgb_palette').text("rgb: " + hexToRgb.converter(color));
};

$( document ).ready( function () {
	// the addColor allows user to select a specific color from the color picker
	$( '#add_color' ).on( 'click', addColor ); 
	// random color generation on mouseover
	$( '.random_color' ).on('mousemove', randomColor);
});
 
