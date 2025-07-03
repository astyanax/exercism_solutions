(module
  (memory (export "mem") 1)

  (data (i32.const 100) "One for ")
  (data (i32.const 108) "you")
  (data (i32.const 111) ", one for me.")

  (func (export "twoFer") (param $offset i32) (param $length i32) (result i32 i32)
    (if (i32.eq(local.get $length) (i32.const 0)) (then (return (i32.const 100) (i32.const 24))))

    (memory.copy
      (i32.add (i32.const 108) (local.get $length))
      (i32.const 111)
      (i32.const 13)
    )
    (memory.copy
      (i32.const 108) (local.get $offset) (local.get $length)
    )

    (return (i32.const 100) (i32.add (i32.const 21) (local.get $length)))
  )
)