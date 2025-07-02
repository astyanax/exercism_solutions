proc sumOfMultiples {factors limit} {
	set sum 0
	for {set i 1} {$i < $limit} {incr i} {
		foreach factor $factors {
			if {$factor != 0 && [expr $i % $factor] == 0 } {
				incr sum $i
				break
			}
		}
	}
	return $sum
}