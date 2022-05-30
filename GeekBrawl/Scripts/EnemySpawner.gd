extends Timer

var enemy = preload("res://Instantiables/Enemy.tscn")

func _ready():
	pass 



func _process(delta):
	pass


func _on_EnemySpawner_timeout():
	var newEnemy = enemy.instance() 
	newEnemy . global_position = Vector2(rand_range(0,1024), rand_range(0,600))
	
	
	get_parent().add_child(newEnemy)

