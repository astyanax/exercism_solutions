(module
  (memory (export "mem") 1)

  (func (export "reverseString") (param $offset i32) (param $length i32) (result i32 i32)
    (local $start i32)
    (local $end i32)
    (local $temp i32)
    (local.set $start (local.get $offset))
    (local.set $end (i32.sub (i32.add (local.get $offset) (local.get $length)) (i32.const 1)))
    (if (i32.lt_u (local.get $start) (local.get $end)) (then (loop
      (local.set $temp (i32.load8_u (local.get $end)))
      (i32.store8 (local.get $end) (i32.load8_u (local.get $start)))
      (i32.store8 (local.get $start) (local.get $temp))
      
      (br_if 0 (i32.lt_u 
        (local.tee $start (i32.add (local.get $start) (i32.const 1))) 
        (local.tee $end (i32.sub (local.get $end) (i32.const 1)))
      ))
    )))
    
    (return (local.get $offset) (local.get $length))
  )
)