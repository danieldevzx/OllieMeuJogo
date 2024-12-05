extends Node2D

var songs = 0
var songsPerSeconds = 0
@onready var songLabel = $Songs
@onready var songPerSLabel = $SongsPerSecond
@onready var soundKick = $Kick/AudioStreamPlayer2D
@onready var soundSnare = $Caixa/Snare1
@onready var timer = $Timer
@onready var textureButton = $Kick/TextureButton

var is_pressed = false


func _ready() -> void:
	update_labels()


func _on_upgrade_pressed() -> void:
	if songs >= 100:
		songs -= 100
		timer.start()
		update_labels()

func update_labels() -> void:
	songLabel.text = "Songs: " + str(songs)

func toggle_texture_button_animation() -> void:
	is_pressed = !is_pressed
	if is_pressed:
		textureButton.pressed
	else:
		textureButton.pressed = is_pressed


func _on_kick_pressed() -> void:
		songs += 10
		update_labels()
		soundKick.play()


func _on_snare_pressed() -> void:
		songs += 10
		update_labels()
		soundSnare.play()
