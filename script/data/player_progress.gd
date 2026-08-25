extends Node

var unlocked_ids: Array[String] = []
var currency_b: int = 0

func is_unlocked(frog_id: String) -> bool:
	return frog_id in unlocked_ids

func try_unlock(frog: FrogData) -> bool:
	if currency_b >= frog.unlock_cost and not is_unlocked(frog.id):
		currency_b -= frog.unlock_cost
		unlocked_ids.append(frog.id)
		return true
	return false
