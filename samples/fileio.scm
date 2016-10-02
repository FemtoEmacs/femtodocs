(define (opn fname)
  (trycatch (file fname :write :append)
      (lambda(x) (file fname :write :create)) ))

(define (into fname expr (s (opn fname)))
   (with-output-to s
     (write expr) (newline) (io.close s)))

(define (readLn) (io.readline *input-stream*))

(define (rdprt)
   (let loop ( (x (readLn)))
      (cond ( (eof-object? x) #t)
            (else (princ x)
                  (loop (readLn)) )) ))

(define (copyFile inF outF)
   (let ( (in (file inF :read))
          (out (file outF :write :create)) )
     (with-output-to out
        (with-input-from in
           (rdprt)))
     (io.close in)
     (io.close out)))

(define (prtFile fname)
   (let ( (in (file fname :read)))
     (with-input-from in
        (let loop ( (x (readLn)))
           (when (not (eof-object? x))
              (princ x)
              (loop (readLn))) ) )))


