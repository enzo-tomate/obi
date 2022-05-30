extends KinematicBody2D

var direction = Vector2()
var speed = 4.1
var life = 100
var points = 0 

var fireball = preload("res://Instantiables/FireBall.tscn")

func _ready():
	pass 
func _process(delta):
	#movimentação esquerda/direita
	if Input.is_key_pressed(KEY_RIGHT):
		direction.x =speed
	elif Input.is_key_pressed(KEY_LEFT):
		direction .x = -speed
	else:
		direction.x = 0
		#movimentação cima/baixo
	if Input.is_key_pressed(KEY_UP):
		direction.y= -speed
	elif Input.is_key_pressed(KEY_DOWN):
		direction.y = speed
	else:
		direction.y = 0
		
		
		#animações
	if direction.x == 0 and direction.y == 0:
		get_child(0).animation ="Idle"
	else:
		get_child (0).animation ="Walk"
		
	#flip do player
	if self.position.x < get_global_mouse_position().x:
		get_child(0).flip_h = false
	else:
		get_child(0).flip_h = true
		
	#atirar
	if Input. is_action_just_pressed("Shoot"):
		var newFireBall = fireball.instance()
		newFireBall.position = self.position
		self.get_parent().add_child(newFireBall)
		
	get_parent().get_child(3).scale.x = life/ 100.0
	#barra de vida
	get_parent().get_child(5).scale.x = points / 10.0
	#barra de pontos
	
		#jaera
	if life <=0:
		get_tree().change_scene("res://Lose.tscn")
		
	#vitoria
	if points > 9:
		get_tree().change_scene("res://Win.tscn")
		
	#perder pontos copmo tempo
	if points > 0: 
		points -= 0.3 * delta 
		
	move_and_collide(direction)
			
