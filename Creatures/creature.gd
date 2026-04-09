extends CharacterBody2D
class_name Creature2D
var direction: Direction

func creature_process() -> void:
	move_and_slide()
	
enum Direction {
	LEFT,
	RIGHT,
	STILL
}
