extends Area2D

const SPEED = 800.0
const RANGE = 500.0

var travelled_distance := 0.0


func _physics_process(delta: float):
	var direction := Vector2.RIGHT.rotated(rotation)
	var velocity := direction * SPEED
	position += velocity * delta
	travelled_distance += velocity.length() * delta

	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D):
	queue_free()

	if body.has_method("take_damage"):
		body.take_damage()
