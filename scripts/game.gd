extends Node2D

#status
#1 select a player
#2 select a card
#3 select a cell o card
var status = 1

var collision
var player

func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_cell_clicked(cell):
	if (cell.status == 1 && status == 3):
		player.position = cell.position
		collision.queue_free()
		status = 1

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
	if (status == 1):
		self.player = player
		status = 2
	
