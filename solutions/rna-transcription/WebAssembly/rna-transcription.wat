(module
  (memory (export "mem") 1)
  (func (export "toRna") (param $offset i32) (param $length i32) (result i32 i32)
    (local $i i32) (local $end i32) (local $char i32)

    (if (i32.eqz (local.get $length)) (return (local.get $offset) (local.get $length)))
    (local.set $i (local.get $offset))
    (local.set $end (i32.add (local.get $offset) (local.get $length)))

    (loop $transcription
      (local.set $char (i32.load8_u (local.get $i)))
      ;; A -> U
      (if
        (i32.eq (local.get $char) (i32.const 0x41))
        (i32.store8 (local.get $i) (i32.const 0x55))
      )
      ;; T -> A
      (if
        (i32.eq (local.get $char) (i32.const 0x54))
        (i32.store8 (local.get $i) (i32.const 0x41))
      )
      ;; G -> C
      (if
        (i32.eq (local.get $char) (i32.const 0x47))
        (i32.store8 (local.get $i) (i32.const 0x43))
      )
      ;; C -> G
      (if
        (i32.eq (local.get $char) (i32.const 0x43))
        (i32.store8 (local.get $i) (i32.const 0x47))
      )

      (local.set $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $transcription (i32.lt_u (local.get $i) (local.get $end)))
    )

    (return (local.get $offset) (local.get $length))
  )
)