extends SceneTree
## Graba unos segundos de FractalBlast conduciendo la nave por código.
var game: Node
var t := 0.0
var fired_at := -10.0

func _initialize() -> void:
	var lang: Node = load("res://scripts/lang.gd").new()
	lang.name = "Lang"
	root.add_child(lang)
	game = load("res://scenes/game.tscn").instantiate()
	game.set("next_seed", 42)
	root.add_child(game)

func _process(delta: float) -> bool:
	t += delta
	var p: Node2D = game.get("_player")
	if p:
		var target_x := 360.0 + sin(t * 1.3) * 230.0
		var target_y := 1000.0 + sin(t * 0.7) * 60.0
		p.drag((Vector2(target_x, target_y) - p.position) * 0.08)
	if absf(t - 1.5) < delta: game.force_squad()
	if absf(t - 7.5) < delta: game.force_asteroids()
	var pool = game.get("_asteroids")
	if pool and not pool.active.is_empty() and t - fired_at > 0.7:
		var a = pool.active[0]
		for pr in [2, 3, 5, 7]:
			if a.number % pr == 0:
				game.fire_special(pr, a)
				fired_at = t
				break
	return false
