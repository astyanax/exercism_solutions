module main
import math
enum BucketId {
	one
	two
}
struct Solution {
	moves        int
	goal_bucket  BucketId
	other_bucket int
}
pub fn measure(capacity_one int, capacity_two int, goal int, start_bucket BucketId) !Solution {
	start_capacity, other_capacity, other_bucket := if start_bucket == BucketId.one {
			capacity_one, capacity_two, BucketId.two
		} else {
			capacity_two, capacity_one, BucketId.one
		}
	mut start_state := 0
	mut other_state := 0
	mut moves := 0
	for {
		if start_state == 0 && other_state == other_capacity {
			return error('impossible')
		} else if start_state == goal || other_state == goal {
			break
		} else if start_state == 0 {
			start_state = start_capacity
		} else if other_capacity == goal {
			other_state = other_capacity
		} else if other_state == other_capacity {
			other_state = 0
		} else {
			pour := math.min(start_state, other_capacity - other_state)
			other_state += pour
			start_state -= pour
		}
		moves++
	}
	return if start_state == goal {
		Solution { moves, start_bucket, other_state }
	} else {
		Solution { moves, other_bucket, start_state }
	}
}