extends Position2D



func _ready():
	pass


func _on_VisibilityNotifier2D_screen_exited(): #Al salir tubo de pantalla, reposicionaremos al final
	get_tree().get_nodes_in_group("spawnstube")[0].reposicionar() #Llamo al padre de los spawns para que haga el reordenamiento


func _on_Area2D_body_entered( body ): #Cuando entre el jugador le doy 1 punto
	if(body.is_in_group("pajaro")):
		get_tree().get_nodes_in_group("sfx")[0].get_node("01").play()
		get_tree().get_nodes_in_group("main")[0].agregar_punto() #Le aviso al main que quiero agregar un punto
