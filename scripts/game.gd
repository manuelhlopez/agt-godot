extends Node2D

#status
#1 seleciona un player
#2 selecciona una carta
#3 selecciona una celda
var status = 1

#variables de tiempo y puntos
export var time = 20
export var points = 0

#variables temporales 
var collision #carta que pinta las celdas para moverse
var player #que player esta seleccionado
var card_select  #que carta esta seleccionada

#este metodo se dispara cuando se selecciona
#una celda
func _on_cell_clicked(cell):
	if (cell.status == 1 && status == 3):
		player.modulate = Color(1.0,1.0,1.0,1.0)
		player.move(cell.position)
		collision.queue_free()
		var pos = card_select.pos
		create_card(pos)
		card_select.queue_free()
		status = 1
		points += 2
		$HUD/lpoints.text = str(points)
		for c in $cards.get_children():
			c.modulate = Color(1.0,1.0,1.0,1.0)

#funcion que se llama cuando se selecciona una carta
func _on_card_selected_card(card):
	if (status == 2):
		var cardInstance = load("res://cards/card"+str(card.number)+".tscn")
		card.modulate = Color(1.0,0.0,0.0,1.0)
		card_select = card
		collision = cardInstance.instance()
		collision.scale = Vector2(0.8,0.8)
		collision.position = player.position
		self.add_child(collision)
		collision.hide_cells()
		status = 3

#funcion que se llama cuando se selecciona un
#player
func _on_player_player_selected(player):
	player.remove_life(10)
	if (status == 1 || status == 2):
		for p in $players.get_children():
			p.modulate = Color(1.0,1.0,1.0,1.0)
		self.player = player
		player.modulate = Color(1.0,0.0,0.0,1.0)
		#$Camera2D/Tween.interpolate_property($Camera2D,"position",$Camera2D.position,player.position,2,Tween.TRANS_QUART,Tween.EASE_OUT)
		#$Camera2D/Tween.start()
		status = 2

#se ejecuta cada vez que pasa un segundo del timer
func _on_Timer_timeout():
	time -= 1
	$HUD/ltime.text = str(time)
	if (time == 0):
		get_tree().change_scene("res://scenes/over.tscn")

#crea una nueva carta y la coloca en su lugar
func create_card(pos):
	var pos2d = get_node("cards/pos-card" + str(pos))
	var i = randi()%4+1 #random de 1 a 4
	var new_card = load("res://cards/card"+str(i)+".tscn")
	
	var c = new_card.instance()
	c.number = i
	c.pos = pos
	c.position = Vector2(-100,700)
	c.scale = Vector2(0.2,0.2)
	c.connect("selected_card",self,"_on_card_selected_card")
	
	var t = Tween.new()
	t.interpolate_property(c,"position",c.position,pos2d.position,2,Tween.TRANS_QUART,Tween.EASE_OUT)
	c.add_child(t)
	t.start()
	$cards.add_child(c)
	pass