extends Node2D


func spawn_enemy():
	var enemy = preload("res://enemy.tscn").instantiate()
	%SpawnEnemiesPathFollow.progress_ratio = randf()
	enemy.global_position = %SpawnEnemiesPathFollow.global_position
	add_child(enemy)


func _on_spawn_enemy_timer_timeout():
	spawn_enemy()


func _on_character_death():
	%GameOverLayer.show()
	$Character.hide()
	get_tree().paused = true
