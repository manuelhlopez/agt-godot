extends KinematicBody2D

#señal lanzada cuando se selecciona
#el player.
signal player_selected

#vida del personaje
export var life = 100

#funcion que elige la animacion a ejecutarse
#y ejecuta el tween para mover al personaje
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

#identifica cuando se le da click al personaje
#y dispara las particulas.
func _on_player_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton && event.pressed):
		$effects.emitting = true
		emit_signal("player_selected",self)

#cuando termina el Tween la animacion
#regresa a idle y vuelve a disparar las 
#particulas
func _on_Tween_tween_completed(object, key):
	$AnimatedSprite.animation = "idle"
	$effects.emitting = true

#metodo para quitar vida.
func remove_life(number):
	life -= number
	$progress.value = life
	pass