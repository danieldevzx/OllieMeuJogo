extends Node2D

var songs = 0
var songsPerSeconds = 0
@onready var songLabel = $Songs
@onready var songPerSLabel = $SongsPerSecond
@onready var soundBumbo = $bumbo/Kick2
@onready var soundSnare = $Caixa/Snare1
@onready var soundPrato = $prato/AudioStreamPlayer2D
@onready var soundHiHat = $hihat/AudioStreamPlayer2D
@onready var soundCaixa1 = $caixinha1/AudioStreamPlayer2D
@onready var soundClap = $clap/AudioStreamPlayer2D
@onready var timer = $Timer
@onready var textureButton = $Kick/TextureButton

@onready var shop:Sprite2D = $shop


@onready var anim_bumbo = $bumbo/AnimatedSprite2D
@onready var anim_snare = $Caixa/AnimatedSprite2D
@onready var anim_clap = $clap/AnimatedSprite2D
@onready var anim_hihat = $hihat/AnimatedSprite2D
@onready var anim_prato = $prato/AnimatedSprite2D
@onready var anim_caixa1 = $caixinha1/AnimatedSprite2D


@onready var button_hihat = $hihat/hihat_button
@onready var button_clap =$clap/clap_button
@onready var button_snare =$Caixa/snare_button
@onready var button_caixa1 =$caixinha1/caixa1_button
@onready var button_prato =$prato/prato_button


@onready var comprar_hihat = $shop/comprar_hihat
@onready var comprar_caixa1 = $shop/comprar_caixa
@onready var comprar_prato = $shop/comprar_prato
@onready var comprar_snare = $shop/comprar_snare
@onready var comprar_clap = $shop/comprar_clap

var is_pressed = false


func _ready() -> void:
	shop.visible =  false
	
	button_caixa1.visible = false
	button_clap.visible = false
	button_snare.visible = false
	button_prato.visible = false
	button_hihat.visible = false
	
	anim_hihat.visible = false
	anim_caixa1.visible = false
	anim_clap.visible = false
	anim_prato.visible = false
	anim_snare.visible = false
	
	comprar_caixa1.visible = false
	comprar_clap.visible = false
	comprar_hihat.visible = false
	comprar_prato.visible = false
	comprar_snare.visible = false
	update_labels()

func _process(delta: float) -> void:
	if songs >= 150:
		comprar_snare.visible = true
	if songs >= 300:
		comprar_hihat.visible = true
	if songs >= 250:
		comprar_prato.visible = true
	if songs >= 200:
		comprar_caixa1.visible = true
	if songs >= 200:
		comprar_clap.visible = true
	
func _on_upgrade_pressed() -> void:
	shop.visible = true
	
	

func update_labels() -> void:
	songLabel.text = "Songs: " + str(songs)

func toggle_texture_button_animation() -> void:
	is_pressed = !is_pressed
	if is_pressed:
		textureButton.pressed
	else:
		textureButton.pressed = is_pressed
		





func _on_bumbo_button_button_down() -> void:
	songs += 10
	update_labels()
	soundBumbo.play()
	anim_bumbo.play("ativado")


func _on_bumbo_button_button_up() -> void:
	anim_bumbo.play("default")


func _on_snare_button_button_down() -> void:
	songs += 10
	update_labels()
	soundSnare.play()
	anim_snare.play("ativado")
	
func _on_snare_button_button_up() -> void:
	anim_snare.play("default")
	pass # Replace with function body.


func _on_clap_button_button_down() -> void:
	songs += 10
	update_labels()
	soundClap.play()
	anim_clap.play("ativado")
	pass # Replace with function body.


func _on_clap_button_button_up() -> void:
	anim_clap.play("default")
	pass # Replace with function body.


func _on_hihat_button_button_down() -> void:
	songs += 10
	update_labels()
	soundHiHat.play()
	anim_hihat.play("ativado")
	pass # Replace with function body.


func _on_hihat_button_button_up() -> void:
	anim_hihat.play("default")
	pass # Replace with function body.


func _on_button_button_down() -> void:
	songs += 10
	update_labels()
	soundPrato.play()
	anim_prato.play("ativado")
	pass # Replace with function body.


func _on_button_button_up() -> void:
	anim_prato.play("default")
	pass # Replace with function body.


func _on_caixa_1_button_button_down() -> void:
	songs += 10
	update_labels()
	soundCaixa1.play()
	anim_caixa1.play("ativado")
	pass # Replace with function body.


func _on_caixa_1_button_button_up() -> void:
	anim_caixa1.play("default")
	pass # Replace with function body.


func _on_exit_button_pressed() -> void:
	shop.visible = false
	pass # Replace with function body.


func _on_comprar_caixa_pressed() -> void:
	songs = songs - 200
	anim_caixa1.visible = true
	button_caixa1.visible = true
	pass # Replace with function body.


func _on_comprar_prato_pressed() -> void:
	songs = songs - 250
	button_prato.visible = true
	anim_prato.visible = true


func _on_comprar_snare_pressed() -> void:
	songs = songs - 150
	anim_snare.visible = true
	button_snare.visible = true
	pass # Replace with function body.


func _on_comprar_clap_pressed() -> void:
	songs = songs - 200
	anim_clap.visible = true
	button_clap.visible = true
	pass # Replace with function body.


func _on_comprar_hihat_pressed() -> void:
	songs = songs - 300
	anim_hihat.visible = true
	button_hihat.visible = true
	pass # Replace with function body.
