extends Sprite

const size = Vector2(40, 20)
var mpos = Vector2(0, 0)
var pos = Vector2(0, 0)
var pxpos = Vector2(0, 0)
var isEnabled = true

signal LMB_pressed
signal RMB_pressed
signal MW_up
signal MW_down

func _ready():
	
	get_node("CursorContextMenu").connect("menu_state", self, "_on_menu_state")
	set_process(true)
	set_process_unhandled_input(true)

func _process(delta):
	
	if (isEnabled):
		mpos = get_global_mouse_pos()
		pos = (mpos / size).floor()
		pxpos = pos * size
		set_pos(pxpos)

func _unhandled_input(event):
	
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			emit_signal("LMB_pressed", pos)
		if event.button_index == BUTTON_RIGHT and event.is_pressed():
			emit_signal("RMB_pressed", mpos)
		if event.button_index == BUTTON_WHEEL_UP and event.is_pressed():
			emit_signal("MW_up")
		if event.button_index == BUTTON_WHEEL_DOWN and event.is_pressed():
			emit_signal("MW_down")

func _on_menu_state(state):
	
	isEnabled = not state
