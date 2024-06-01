extends Area2D

@onready var timer = $Timer
signal Player_dead

func _on_body_entered(body):
	print("You died!")
	Engine.time_scale = 0.5
	emit_signal("Player_dead")
	timer.start()
	
	
func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
