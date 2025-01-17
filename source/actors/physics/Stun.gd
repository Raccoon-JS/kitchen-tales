extends "res://actors/physics/State.gd"


func _enter():
	actor.velocity = Vector2.ZERO
	actor.get_node("Controls").disable()


func _exit():
	set_process(false)
	actor.get_node("Controls").enable()
