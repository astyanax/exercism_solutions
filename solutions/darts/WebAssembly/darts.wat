(module
  (func (export "score") (param $x f32) (param $y f32) (result i32)
    (local $dist f32)
    (local.set $dist 
      (f32.add
        (f32.mul (local.get $x) (local.get $x))
        (f32.mul (local.get $y) (local.get $y))
      )
    )

    (if (f32.gt (local.get $dist) (f32.const 100.0)) (return (i32.const 0)))
    (if (f32.gt (local.get $dist) (f32.const 25.0)) (return (i32.const 1)))
    (if (f32.gt (local.get $dist) (f32.const 1.0)) (return (i32.const 5)))
    (return (i32.const 10))
  )
)