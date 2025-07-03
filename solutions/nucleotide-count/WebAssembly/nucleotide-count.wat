(module
  (memory (export "mem") 1)

  (func (export "countNucleotides") (param $offset i32) (param $length i32) (result i32 i32 i32 i32)
    (local $n_idx i32)
    (local $iter i32)

    (if (i32.eqz(local.get $length))(then (return(i32.const 0)(i32.const 0)(i32.const 0)(i32.const 0))))

    (loop $for
      (block $break
       	(call $load_n_idx
          (i32.load8_u
            (i32.add
                (local.get $offset)
                (local.get $iter))))
        (local.tee $n_idx)
        
        (if (i32.eq (local.get $n_idx) (i32.const -1)) (then
              (return (i32.const -1) (i32.const -1) (i32.const -1) (i32.const -1)))
        )

        (i32.store8 (local.get $n_idx) (i32.add (i32.load8_u (local.get $n_idx)) (i32.const 1)))

        (i32.add (local.get $iter) (i32.const 1))
        local.tee $iter
        local.get $length
	    i32.eq
        
        br_if $break
        br $for
     ))
    (return
      (i32.load8_u (i32.const 0))
      (i32.load8_u (i32.const 1))
      (i32.load8_u (i32.const 2))
      (i32.load8_u (i32.const 3))
    )
  )

  (func $load_n_idx (param $nucleotide i32) (result i32)
    (i32.const 0x41) ;; A
    (local.get $nucleotide)
    (i32.eq)
    (if(then(return (i32.const 0))))

    (i32.const 0x43) ;; C
    (local.get $nucleotide)
    (i32.eq)
    (if(then(return (i32.const 1))))

    (i32.const 0x47) ;; G
    (local.get $nucleotide)
    (i32.eq)
    (if(then(return (i32.const 2))))

    (i32.const 0x54) ;; T
    (local.get $nucleotide)
    (i32.eq)
    (if(then(return (i32.const 3))))
    (i32.const -1)
    )
)