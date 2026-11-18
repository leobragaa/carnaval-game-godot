extends CanvasLayer

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

	# Fundo da tela
	var fundo = ColorRect.new()
	fundo.color = Color(0, 0, 0, 0.8)
	fundo.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(fundo)

	# Centralizador
	var centro = CenterContainer.new()
	centro.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	fundo.add_child(centro)

	# Painel
	var painel = VBoxContainer.new()
	painel.add_theme_constant_override("separation", 20)
	centro.add_child(painel)

	# Texto
	var mensagem = Label.new()
	mensagem.text = "VOCE MORREU!"
	mensagem.add_theme_font_size_override("font_size", 40)
	mensagem.add_theme_color_override("font_color", Color.WHITE)
	mensagem.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	painel.add_child(mensagem)

	# Botão
	var botao = Button.new()
	botao.text = "REINICIAR"
	botao.custom_minimum_size = Vector2(200, 60)
	botao.add_theme_font_size_override("font_size", 24)
	painel.add_child(botao)

	botao.pressed.connect(reiniciar_jogo)
	hide()

func mostrar() -> void:
	get_tree().paused = true
	show()

func reiniciar_jogo() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
