(define (prefix? p s i (cnt (string.count p)))
  (if (< (string.count s) (+ cnt i)) #f 
     (let igual ( (k 0) )
         (cond 
           ( (>= k cnt) #t)
           ( (= (aref p k) (aref s (+ i k)) )
             (igual (+ k 1)))
           (else #f)) ) ))
            
(define (fixdiacritics s (n (string.count s)))
  (let loop ((b (buffer)) (i 0))
    (cond ( (>= i n) (io.tostring! b))
          ( (prefix? "%C3%BA" s i)
             (io.putc b #\ú)
             (loop b (+ i 6)))
          ( (prefix? "%C3%A9" s i)
            (io.putc b #\é)
            (loop b (+ i 6)))
          (else (io.putc b (string.char s i))
                (loop b (+ i 1))  ))  ))

(define (fixd s (n (string.count s)) (b (buffer)))
  (with-output-to b
                  (let loop ( (i 0))
                    (cond ( (>= i n) (io.tostring! b))
                          ( (prefix? "%C3%BA" s i)
                            (princ "ú")
                            (loop (+ i 6)))
                          ( (prefix? "%C3%A9" s i)
                            (princ "é")
                            (loop (+ i 6)))
                          (else (princ (string.char s i))
                                (loop (+ i 1)) )) )) )

