extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal selected_card
export var number = 0
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func hide_cells():
	$cells.visible = false
	$bg.visible = false

func _on_card_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("selected_card",self)
