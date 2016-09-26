#! /home/strue028/flisp
(princ "Content-type: text/html")(newline)(newline)

(princ "<html>\n")

(princ "  <head>\n")

(princ "    <title>femtolisp tutorial</title>\n")

(princ "      <meta http-equiv= 'Content-Type'\n")

(princ "         content= 'text/html; charset=utf-8' />\n")

(princ "   </head>\n")

(princ " <body>\n")

(princ "   <form name='form' method='get'>\n")

(princ "      <input type='text' name='temp'>\n")

(princ "      <input type='submit' name='btn' value='send'>\n")

(princ "  </form>\n")

(princ "  <p>La réponse est  \n")
 (if (os.getenv "QUERY_STRING")

       (princ (os.getenv "QUERY_STRING"))

     (princ "empty"))


(princ "  </p>\n")

(princ "</body>\n")

(princ "</html>\n")

(princ "\n")

