extends Node2D

class_name Paddle

## paddle variables
#var paddleColor = Color.white
#var paddleSize = Vector2(10.0, 100.0)
#var halfPaddleHeight = paddleSize.y/2
#var paddlePadding = 10.0
#
## player paddle
#onready var playerPosition = Vector2(paddlePadding, screenBox.getHalfHeight() - halfPaddleHeight)
#onready var playerRectangle = Rect2(playerPosition, paddleSize)
#
##ai paddle
#onready var aiPosition = Vector2(screenBox.getSize().x - (paddlePadding + paddleSize.x), screenBox.getHalfHeight() - halfPaddleHeight)
#onready var aiRectangle = Rect2(aiPosition, paddleSize)

var _color: Color = Color.white
var _size: Vector2 = Vector2(10.0, 100.0)
var _padding: float = 10.0
var _speed: Vector2 = Vector2(0.0, 400.0)	# only moves in y-axis
var _resetSpeed: Vector2 = _speed
var _halfHeight: float = _size.y / 2.0

# handled by subclass
var _rect: Rect2
var _pos: Vector2
var _resetPos: Vector2
var _boundBox: BoundBox

# ep 8
var maxMagnitude: float = 3.0
var maxRotation: float = 75.0

func _draw() -> void:
	draw_rect(_rect, _color)

func getHalfHeight() -> float:
	return _halfHeight

func getRect() -> Rect2:
	return _rect

func resetPosition() -> void:
	_pos = _resetPos
	_rect = Rect2(_pos, _size)
	update()

func updatePosition() -> void:
	_pos.y = clamp(_pos.y, _boundBox.getPosition().y, _boundBox.getSize().y - _size.y)
	_rect = Rect2(_pos, _size)
	update()

# overridden by subclass
func moveUp(delta: float) -> void:
	assert(false, "Method moveUp has not been overridden")

func moveDown(delta: float) -> void:
	assert(false, "Method moveDown has not been overridden")


func changeBallDirection(ball: Ball) -> void:
	var ballY = ball.getPosition().y
	var magnitude: float = Math.pointConversion(ballY, _pos.y, _pos.y + _size.y, maxMagnitude, -maxMagnitude)
	var degree: float = Math.pointConversion(ballY, _pos.y, _pos.y + _size.y, maxRotation, -maxRotation)
	
	magnitude = abs(magnitude) if abs(magnitude) >= 1.0 else 1.0
	
	ball.changeRotationAndDirection(degree)
	ball.changeMagnitude(magnitude)
