extends KinematicBody2D

onready var animPlay = $AnimationPlayer
var friction = 1000
var accel = 10000
var run_speed = 300
var velocity = Vector2.ZERO
var player = null
var life = 3
var state = WAIT
enum {
	WAIT,
	CHASE,
}


func _process(delta):
	
	match state :
		WAIT:
			wait_state()
		CHASE:
			chase_state(delta)
	

	if life == 0:
		queue_free()


func chase_state(delta):
	
	velocity = Vector2.ZERO
	var dir = (player.global_position - global_position).normalized()
	velocity = velocity.move_toward(dir * run_speed, accel * delta)
	rotation = (player.global_position - global_position).angle()
	animPlay.play("walk")
	velocity = move_and_slide(velocity)

func wait_state():
	animPlay.play("New Anim")
	if player:
		state = CHASE
	else:
		state = WAIT

func Punch_go_brrr():
		var PunchEffect = load("res://Effects/Punch_Effect.tscn")
		var punchEffect = PunchEffect.instance()
		var world = get_tree().current_scene
		world.add_child(punchEffect)
		punchEffect.global_position = global_position

func _on_Area2D_area_entered(area):
	player = area
	print("asdfghj")


func _on_Area2D_area_exited(area):
	animPlay.play("New Anim")
	state = WAIT
	player = null
	

func _on_Hurtbox_area_entered(area):
	print(life)
	Punch_go_brrr()
	life -= 1
