(define (opn fname)
  (trycatch (file fname :write :append)
      (lambda(err) (file fname :write :create)) ))

(define (clear nm i sz (out (opn nm)))
   (io.seek out (* i sz))
   (let loop ((j sz))
      (when (> j 0)
         (io.putc out #\space)
         (loop (- j 1)) ))
      (io.close out))

(define (wrtVector nm datum i (sz 100))
   (clear nm i sz)
   (let ((out (trycatch (file nm :write :append)
                 (lambda(err) (file nm :write :create)) ) ))
      (with-output-to out
         (io.seek out (* i sz))
         (princ datum))
      (io.close out)))

(define (rdVector nm i (sz 100))
  (let ( (in (file nm :read)))
    (with-input-from in
       (io.seek in (* i sz))
       (print (read)))
    (io.close in)))
    
         
