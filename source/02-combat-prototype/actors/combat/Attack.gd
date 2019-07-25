extends Command

signal cooled
onready var duration_timer = $Duration
onready var cooldown_timer = $Cooldown

export (float) var duration = 0.1
export (float) var cooldown = 0.1

func execute():
	if not enabled:
		return
	if not cooldown_timer.is_stopped():
		return
	duration_timer.start(duration)
	emit_signal("started")


func cancel():
	if not enabled:
		return
	if duration_timer.is_stopped():
		return
	duration_timer.stop()
	start_cooldown()


func _on_Duration_timeout():
	if not enabled:
		return
	start_cooldown()


func start_cooldown():
	emit_signal("finished")
	cooldown_timer.start(cooldown)


func _on_Cooldown_timeout():
	emit_signal("cooled")