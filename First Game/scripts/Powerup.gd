extends Node2D

signal invincibility

@onready var animation_player = $powerupanimation

func _on_body_entered(body):
	emit_signal("invincibility")
	animation_player.play("Powerup_pick")
