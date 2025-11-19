extends Button

@onready var shader_filter = $"../ShaderFilter"

func _on_pressed() -> void:
	shader_filter.visible = !shader_filter.visible
