extends CharacterBody2D

@onready var ball: CharacterBody2D = $"../Ball"

func _physics_process(delta: float) -> void:
	var ball_direction = global_position.direction_to(ball.global_position)

	if ball_direction.y >= 0:
		velocity.y = 300
	else:
		velocity.y = -300

	move_and_slide()
