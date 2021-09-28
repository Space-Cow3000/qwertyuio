extends Sprite
 
onready var animationplayer = get_node("Playera")
export var can_punc = true
export var punc_speed = 0.8
var naarea = null

func _play_it():
	animationplayer.play("attack")


func _physics_process(delta):
	if naarea and can_punc:
		print("atacou")
		_play_it()
		can_punc=false
		yield(get_tree().create_timer(punc_speed), "timeout")
		can_punc = true


func _on_Area2D_area_entered(area):
	naarea = area


func _on_Area2D_area_exited(area):
	naarea = null
