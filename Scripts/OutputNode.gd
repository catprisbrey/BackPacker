extends GraphNode

@onready var parent = get_parent()
@onready var texture_r = $Control1/TextureRect
@onready var texture_g = $Control2/TextureRect
@onready var texture_b = $Control3/TextureRect
@onready var texture_a = $Control4/TextureRect

@onready var preview_button = $"../../GraphNode/PreviewButton"
@onready var file_dialog = $"../../GraphNode/SaveButton/FileDialog"
@onready var save_button = $"../../GraphNode/SaveButton"
@onready var test_image = $"../../GraphNode/TestImage"
@onready var size_options = $"../../GraphNode/HBoxContainer/SizeOptions"
var scale_size

var has_connection = false

var port1 = []
var port2 = []
var port3 = []
var port4 = []

var save_path
var red_ready = false
var green_ready = false
var blue_ready = false
var alpha_ready = false

var red
var green
var blue
var alpha

func _process(_delta):
	if (red_ready == true \
		&& green_ready == true \
		&& blue_ready == true \
		&& alpha_ready == true ):
		save_button.show()
		preview_button.show()
	else:
		save_button.hide()
		preview_button.hide()
		test_image.texture = null

func _ready():
	scale_size = size_options.selected_size
	
func set_color(port_number,image):
	if port_number == 0:
		red = image
		red_ready = true
		texture_r.texture = image
	elif port_number == 1:
		green = image
		green_ready = true
		texture_g.texture = image
	elif port_number == 2:
		blue = image
		blue_ready = true
		texture_b.texture = image
	elif port_number == 3:
		alpha = image
		alpha_ready = true
		texture_a.texture = image

func clear_image(port_number):
	if port_number == 0:
		red_ready = false
		texture_r.texture = null
	elif port_number == 1:
		green_ready = false
		texture_g.texture = null
	elif port_number == 2:
		blue_ready = false
		texture_b.texture = null
	elif port_number == 3:
		alpha_ready = false
		texture_a.texture = null
	
func create_combined_image(red_image: Image, green_image: Image, blue_image: Image, alpha_image: Image):
	var new_image = Image.create(red_image.get_width(), red_image.get_height(), false, Image.FORMAT_RGBA8)
	new_image.fill(Color.WHITE)
	for y in range(new_image.get_height()):
		for x in range(new_image.get_width()):
			var value_r = red_image.get_pixel(x, y).r
			var value_g = green_image.get_pixel(x, y).g
			var value_b = blue_image.get_pixel(x, y).b
			var value_a = alpha_image.get_pixel(x, y).a

			var pixel = Color(value_r,value_g,value_b,value_a)

			new_image.set_pixel(x, y, pixel)

	new_image.resize(scale_size.x,scale_size.y, 1)
	var image_texture = ImageTexture.create_from_image(new_image)
	return image_texture



func _on_preview_button_pressed():
	var final_image = create_combined_image(
		red.get_image(),
		green.get_image(),
		blue.get_image(),
		alpha.get_image()
		)
	test_image.texture = final_image


func _on_save_button_pressed():
	file_dialog.show()


func _on_file_dialog_confirmed():
	save_path = file_dialog.current_path
	print(str(save_path))
	
	if test_image.texture:
		test_image.texture.get_image().save_png(save_path)
	else:
		var final_image = create_combined_image(
			red.get_image(),
			green.get_image(),
			blue.get_image(),
			alpha.get_image()
			)
		final_image.get_image().save_png(save_path)
		

func _on_size_options_item_selected(index):
	scale_size = size_options.get_item_metadata(index)
	
func disconnect_port(to_port):
	match to_port:
		0:
			if port1 != []:
				parent._on_disconnection_request(port1[0],port1[1],port1[2],port1[3])
				port1 = []
		1:
			if port2 != []:
				parent._on_disconnection_request(port2[0],port2[1],port2[2],port2[3])
				port2 = []
		2:
			if port3 != []:
				parent._on_disconnection_request(port3[0],port3[1],port3[2],port3[3])
				port3 = []
		3:
			if port4 != []:
				parent._on_disconnection_request(port4[0],port4[1],port4[2],port4[3])
				port4 = []

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
