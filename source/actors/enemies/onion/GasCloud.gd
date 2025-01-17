extends Area2D


func _ready():
	set_physics_process(false)


func _physics_process(delta):
#	slow_down()
	pass


func slow_down():
	translate(Vector2.ZERO)
	for body in get_overlapping_bodies():
		if not body.is_in_group("player"):
			continue
		if not body.has_method("set_velocity"):
			continue
		body.velocity.x *= 0.5


func _on_area_entered(area):
	$Attack.execute()
	set_physics_process(true)


func _on_area_exited(area):
	set_physics_process(false)
