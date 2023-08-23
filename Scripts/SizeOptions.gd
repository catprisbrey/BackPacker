extends OptionButton

var selected_size := Vector2(256, 256)

func _ready():
	# Generate result size options.
	for index in 9:
		var size := pow(2, index + 4)
		add_item(str(size))
		set_item_metadata(index, Vector2.ONE * size)
	select(4)
	_on_item_selected(4)

func _on_item_selected(index):
	selected_size = get_item_metadata(index)
	print(selected_size)
