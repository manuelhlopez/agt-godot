extends Area2D

#señal que se emite cuando se hace click
signal selected_card

#que tipo de carta es.
export var number = 0
#en que posicion se encuentra.
export var pos = 0

#Esta funcion sirve para utilizar el collision
#de la carta en el tablero para encender las 
#celdas elegidas.
func hide_cells():
	$cells.visible = false
	$bg.visible = false
	$square.queue_free()

#Metodo que se activa cuando se le da click
#a la carta
func _on_card_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		emit_signal("selected_card",self)
