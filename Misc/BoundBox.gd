extends Resource

class_name BoundBox

var _box: Rect2
var _topBound: float
var _bottomBound: float
var _rightBound: float
var _leftBound: float

func _init(rect: Rect2) -> void:
	_box = rect
	_leftBound = _box.position.x
	_rightBound = _leftBound + _box.size.x
	_topBound = _box.position.y
	_bottomBound = _topBound + _box.size.y

func getHalfHeight() -> float:
	return _box.size.y / 2.0

func getHalfWidth() -> float:
	return _box.size.x / 2.0

func getCenter() -> Vector2:
	return _box.size / 2.0

func getRect() -> Rect2:
	return _box

func getBox() -> BoundBox:
	return self

func getSize() -> Vector2:
	return _box.size

func getPosition() -> Vector2:
	return _box.position

func isPassLeftBound(position: Vector2) -> bool:
	return position.x <= _leftBound

func isPassRightBound(position: Vector2) -> bool:
	return position.x >= _rightBound

func isPassTopBound(position: Vector2) -> bool:
	return position.y <= _topBound

func isPassBottomBound(position: Vector2) -> bool:
	return position.y >= _bottomBound

## screen values
#onready var screenWidth = get_tree().root.size.x
#onready var screenHeight = get_tree().root.size.y
#onready var halfScreenWidth = screenWidth/2
#onready var halfScreenHeight = screenHeight/2
