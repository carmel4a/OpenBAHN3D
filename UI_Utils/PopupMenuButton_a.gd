tool
extends Container

export var Text = "" setget set_text
#export var Type {}
var Popup_ = null
var _label = null

signal choosed
signal down
signal up

func _ready():
	
	_label = get_node("HBoxContainer/MenuButton")
	#Popup_ = _label.get_popup()

func _enter_tree():
	
	if Popup_ and get_node("HBoxContainer/CenterContainer/VBoxContainer"):
		get_node("HBoxContainer/CenterContainer/VBoxContainer/Button").connect(\
				"button_down", self, "emit_signal", ["up"])
		get_node("HBoxContainer/CenterContainer/VBoxContainer/Button1").connect(\
				"button_down", self, "emit_signal", ["down"])
		Popup_.connect(\
				"item_pressed", self, "_signal_to_signal", ["choosed"])
	#item_pressed(

func _signal_to_signal(n ,var0 = null, var1 = null, var2 = null, var3 = null):
	
	emit_signal(n, var0, var1, var2, var3)

func set_text(s):
	
	if _label:
		_label.set_text(str(s))
	Text = s
