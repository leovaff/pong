extends Node2D


signal game_over


var score_player: int = 0
var score_bot: int = 0
var max_score: int = 3


@onready var score_label: Label = $CanvasLayer/ScoreLabel
@onready var player_score_sound: AudioStreamPlayer = $PlayerScoreSound
@onready var bot_score_sound: AudioStreamPlayer = $BotScoreSound
@onready var results_screen: Panel = %ResultsScreen
@onready var results: RichTextLabel = %Results

func _ready() -> void:
	results_screen.hide()

func _on_goal_1_body_entered(body: Node2D) -> void:
	body.global_position = Vector2(575, 318)
	body.direction = Vector2(-1, -1).normalized()
	score_bot += 1
	bot_score_sound.play()
	update_score()
	
	
func _on_goal_2_body_entered(body: Node2D) -> void:
	body.global_position = Vector2(575, 318)
	body.direction = Vector2(-1, -1).normalized()
	score_player += 1
	player_score_sound.play()
	update_score()


func update_score():
	score_label.text = str(score_player) + "x" + str(score_bot)
	if score_player >= max_score || score_bot >= max_score:
		results_screen.show()
		results.text = "%s" % "[wave][center]Vitória![/wave][/center]" if score_player > score_bot else "[center][wave]Derrota![/wave][/center]"
		results.text += "\n[center]%s / %s[/center]" % [score_player, score_bot]
		game_over.emit()
		
		
func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")
