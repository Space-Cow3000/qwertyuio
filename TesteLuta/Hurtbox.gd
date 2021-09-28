extends Area2D

func Punch_go_brrr():
		var PunchEffect = load("res://Effects/Punch_Effect.tscn")
		var punchEffect = PunchEffect.instance()
		var world = get_tree().current_scene
		world.add_child(punchEffect)
		punchEffect.global_position = global_position

func _on_Hurtbox_area_entered(area):
	Punch_go_brrr()
