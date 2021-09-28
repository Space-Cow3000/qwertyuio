extends Node2D

onready var fx =$Effect
onready var part = $CPUParticles2D

func _ready():
	fx.frame = 0
	fx.play("Punch")
	


func _on_Effect_animation_finished():
	fx.queue_free()
	yield(get_tree().create_timer(0.25), "timeout")
	queue_free()
