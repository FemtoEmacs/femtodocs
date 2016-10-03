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

(define (prtFile fname (in (file fname :read)))
        (let loop ( (x (io.getc in)))
           (when (not (eof-object? x))
                (io.putc *output-stream* x)
                (loop (io.getc in)) ))
       (io.close in))


