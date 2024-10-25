@tool
class_name Transform2DTxt

var x:Array[String] = ["", ""]
var y:Array[String] = ["", ""]
var o:Array[String] = ["", ""]


static func _shorten(value:float) -> String:
	var result = "%0.2f" % value	
	if result == "-0.00":
		result = "0.00"
	return result

static func _shorten_vec(vector2:Vector2) -> Array[String]:
	return [_shorten(vector2.x), _shorten(vector2.y)]

static func from_transform(transform2d:Transform2D) -> Transform2DTxt:
	var result := Transform2DTxt.new()
	result.x = _shorten_vec(transform2d.x)
	result.y = _shorten_vec(transform2d.y)
	result.o = _shorten_vec(transform2d.origin)
	return result
	
static func from_values(x:Array[String], y:Array[String], o:Array[String]):
	var result := Transform2DTxt.new()
	result.x = x
	result.y = y
	result.o = o
	return result
	 
