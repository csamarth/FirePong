extends RichTextLabel

var ms = 0
var s = 0
var m = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(ms > 9):
		s += 1
		ms = 0
		
	if(s > 60):
		m += 1
		s = 0
		
	if(m > 60):
		var timer = get_node("Timer")
		timer.stop()
			
	set_text("Time=> " + str(m) + " : " +  str(s) + " : " + str(ms))
	pass


func _on_Timer_timeout():
	ms += 1
	pass # Replace with function body.
