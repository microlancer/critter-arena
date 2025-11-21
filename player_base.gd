extends Area2D

var base_hp: int = 100000
@export var base_hp_label: Label

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemies"):
		print("Enemy has reached the base!")
		var critter: CharacterBody2D = body
		base_taking_damage(critter.attack)
		body.velocity = Vector2.ZERO

func base_taking_damage(dmg_per_sec: int) -> void:
	var timer: Timer = Timer.new()
	timer.autostart = true
	timer.one_shot = false
	timer.wait_time = 1.0
	timer.timeout.connect(Callable(self, "timer_damage").bind(dmg_per_sec))
	add_child(timer)
	timer.start()

func timer_damage(dmg_per_sec: int):
	print("Base took " + str(dmg_per_sec) + " damage! Health: " + str(base_hp))
	$Splatter.visible = true
	$HitSound.play()
	var hide_splatter_timer: Timer = Timer.new()
	hide_splatter_timer.autostart = true
	hide_splatter_timer.one_shot = true
	hide_splatter_timer.wait_time = 0.15
	hide_splatter_timer.timeout.connect(Callable(self, "hide_splatter"))
	add_child(hide_splatter_timer)
	hide_splatter_timer.start()
	base_hp = base_hp - dmg_per_sec
	base_hp_label.text = str(base_hp)

func hide_splatter():
	$Splatter.visible = false
