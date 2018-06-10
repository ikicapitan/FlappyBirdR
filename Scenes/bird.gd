extends RigidBody2D

export (float) var impulso
export (float) var velocidad_desplazamiento
export (float) var velocidad_incrementar

var vivo = true

func _ready():
	pass


func _physics_process(delta):
	linear_velocity.x = velocidad_desplazamiento #Viaja a la velocidad de desplazamiento en horizontal
	if(Input.is_action_just_pressed("click_izq")): #Si recien se presiono click izq levantamos al personaje hacia arriba (impulso)
		set_linear_velocity(Vector2(0,0)) #Parche para que no se vaya hacia el espacio exterior
		get_node("AnimationPlayer").play("aleteo") #Animacion de aleteo
		linear_velocity.y -= impulso #Subimos con velocidad de impulso hacia arriba
		get_tree().get_nodes_in_group("sfx")[0].get_node("02").play()
	get_tree().get_nodes_in_group("limites_body")[0].global_position.x = global_position.x
	
func _integrate_forces(state): #Detecto colisiones
	if(vivo):
		for i in range(state.get_contact_count()): #Reviso todas las colisiones posibles
			if(state.get_contact_collider_object(i).is_in_group("tubin")):
				get_tree().get_nodes_in_group("sfx")[0].get_node("03").play()
				get_tree().get_nodes_in_group("main")[0].gameover() #Le digo al main que es el fin del juego
				velocidad_desplazamiento = 0
				vivo = false
	
