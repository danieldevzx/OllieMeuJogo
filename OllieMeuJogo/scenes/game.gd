extends Node2D

var songs = 0
var songsPerSeconds = 0
@onready var songLabel = $Songs
@onready var soundKick = $bumbo/bumbo2
@onready var bumboSprite = $bumbo/bumbo
var originalSprite : Texture  

func _ready() -> void:
	originalSprite = bumboSprite.texture
	update_labels()

func _on_upgrade_pressed() -> void:
	if songs >= 100:
		songs -= 100
		update_labels()

func update_labels() -> void:
	songLabel.text = "Songs: " + str(songs)

func _on_bumbo_pressed() -> void:
	# Mudar o sprite do bumbo
	bumboSprite.texture = preload("res://assets/bumbo_ativado.png")  # Substitua pelo caminho do novo sprite
	songs += 10
	update_labels()
	soundKick.play()

	# Espera 0.2 segundos utilizando a sintaxe await
	var timer = Timer.new()  # Cria um novo Timer
	add_child(timer)  # Adiciona o Timer como filho
	timer.wait_time = 0.2  # Define o tempo de espera
	timer.start()  # Inicia o Timer

	await timer.timeout  # Aguarda o evento timeout do Timer

	# Retorna ao sprite original
	bumboSprite.texture = originalSprite
	timer.queue_free()  # Libera o Timer após o uso
