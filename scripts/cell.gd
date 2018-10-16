extends Area2D


export var status = 0

signal clicked

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_cell_area_entered(area):
	status = 1
	$img.modulate = Color(1.0,1.0,0.0,1.0)
	
	


func _on_cell_area_exited(area):
	status = 0
	$img.modulate = Color(1.0,1.0,1.0,1.0)


	


func _on_cell_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("clicked",self)
