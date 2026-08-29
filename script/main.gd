extends Node2D

var score_player: int = 0
var score_bot: int = 0

@onready var score_label: Label = $CanvasLayer/ScoreLabel

func _on_goal_1_body_entered(body: Node2D) -> void:
	body.global_position = Vector2(575, 318)
	body.direction = Vector2(-1, -1)
	score_bot += 1
	update_score()
	
func _on_goal_2_body_entered(body: Node2D) -> void:
	body.global_position = Vector2(575, 318)
	body.direction = Vector2(-1, -1)
	score_player += 1
	update_score()

func update_score():
	score_label.text = str(score_player) + "x" + str(score_bot)
	
