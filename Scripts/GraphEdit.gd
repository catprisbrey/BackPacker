extends GraphEdit

@onready var output_node = $OutputNode

var new_source_node = load("res://InputNode.tscn")
var initial_position = Vector2(15,40)
var counter = 1

func _ready():
	_on_button_pressed()

func _on_connection_request(from_node, from_port, to_node, to_port):
	var source_node = get_node(str(from_node))
	var destination_node = get_node(str(to_node))
	if "has_image" in source_node:
		destination_node.disconnect_port(to_port)
		connect_node(from_node,from_port,to_node,to_port)
		destination_node.connection_info(from_node, from_port, to_node, to_port)
		var image = source_node.get_color(from_port)
		destination_node.set_color(to_port, image)
		destination_node.connection_info(from_node, from_port, to_node, to_port)
		source_node.connection_info(from_node, from_port, to_node, to_port)
		destination_node.has_connection = true

func _on_button_pressed():
	counter += 1
	if counter > 10:
		counter = 1  # Reset counter to 1 if it's greater than 10
	var new_offset = initial_position * counter
	var new_node = new_source_node.instantiate()
	new_node.position_offset += new_offset
	add_child(new_node)


func _on_disconnection_request(from_node, from_port, to_node, to_port):
	disconnect_node(from_node,from_port,to_node,to_port)
	var destination_node = get_node(str(to_node))
	destination_node.clear_image(to_port)
	

func _on_clear_all_pressed():
	clear_connections()
	output_node.clear_image(0)
	output_node.clear_image(1)
	output_node.clear_image(2)
	output_node.clear_image(3)
