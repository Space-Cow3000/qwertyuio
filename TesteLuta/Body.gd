extends Sprite
 
onready var animationplayer = get_node("Playeranimation")
export var can_punch = true
export var punch_speed = 0.4

func _play_it():
	animationplayer.play("attk")


func _physics_process(delta):
	if Input.get_action_strength("punch") and can_punch:
		print("atacou")
		_play_it()
		can_punch=false
		yield(get_tree().create_timer(punch_speed), "timeout")
		can_punch = true
