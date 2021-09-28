extends KinematicBody2D

onready var camera = $Camera2D/AnimationPlayer
onready var icon = $icon
onready var animationlayer = $AnimationPlayer
var velocidade = Vector2.ZERO
var resultante = Vector2.ZERO
const rapidez = 200
const acceleration = 400
const friction = 1000
var vida = 6

func Punch_go_brrr():
		var PunchEffect = load("res://Effects/Punch_Effect.tscn")
		var punchEffect = PunchEffect.instance()
		var world = get_tree().current_scene
		world.add_child(punchEffect)
		punchEffect.global_position = global_position

func _ready():
	Global.Player = self

func _play_my_animation():
	animationlayer.play("transi") 
	
func _physics_process(delta):
	
	if vida == 0:
		die()
	
	var  mouse_pos : Vector2 = get_global_mouse_position()
	look_at(mouse_pos)
	  
	resultante.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	resultante.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	resultante = resultante.normalized()
	
	if resultante != Vector2(0,0):
		_play_my_animation()
		velocidade = velocidade.move_toward(resultante * rapidez, acceleration * delta)
	else:
		animationlayer.play("idl")
		velocidade = velocidade.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide(velocidade)
	
func die():
	queue_free()

func _on_Hurtbox_area_entered(area):
	Punch_go_brrr()
	vida -= 1
	camera.play("scrShake")
	print(vida)
