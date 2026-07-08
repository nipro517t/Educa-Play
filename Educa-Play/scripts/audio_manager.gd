extends Node

@onready var musica_fundo = $MusicaFundo
@onready var sfx = $SFX
@onready var voz = $Voz


func tocar_musica(stream: AudioStream):
	if musica_fundo.stream == stream and musica_fundo.playing:
		return
	musica_fundo.stream = stream
	musica_fundo.play()


func tocar_sfx(stream: AudioStream):
	sfx.stream = stream
	sfx.play()


func falar(stream: AudioStream):
	voz.stop()
	voz.stream = stream
	voz.play()
	
