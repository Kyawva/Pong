class_name GameManager extends Node

var score1: int = 0
var score2: int = 0
var end: bool = false

var Character_winner:String
var win_or_lose: String  
var Winning_number:int = 5

enum GameMode {PVP, PVA}

var game_mode: GameMode 

signal End_screen()
signal Change_score(Player:int, score:int )
signal screen_shake(speed:int)

func on_score(player:int) -> void:
	
	if player ==1:
		score1 +=1
		Change_score.emit(1,score1)
	else:
		score2 +=1
		Change_score.emit(2,score2)
	check_win()
	
func check_win():
	if score1 >=Winning_number:
		Character_winner = "Player 1"
		win_or_lose = "won"
		End_screen.emit()
	elif score2 >= Winning_number:
		if game_mode == GameMode.PVP:
			Character_winner = "Player 2"
			win_or_lose = "won"
		else:
			Character_winner = "Player 1"
			win_or_lose = "lost"
		End_screen.emit()
		
func screen_shaker(speed:int ) -> void:
	screen_shake.emit(speed)
		
	


		
		
