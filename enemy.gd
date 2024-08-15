extends CharacterBody2D

const SPEED = 200.0

@onready var player := get_node("/root/Main/Character")

var health := 3


func _ready():
	$AnimatedSprite2D.play("default")


func _physics_process(_delta: float):
	var direction := global_position.direction_to(player.global_position)
	velocity = direction * SPEED
	move_and_slide()


func take_damage():
	$AnimatedSprite2D.modulate = Color(1, 0, 0)
	await get_tree().create_timer(0.1).timeout
	$AnimatedSprite2D.modulate = Color(1, 1, 1)

	health -= 1

	if health <= 0:
		queue_free()
		const EXPLOSION = preload("res://explosion.tscn")
		var explosion: AnimatedSprite2D = EXPLOSION.instantiate()
		explosion.global_position = global_position
		get_parent().add_child(explosion)
