class_name PlayerState
extends State

@onready var player: CharacterBody2D = $"../.."
@onready var animation_tree: AnimationTree = $"../../AnimationTree"
@onready var playback = animation_tree.get("parameters/StateMachine/playback") as AnimationNodeStateMachinePlayback
