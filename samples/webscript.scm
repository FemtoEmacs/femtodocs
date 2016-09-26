
(define (lisp? x)
  (and (> (string.count x) 3)
       (= (aref x 0) (aref ">" 0)) ))

(define (readLn)
  (io.readline *input-stream*))

(define (convert)
  (let loop ( (x (readLn)) )
     (cond ( (eof-object? x) #t)
           ( (lisp? x)
             (princ (string.sub x 1 (string.count x))) 
             (loop (readLn))) 
           (else (princ "(princ ")
                 (write x)
                 (princ ")") (newline)
                 (loop (readLn)) )) ))

(define (copyFile inFile outFile)
  (let ( (in (file inFile :read))
         (out (file outFile :write :create)) )
    (with-output-to out
      (with-input-from in   
         (princ "#! /home/strue028/flisp")
         (newline)
         (princ "(princ \"Content-type: text/html\")")
         (princ "(newline)")
         (princ "(newline)")
         (newline)
         (convert)
         (newline)))
    (io.close in)
    (io.close out)))


