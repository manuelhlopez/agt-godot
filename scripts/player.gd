extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal player_selected
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func move(position):
	if position.x > self.position.x:
		$AnimatedSprite.animation = "right"
	if position.x < self.position.x:
		$AnimatedSprite.animation = "left"
	if position.y > self.position.y:
		$AnimatedSprite.animation = "down"
	if position.y < self.position.y:
		$AnimatedSprite.animation = "up"
	$Tween.interpolate_property(self,"position",self.position,position,2,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()

func _on_player_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$effects.emitting = true
		emit_signal("player_selected",self)


func _on_Tween_tween_completed(object, key):
	$AnimatedSprite.animation = "idle"
	$effects.emitting = true
