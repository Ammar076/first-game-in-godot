extends Node2D

const SPEED = 100

var direction = 1
signal Player_died
@onready var ray_cast_right = $RayCast2D
@onready var ray_cast_left = $RayCast2D2
@onready var ray_cast_rightup = $RayCast2D3
@onready var ray_cast_leftup = $RayCast2D4
@onready var ray_cast_stopleft = $RayCastWall
@onready var ray_cast_stopright = $RayCastWall2
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		animated_sprite.play("Lockin")
		direction = 1
		animated_sprite.flip_h = true
		position.x += SPEED * delta
	if ray_cast_left.is_colliding():
		animated_sprite.play("Lockin")
		direction = -1
		animated_sprite.flip_h = false
		position.x -= SPEED * delta
	if ray_cast_rightup.is_colliding():
		animated_sprite.play("Lockin")
		direction = 1
		animated_sprite.flip_h = true
		position.x += SPEED * delta
	if ray_cast_leftup.is_colliding():
		animated_sprite.play("Lockin")
		direction = -1
		animated_sprite.flip_h = false
		position.x -= SPEED * delta
	if ray_cast_stopleft.is_colliding():
		animated_sprite.play("Losetarget")
		position.x += SPEED * delta
	if ray_cast_stopright.is_colliding():
		animated_sprite.play("Losetarget")
		position.x -= SPEED * delta


func _on_killzone_player_dead():
	emit_signal("Player_died")
