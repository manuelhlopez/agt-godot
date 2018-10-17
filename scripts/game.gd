extends Node2D

#status
#1 select a player
#2 select a card
#3 select a cell o card
var status = 1

export var time = 200
var points = 0

var collision
var player

func _ready():
	pass # Replace with function body.


func _on_cell_clicked(cell):
	if (cell.status == 1 && status == 3):
		player.modulate = Color(1.0,1.0,1.0,1.0)
		player.move(cell.position)
		collision.queue_free()
		status = 1
		
		points += 2
		$HUD/lpoints.text = str(points)

func _on_card_selected_card(card):
	if (status == 2):
		var cardInstance = load("res://cards/card"+str(card.number)+".tscn")
		collision = cardInstance.instance()
		collision.scale = Vector2(0.8,0.8)
		collision.position = player.position
		self.add_child(collision)
		collision.hide_cells()
		status = 3


func _on_player_player_selected(player):
	if (status == 1 || status == 2):
		for p in $players.get_children():
			p.modulate = Color(1.0,1.0,1.0,1.0)
		self.player = player
		player.modulate = Color(1.0,0.0,0.0,1.0)
		$Camera2D/Tween.interpolate_property($Camera2D,"position",$Camera2D.position,player.position,2,Tween.TRANS_QUART,Tween.EASE_OUT)
		$Camera2D/Tween.start()
		status = 2


func _on_Timer_timeout():
	time -= 1
	$HUD/ltime.text = str(time)
