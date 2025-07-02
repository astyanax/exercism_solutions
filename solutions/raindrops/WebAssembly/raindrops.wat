(module
  (memory (export "mem") 1)

  (data (i32.const 0) "Pling")
  (data (i32.const 5) "Plang")
  (data (i32.const 10) "Plong")

  (func (export "convert") (param $input i32) (result i32 i32)
    (local $idx i32)
    (local $idx2 i32)
    (local $digit i32)

    (if (i32.eqz (i32.rem_u (local.get $input) (i32.const 3)))
      (then
        (memory.copy (local.get $idx) (i32.const 0) (i32.const 5))
        (local.set $idx (i32.add (local.get $idx) (i32.const 5)))
      )
    )

    (if (i32.eqz (i32.rem_u (local.get $input) (i32.const 5)))
      (then
        (memory.copy (local.get $idx) (i32.const 5) (i32.const 5))
        (local.set $idx (i32.add (local.get $idx) (i32.const 5)))
      )
    )

    (if (i32.eqz (i32.rem_u (local.get $input) (i32.const 7)))
      (then
        (memory.copy (local.get $idx) (i32.const 10) (i32.const 5))
        (local.set $idx (i32.add (local.get $idx) (i32.const 5)))
      )
    )

    (if (i32.eqz (local.get $idx))
      (then
        (local.set $idx2 (i32.const 64))
        (loop
          (local.set $digit (i32.rem_u (local.get $input) (i32.const 10)))
          (local.set $idx2 (i32.add (local.get $idx2) (i32.const 1)))
          (i32.store8 (local.get $idx2) (i32.add (local.get $digit) (i32.const 48)))
          (br_if 0 (i32.gt_u (local.tee $input (i32.div_u (local.get $input) (i32.const 10))) (i32.const 0)))
        )
        (loop
          (i32.store8 (local.get $idx) (i32.load8_u (local.get $idx2)))
          (local.set $idx (i32.add (local.get $idx) (i32.const 1)))
          (br_if 0 (i32.gt_u (local.tee $idx2 (i32.sub (local.get $idx2) (i32.const 1))) (i32.const 64)))
        )
      )
    )
    (return (i32.const 0) (local.get $idx))
  )
)