extends Node2D

@onready var logo = $Logo
@onready var nomeJogo = $RhythnClicker
@onready var music = $Music

var moving_down = true
var max_y = 300.0  # Posição Y na metade da tela
var min_y = 250.0  # Posição Y mais acima da metade da tela
var speed = 4.0  # Velocidade de animação (quanto menor, mais suave)

func _ready() -> void:
	# Inicializa as posições iniciais
	logo.position.y = -200.0  # Fora da tela para o logo
	nomeJogo.position.y = -200.0
	music.connect("finished", Callable(self, "_on_Music_finished"))
	music.play()

func _process(delta: float) -> void:
	if logo.position.y < max_y:
		logo.position.y += speed
	if nomeJogo.position.y < max_y + 120.0:
		nomeJogo.position.y += speed
	else:
		if moving_down:
			logo.position.y = lerp(logo.position.y, max_y, delta * speed * 0.1)
			nomeJogo.position.y = lerp(nomeJogo.position.y, max_y + 120.0, delta * speed * 0.1)
			if logo.position.y >= max_y - 1.0:
				moving_down = false
		else:
			logo.position.y = lerp(logo.position.y, min_y, delta * speed * 0.1)
			nomeJogo.position.y = lerp(nomeJogo.position.y, min_y + 120.0, delta * speed * 0.1)
			if logo.position.y <= min_y + 1.0:
				moving_down = true

func _on_Music_finished() -> void:
	music.play()
