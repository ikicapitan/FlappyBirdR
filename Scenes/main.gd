extends Node

var puntos = 0


func _ready():
	pass

func agregar_punto():
	puntos+= 1 #Agrego un punto
	get_tree().get_nodes_in_group("txt_puntos")[0].text = String(puntos)
	if(puntos % 1 == 0): #Si alcanzo multiplo de 10 puntos (resto 0)
		get_tree().get_nodes_in_group("pajaro")[0].velocidad_desplazamiento += get_tree().get_nodes_in_group("pajaro")[0].velocidad_incrementar

func gameover():
	get_tree().get_nodes_in_group("winlose")[0].text = "FIN DEL JUEGO"
	yield(get_tree().create_timer(4.0),"timeout") #Espero 4 segundos
	get_tree().reload_current_scene() #Reinicia la escena actual