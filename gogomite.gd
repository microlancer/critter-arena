extends CharacterBody2D

var attack: int = 1
const TARGET_POS = Vector2(150, 190)
const SPEED = 120.0   # pixels / second

func _ready():
	var direction: Vector2 = (TARGET_POS - position).normalized()
	velocity = direction * SPEED

func _physics_process(_delta):
	# Direction from this enemy to the base

	# Set velocity directly
	#velocity = direction * SPEED

	if velocity != Vector2.ZERO:
		move_and_slide()

func x_physics_process(_delta):
	# Direction from this enemy to the base

	# Set velocity directly
	#velocity = direction * SPEED

	if velocity != Vector2.ZERO:
		move_and_slide()

	if false:
		# Check collisions this frame
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			var other = collision.get_collider()  # <-- Godot 4 style
			if other.name == "PlayerBase":
				print("Collision with base")
				velocity = Vector2.ZERO
				#direction = Vector2.ZERO
				break
