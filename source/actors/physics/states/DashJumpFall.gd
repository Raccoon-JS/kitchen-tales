extends "res://actors/physics/State.gd"

func _on_command_started(command):
	match command:
		"Move":
			transition.is_moving = true
		"Stop":
			transition.is_moving = false


func _on_command_finished(command):
	match command:
		"Fall":
			state_machine.change_state_to("Idle")

