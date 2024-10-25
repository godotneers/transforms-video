@tool
class_name Transform3DTxt

var x:Array[String] = ["", "", ""]
var y:Array[String] = ["", "", ""]
var z:Array[String] = ["", "", ""]
var o:Array[String] = ["", "", ""]


static func _shorten(value:float) -> String:
	var result = "%0.2f" % value	
	if result == "-0.00":
		result = "0.00"
	return result

static func _shorten_vec(vector3:Vector3) -> Array[String]:
	return [_shorten(vector3.x), _shorten(vector3.y), _shorten(vector3.z)]

static func from_transform(transform3d:Transform3D) -> Transform3DTxt:
	return from_values(
		_shorten_vec(transform3d.basis.x),
		_shorten_vec(transform3d.basis.y),
		_shorten_vec(transform3d.basis.z),
		_shorten_vec(transform3d.origin)
	)
	
static func from_values(x:Array[String], y:Array[String], z:Array[String], o:Array[String]):
	var result := Transform3DTxt.new()
	result.x = x
	result.y = y
	result.z = z
	result.o = o
	return result
	 
