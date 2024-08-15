extends Area2D

const BULLET = preload("res://bullet.tscn")


func _physics_process(_delta: float):
	var enemies_in_range := get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy: Node2D = enemies_in_range.front()
		look_at(target_enemy.global_position)
		%Sprite2d.show()
	else:
		%Sprite2d.hide()


func shoot():
	var bullet: Area2D = BULLET.instantiate()
	bullet.global_position = %ShootingPoint.global_position
	bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(bullet)


func _on_timer_timeout():
	shoot()
