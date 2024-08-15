extends CharacterBody2D

signal death

const SPEED = 300.0
const DAMAGE_RATE = 1.0

var health := 100.0


func _physics_process(_delta: float):
	# Get the input direction and handle the movement.
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED

	# Update the animation.
	if direction.length() > 0.0:
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = direction.x < 0
	else:
		$AnimatedSprite2D.play("idle")

	var touching_enemies = %HurtBox.get_overlapping_bodies()
	if touching_enemies.size() > 0:
		health -= touching_enemies.size() * DAMAGE_RATE
		%HealthBar.value = health
		if health <= 0:
			death.emit() 

	move_and_slide()
