extends GraphNode

@onready var parent = get_parent()
@onready var graph_node = $"."
@onready var button = $Button
@onready var texture_rect = $Button/TextureRect
@onready var file_dialog = $Button/FileDialog

var has_image = false
var port1 = []
var port2 = []
var port3 = []
var port4 = []

# Called when the node enters the scene tree for the first time.
func _ready():
	
	button.connect("pressed",Show_UploadWindow)
	file_dialog.connect("file_selected",load_image)
#
	var new_image = Image.create(256,256, false, Image.FORMAT_RGBA8)
	new_image.fill(Color(1,1,1,0))
	var image_texture = ImageTexture.create_from_image(new_image)
	texture_rect.texture = image_texture
	

func Show_UploadWindow():
	file_dialog.show()
	
func load_image(path):
	var new_image = load(path)
	
	if new_image:
		
		has_image = true
		texture_rect.texture = new_image
		set_title(str(path.get_file()))
		
	else:
		has_image = false
		print("Failed to load image:", path)
		print("Error code:", new_image)

func get_color(from_port):
	var original_image = texture_rect.texture.get_image()
	var new_image = Image.create(original_image.get_width(), original_image.get_height(), false, Image.FORMAT_RGBA8)
	
	for y in range(new_image.get_height()):
		for x in range(new_image.get_width()):
			var pixel = original_image.get_pixel(x, y)
			var color_value

			if from_port == 0:
				color_value = pixel.r
				pixel = Color(color_value, 0, 0, color_value)
			elif from_port == 1:
				color_value = pixel.g
				pixel = Color(0, color_value, 0, color_value)
			elif from_port == 2:
				color_value = pixel.b
				pixel = Color(0, 0, color_value, color_value)
			elif from_port == 3:
				color_value = pixel.a
				pixel = Color(0, 0, 0, color_value)
			new_image.set_pixel(x, y, pixel)
			
	var image_texture = ImageTexture.create_from_image(new_image)
	return image_texture

func _on_close_request():
	parent.counter -= 1
	disconnect_port(port1)
	disconnect_port(port2)
	disconnect_port(port3)
	disconnect_port(port4)
	queue_free()

func connection_info(from_node, from_port, to_node, to_port):
	match to_port:
		0:
			port1 = [from_node, from_port, to_node, to_port]
		1:
			port2 = [from_node, from_port, to_node, to_port]
		2:
			port3 = [from_node, from_port, to_node, to_port]
		3:
			port4 = [from_node, from_port, to_node, to_port]

func disconnect_port(port_number):
	if port_number != []:
		parent._on_disconnection_request(port_number[0],port_number[1],port_number[2],port_number[3])

