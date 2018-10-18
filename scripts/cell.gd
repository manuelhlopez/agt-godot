extends Area2D

#señal que se envia cuando se le da click a
#celda, con el fin de elegir un punto hacia
#donde moverse.
signal clicked

#estatus de la celda
#0 = sin seleccionar
#1 = celda seleccionada
var status = 0

#cuando otra area2d ingresa 
func _on_cell_area_entered(area):
	status = 1
	$img.modulate = Color(1.0,1.0,0.0,1.0)

#cuando otra area2d sale
func _on_cell_area_exited(area):
	status = 0
	$img.modulate = Color(1.0,1.0,1.0,1.0)

#cuando se le da click a la celda
func _on_cell_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("clicked",self)
