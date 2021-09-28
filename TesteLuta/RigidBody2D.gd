extends RigidBody2D

onready var animationplayer = $AnimationPlayer
onready var player = preload("res://Player.tscn")

func _on_Hurtbox_area_entered(area):
	animationplayer.play("hurt")
	print("colidiu")
