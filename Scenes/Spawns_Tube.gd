extends Node

var lista_tubas = [] #Variable donde guardo la cola de tubos
export (float) var offset_x #Distancia vacia entre tubos
export (int) var max_y #Maximo y minimo en eje Y que pueden posicionarse los tubos
export (int) var min_y


func _ready():
	randomize() #Semilla para numeros aleatorios
	lista_tubas = get_tree().get_nodes_in_group("tuba") #Obtengo los spawn
	for i in lista_tubas: #Recorro la lista de tubos
		azar_y(i) #Los posiciono en Y al azar

func reposicionar(): #Al tubo que salio de pantalla lo ponemos en la cola de nuevo
	lista_tubas[0].global_position.x = lista_tubas[-1].global_position.x + offset_x #Posicionamos al final de la cola + offset (coordenadas)
	azar_y(lista_tubas[0]) #Genero posicion Y aleatoria
	lista_tubas.push_back(lista_tubas.pop_front()) #Sacamos el primer elemento de la lista y lo agregamos al final (la variable)
	
	
	
func azar_y(var tubo): #Posiciono los tubos en eje Y aleatoriamente
	tubo.global_position.y = randi()%max_y+min_y #Maximo y minimo en eje Y que pueden posicionarse los tubos