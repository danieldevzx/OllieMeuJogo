extends Node2D

var songs = 0
var songsPerSeconds = 0
@onready var songLabel = $Songs
@onready var songPerSLabel = $SongsPerSecond
@onready var som = $Kick/AudioStreamPlayer2D
@onready var timer = $Timer
@onready var textureButton = $Kick/TextureButton

var is_pressed = false  # Estado atual do botão

func _ready() -> void:
	update_labels()

func _on_timer_timeout() -> void:
	songs += songsPerSeconds
	update_labels()
	som.play()
	toggle_texture_button_animation()

func _on_texture_button_pressed() -> void:
	songs += 10
	update_labels()
	som.play()

func _on_upgrade_pressed() -> void:
	if songs >= 100:
		songs -= 100
		songsPerSeconds += 10
		timer.start()
		update_labels()

func update_labels() -> void:
	songLabel.text = "Songs: " + str(songs)
	songPerSLabel.text = "Songs/s: " + str(songsPerSeconds)

func toggle_texture_button_animation() -> void:
	is_pressed = !is_pressed
	#textureButton.pressed = is_pressed
