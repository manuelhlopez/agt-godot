extends Node2D


func _ready():
	save_game()


#cuando presiona el boton cambia de escena.
func _on_Button_pressed():
	get_tree().change_scene("res://scenes/game.tscn")

#grabar en archivo
func save_game():
	var save_dict = {
        "id" : 1,
        "life" : 80,
        "pos_x" : 60,
        "pos_y" : 10,
    }
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json(save_dict))
	save_game.close()

#cargar de archivo
func open_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.
	save_game.open("user://savegame.save", File.READ)
	while not save_game.eof_reached():
		#en esta variable queda el objecto del archivo
		var current_line = parse_json(save_game.get_line())
	
	save_game.close()