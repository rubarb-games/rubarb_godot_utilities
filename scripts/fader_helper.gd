extends Node

var all_faders:Array[Fader] = []

class Fader:
	var current_time:float = 0.0
	var max_time:float = 1.0
	var is_on:bool = true
	var callback_called:bool = false
	var callback_off_called:bool = false
	var manual_update:bool = false
	var callback:Callable
	var callback_off:Callable
	
	var pause_val:bool = false
	
	func _init(m:float,c:Callable,c_o:Callable):
		max_time = m
		callback = c
		callback_off = c_o
		
	func set_manual_update(m:bool):
		manual_update = m
		return self
		
	func value():
		return  current_time/max_time
		
	func toggle():
		return turn_off() if is_on else turn_off()
		
	func turn_on():
		is_on = true
		callback_called = false
		return true
		
	func turn_off():
		is_on = false
		callback_off_called = false
		return false
		
	func unpause():
		pause_val = false
		
	func pause():
		pause_val = true
		
	func update(delta:float):
		if pause_val:
			return
			
		if is_on:
			if current_time > max_time:
				if callback and !callback_called:
					callback_called = true
					callback.call()
				return -1
			current_time += delta
		else:
			if current_time < 0.0:
				if callback_off and !callback_off_called:
					callback_off_called = true
					callback_off.call()
				return -1
			current_time -= delta
			
		return current_time / max_time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for f in all_faders:
		if !f.manual_update:
			f.update(delta)

func add_fader(time_to_fade:float = 1.0,callback:Callable = Callable(),callback_off:Callable = Callable()):
	var f:Fader = Fader.new(time_to_fade,callback,callback_off)
	all_faders.append(f)
	
func remove_fader(f:Fader):
	all_faders.erase(f)
