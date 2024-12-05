extends CharacterBody2D


func _ready() -> void:
	velocity.y = 100

func _process(delta: float) -> void:
	move_and_slide()
