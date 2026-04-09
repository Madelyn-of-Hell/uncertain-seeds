extends CharacterBody2D
static var horizontal_movement = 1500
static var jump_strength = 30000
static var top_speed = 225

var state:State = State.COLLECTED
enum State {
	COLLECTED,
	PRIMAL
}
@onready var floor_grabber = $"FloorGrabber"
func _physics_process(delta: float) -> void:
	
	var collider = floor_grabber.get_collider()
	print(collider)
	var friction = collider.friction if collider != null else 1
	
	# Handle Input
	if Input.is_action_pressed("Left") and velocity.x > -top_speed:
		add_velocity_x(-horizontal_movement, delta)
	if Input.is_action_pressed("Right") and velocity.x < top_speed:
		add_velocity_x(horizontal_movement, delta)
	if Input.is_action_just_pressed("Up"):
		print("Up")
	if Input.is_action_just_pressed("Down"):
		self.scale.y /= 2
	if Input.is_action_just_released("Down"):
		self.scale.y *= 2
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		add_velocity_y(-jump_strength, delta)
	if Input.is_action_just_pressed("Primary ability"): 
		print("Primary")
	if Input.is_action_just_pressed("Secondary Ability"):
		print("Secondary")
	if Input.is_action_just_pressed("Movement ability"):
		print("Movement")
	if Input.is_action_just_pressed("Special Ability"):
		print("Special")
	if Input.is_action_just_pressed("Melee"):
		print("Melee")
	if Input.is_action_just_pressed("Change Fuel Cell"):
		print("Change Fuel Cell")
	if Input.is_action_just_pressed("Change States"):
		match state:
			State.COLLECTED:
				print("Switch to Primal")
				state = State.PRIMAL
				$Animator.play("To Primal")
			State.PRIMAL:
				print("Switch to Collected")
				state = State.COLLECTED
				$Animator.play("To Collected")

	if Input.is_action_just_pressed("Attack"):
		print("Attack")
	if Input.is_action_just_pressed("Alt Attack"):
		print("Alt Attack")
	if Input.is_action_just_pressed("Pause"):
		print("Pause")
	if Input.is_action_just_pressed("Hud"):
		print("HUD")
	# Perpetual Movements
	add_velocity_y(G.gravity)
	velocity.x *= friction
	
	move_and_slide()

## A helper function for adding velocity with delta more conveniently.
func add_velocity(Vector:Vector2,delta = 1):
	velocity += Vector * Vector2(delta,delta)

func add_velocity_x(x = 0, delta = 1):
	velocity.x += x * delta
func add_velocity_y(y = 0, delta = 1):
	velocity.y += y * delta
