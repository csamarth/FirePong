extends Label

var ms = 0
var s = 0
var m = 0

	
func update_Label():
	if(ms > 9):
		s += 1
		ms = 0
		
	if(s > 60):
		m += 1
		s = 0
	
	text = "Score => " + str(m) + " : " +  str(s) + " : " + str(ms)


func _on_Timer_timeout():
	ms += 1
	update_Label()

func stop_timer():
	$Timer.stop()
	
