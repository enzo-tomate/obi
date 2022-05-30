extends KinematicBody2D

pass 
var player
var angle
var speed = 3
var life = 30

func _ready():
	player = get_parent(). get_child(0)
	
func _process(delta):
	angle = get_angle_to(player.position)
	
	if position.distance_to (player.position)	> 75:
		move_and_collide(Vector2(1, 0).rotated(angle)*speed)
	else: 
		if player.life > 0:
			player.life -= 10 
		get_parent().remove_child(self)
		
	#morte da vida do inimigo
	if life <= 0:
		if player.points <= 9: 
			player.points  += 1
			# e vai dar problema aqui óóóóóóóó
		
		get_parent().remove_child(self)
		
		
