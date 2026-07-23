extends Control
@onready var texto_link: RichTextLabel = $Button
@onready var button_2: RichTextLabel = $Button2



func _ready():
	texto_link.bbcode_enabled = true
	texto_link.text = "[url=https://www.instagram.com/vnvnpa/]meu instagram clicando aqui!!![/url]!"
	texto_link.meta_clicked.connect(_ao_clicar_link)
	button_2.bbcode_enabled = true
	button_2.text = "[url=https://www.instagram.com/vnvnpa/]HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH[/url]!"
	button_2.meta_clicked.connect(_ao_clicar_link)

func _ao_clicar_link(meta):
	OS.shell_open(str(meta))
