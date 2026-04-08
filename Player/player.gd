extends CharacterBody2D
static var horizontal_movement = 1500
static var jump_strength = 30000
static var top_speed = 225
var state:State = State.COLLECTED
enum State {
	COLLECTED,
	PRIMAL
}
@onready var floor_grabber = $FloorGrabber
func _physics_process(delta: float) -> void:
	
	var collider = floor_grabber.get_collider()
	
	var friction = collider.friction if collider != null else 1
	if Input.is_action_pressed("Left") and velocity.x > -top_speed:
		add_velocity_x(-horizontal_movement, delta)
		print("Going Left")
	if Input.is_action_pressed("Right") and velocity.x < top_speed:
		add_velocity_x(horizontal_movement, delta)
		print("Going Right")
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		add_velocity_y(-jump_strength, delta)
		print("Jumping")
	if Input.is_action_just_pressed("Down"):
		self.scale.y /= 2
	if Input.is_action_just_released("Down"):
		self.scale.y *= 2
	if Input.is_action_just_pressed("Primary ability"):
		print("Primary Ability")
	if Input.is_action_just_pressed("Secondary Ability"):
		print("Secondary Ability")
	if Input.is_action_just_pressed("Movement ability"):
		print("Movement Ability")
	if Input.is_action_just_pressed("Special Ability"):
		print("Special Ability")
	
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
