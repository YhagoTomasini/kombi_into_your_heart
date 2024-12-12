extends Area2D


@onready var audHeart = $AudioHeart

func playHeart():
	audHeart.play()
