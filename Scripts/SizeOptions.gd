extends OptionButton

var selected_size := Vector2(256, 256)

func _ready():
	# Generate result size options.
	for index in 9:
		var size_choice := pow(2, index + 4)
		add_item(str(size_choice))
		set_item_metadata(index, Vector2.ONE * size_choice)
	select(4)
	_on_item_selected(4)

func _on_item_selected(index):
	selected_size = get_item_metadata(index)
	print(selected_size)
