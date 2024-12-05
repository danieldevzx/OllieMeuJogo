extends Node2D

@onready var timer:Timer = %Timer

func _ready() -> void:
	timer.start()
	
	


func _on_timer_timeout() -> void:
	print("trocou")
	pass # Replace with function body.
