extends PlayerState

const SPEED = 100.0
var input_vector := Vector2.ZERO

# Inherits player, animation_tree, and playback variables
func Enter():
	pass

func Exit():
	pass

func PhysicsUpdate(_delta: float) -> void:
	var state = playback.get_current_node()
	match state:
		"MoveState":
			input_vector = Input.get_vector("left", "right", "up", "down")
			
			if input_vector != Vector2.ZERO:
				var direction_vector = Vector2(input_vector.x, -input_vector.y)
				update_blend_positions(direction_vector)

			if Input.is_action_just_pressed("attack"):
				playback.travel("AttackState")

			player.velocity = input_vector * SPEED
			player.move_and_slide()
		"AttackState":
			pass


func update_blend_positions(direction_vector: Vector2) -> void:
	animation_tree.set("parameters/StateMachine/MoveState/Walk/blend_position", direction_vector)
	animation_tree.set("parameters/StateMachine/MoveState/Idle/blend_position", direction_vector)
	animation_tree.set("parameters/StateMachine/AttackState/blend_position", direction_vector)
