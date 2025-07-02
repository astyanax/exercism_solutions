(module
  (memory (export "mem") 1)

  (data (i32.const 0) "black,brown,red,orange,yellow,green,blue,violet,grey,white")
  (func (export "colors") (result i32 i32)
    (return (i32.const 0) (i32.const 58))
  )

  ;; Can be used to populate globals similar to a constructor
  (func $initialize)
  (start $initialize)

  ;; Given a valid resistor color, returns the associated value 
  (func (export "colorCode") (param $offset i32) (param $len i32) (result i32)
    (i32.const 0) (i32.load) (local.get $offset) (i32.load)
    (i32.eq) (if (then (return (i32.const 0))))
    (i32.const 6) (i32.load) (local.get $offset) (i32.load)
    (i32.eq) (if (then (return (i32.const 1))))
    (i32.const 12) (i32.load) (local.get $offset) (i32.load)
    (i32.eq) (if (then (return (i32.const 2))))
    
    (i32.const 16) (i32.load) (local.get $offset) (i32.load)
    (i32.eq) (if (then (return (i32.const 3))))
    (i32.const 23) (i32.load) (local.get $offset) (i32.load)
    (i32.eq) (if (then (return (i32.const 4))))
    
    (i32.const 30) (i32.load) (local.get $offset) (i32.load)
    (i32.eq) (if (then (return (i32.const 5))))
    
    (i32.const 36) (i32.load) (local.get $offset) (i32.load)
    (i32.eq) (if (then (return (i32.const 6))))
    
    (i32.const 41) (i32.load) (local.get $offset) (i32.load)
    (i32.eq) (if (then (return (i32.const 7))))
    
    (i32.const 48) (i32.load) (local.get $offset) (i32.load)
    (i32.eq) (if (then (return (i32.const 8))))
    (i32.const 53) (i32.load) (local.get $offset) (i32.load)
    (i32.eq) (if (then (return (i32.const 9))))
    
    (return (i32.const -1))
  )
)