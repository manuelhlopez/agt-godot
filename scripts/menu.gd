extends Node2D

#al presionar el boton cambia de escena.
func _on_Button_pressed():
	get_tree().change_scene("res://scenes/game.tscn")
