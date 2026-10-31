extends SceneTree
## Juega solo a MathDungeon unos segundos para grabarlo.
var main: Node
var frame := 0
var dialog_frames := 0
var room_i := 1
const DIRS := {Vector2i(1,0): KEY_RIGHT, Vector2i(-1,0): KEY_LEFT, Vector2i(0,1): KEY_DOWN, Vector2i(0,-1): KEY_UP}

func _initialize() -> void:
	main = load("res://scenes/main.tscn").instantiate()
	root.add_child(main)

func _bfs_step(from: Vector2i, goal: Vector2i) -> Vector2i:
	var prev := {from: from}
	var q: Array[Vector2i] = [from]
	while not q.is_empty():
		var c: Vector2i = q.pop_front()
		if c == goal:
			while prev[c] != from:
				c = prev[c]
			return c - from
		for d in DIRS:
			var n: Vector2i = c + d
			if not prev.has(n) and (main.dungeon.is_walkable(n) or n == goal):
				prev[n] = c
				q.append(n)
	return Vector2i.ZERO

func _process(_d: float) -> bool:
	frame += 1
	if frame == 2:
		main.music.volume_db = -80.0
		main.move_cooldown_ms = 0
	if frame < 20:
		return false
	var dlg = main.dialog
	if dlg and dlg.visible:
		dialog_frames += 1
		if dialog_frames > 50:
			dialog_frames = 0
			if dlg.get("_waiting_choice"):
				dlg._choose(randi() % 4)
			elif dlg.get("_waiting_dismiss"):
				dlg._dismissed.emit()
		return false
	if frame % 7 != 0 or main.busy:
		return false
	var p: Vector2i = main.player.pos
	var goal := Vector2i(-1, -1)
	var best := 9
	for e in main.enemies:
		var dist: int = absi(e.pos.x - p.x) + absi(e.pos.y - p.y)
		if dist < best:
			best = dist; goal = e.pos
	if goal.x < 0:
		var room: Rect2i = main.dungeon.rooms[room_i % main.dungeon.rooms.size()]
		goal = room.get_center()
		if p == goal:
			room_i += 1
			return false
	var step := _bfs_step(p, goal)
	if step == Vector2i.ZERO:
		room_i += 1
		return false
	var ev := InputEventKey.new()
	ev.pressed = true
	ev.keycode = DIRS[step]
	main._unhandled_input(ev)
	return false
