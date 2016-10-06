(define (tobin n (acc '()) (bits 8))
   (cond ( (< n 1) acc)
         ( (odd? n) 
           (tobin (ash n 1) (cons 1 acc) (- bits 1)) )
         (else (tobin (ash n 1) (cons 0 acc) (- bits 1)) ) ))


