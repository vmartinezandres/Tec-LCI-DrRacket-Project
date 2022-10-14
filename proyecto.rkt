#lang racket

"""

 Frontend

"""
(require (lib "graphics.ss" "graphics")) (open-graphics)

; Variables
(define dimensionCubo 0)
(define margen 0.0)
(define dimensiones? #f)
(define direccion "derecha")
(define ubicacion 1)
(define matrizCubo '())


; Ventana
(define ventana (open-viewport "ventana" 808 1000))
(open-graphics)

; Dibujar consola
(define (pantalla)
  ((draw-solid-rectangle ventana) (make-posn 0 0) 808 700 "black"))

(define (controles)
  (begin
    ((draw-solid-rectangle ventana) (make-posn 0 700) 808 300 "MediumOrchid")
    (ponerBotones)))

(define (ponerBotones)
  (begin
    ;Boton Central
    ((draw-solid-rectangle ventana) (make-posn 110 840) 50 50 "crimson")

    ;Botones de Izquierda-Derecha y Arrbia-Abajo
    ((draw-solid-rectangle ventana) (make-posn 50 840) 50 50 "dim gray")
    ((draw-solid-rectangle ventana) (make-posn 170 840) 50 50 "dim gray")

    ((draw-solid-rectangle ventana) (make-posn 110 780) 50 50 "dim gray")
    ((draw-solid-rectangle ventana) (make-posn 110 900) 50 50 "dim gray")

    ;Botones del 1-6
    ((draw-solid-rectangle ventana) (make-posn 468 750) 50 50 "turquoise")
    ((draw-solid-rectangle ventana) (make-posn 528 810) 50 50 "turquoise")
    ((draw-solid-rectangle ventana) (make-posn 588 870) 50 50 "turquoise")

    ((draw-solid-rectangle ventana) (make-posn 588 750) 50 50 "turquoise")
    ((draw-solid-rectangle ventana) (make-posn 648 810) 50 50 "turquoise")
    ((draw-solid-rectangle ventana) (make-posn 708 870) 50 50 "turquoise")))

; Actualizar el cubo
(define (ponerDimensiones dim)    
  (cond ( (or (equal? dim 2) (equal? dim 3) (equal? dim 4) (equal? dim 5) (equal? dim 6) )
          (begin
            (set! dimensiones? #t)
            (set! dimensionCubo dim)
            (set! margen (* -50.5 (- dimensionCubo 6)))
            (cond ( (equal? dim 2)
                    (set! matrizCubo '( ((1 1) (1 1)) ((2 2) (2 2)) ((3 3) (3 3)) ((4 4) (4 4)) ((5 5) (5 5)) ((6 6) (6 6)) )))
                  ( (equal? dim 3)
                    (set! matrizCubo '( ((1 1 1) (1 1 1) (1 1 1)) ((2 2 2) (2 2 2) (2 2 2)) ((3 3 3) (3 3 3) (3 3 3)) ((4 4 4) (4 4 4) (4 4 4)) ((5 5 5) (5 5 5) (5 5 5)) ((6 6 6) (6 6 6) (6 6 6)) )))
                  ( (equal? dim 4)
                    (set! matrizCubo '( ((1 1 1 1) (1 1 1 1) (1 1 1 1) (1 1 1 1)) ((2 2 2 2) (2 2 2 2) (2 2 2 2) (2 2 2 2)) ((3 3 3 3) (3 3 3 3) (3 3 3 3) (3 3 3 3)) ((4 4 4 4) (4 4 4 4) (4 4 4 4) (4 4 4 4)) ((5 5 5 5) (5 5 5 5) (5 5 5 5) (5 5 5 5)) ((6 6 6 6) (6 6 6 6) (6 6 6 6) (6 6 6 6)))))
                  ( (equal? dim 5)
                    (set! matrizCubo '( ((1 1 1 1 1) (1 1 1 1 1) (1 1 1 1 1) (1 1 1 1 1) (1 1 1 1 1)) ((2 2 2 2 2) (2 2 2 2 2) (2 2 2 2 2) (2 2 2 2 2) (2 2 2 2 2)) ((3 3 3 3 3) (3 3 3 3 3) (3 3 3 3 3) (3 3 3 3 3) (3 3 3 3 3)) ((4 4 4 4 4) (4 4 4 4 4) (4 4 4 4 4) (4 4 4 4 4) (4 4 4 4 4)) ((5 5 5 5 5) (5 5 5 5 5) (5 5 5 5 5) (5 5 5 5 5) (5 5 5 5 5)) ((6 6 6 6 6) (6 6 6 6 6) (6 6 6 6 6) (6 6 6 6 6) (6 6 6 6 6)) )))
                  ( (equal? dim 6)
                    (set! matrizCubo '(((1 1 1 1 1 1) (1 1 1 1 1 1) (1 1 1 1 1 1) (1 1 1 1 1 1) (1 1 1 1 1 1) (1 1 1 1 1 1)) ((2 2 2 2 2 2) (2 2 2 2 2 2) (2 2 2 2 2 2) (2 2 2 2 2 2) (2 2 2 2 2 2) (2 2 2 2 2 2)) ((3 3 3 3 3 3) (3 3 3 3 3 3) (3 3 3 3 3 3) (3 3 3 3 3 3) (3 3 3 3 3 3) (3 3 3 3 3 3)) ((4 4 4 4 4 4) (4 4 4 4 4 4) (4 4 4 4 4 4) (4 4 4 4 4 4) (4 4 4 4 4 4) (4 4 4 4 4 4)) ((5 5 5 5 5 5) (5 5 5 5 5 5) (5 5 5 5 5 5) (5 5 5 5 5 5) (5 5 5 5 5 5) (5 5 5 5 5 5)) ((6 6 6 6 6 6) (6 6 6 6 6 6) (6 6 6 6 6 6) (6 6 6 6 6 6) (6 6 6 6 6 6) (6 6 6 6 6 6)) ))))
            (moverCubo (car matrizCubo))))))

(define (moverCubo matriz)
  (cond ( (null? matriz)
          '())
        (else
         (moverFila matriz (car matriz) (+ 101 margen) (+ (- (* (+ 1 (* -1 (- (length matriz) (length(car matriz))))) 101) 50) margen)))))

(define (moverFila matriz fila posX posY)
  (cond ( (null? fila)
          (moverCubo (cdr matriz)))
        (else
         (cond ((equal? (car fila) 1)
                (begin
                  ((draw-solid-rectangle ventana) (make-posn posX posY) 100 100 "White")
                  (moverFila matriz (cdr fila) (+ posX 101) posY )))
               ((equal? (car fila) 2)
                (begin
                  ((draw-solid-rectangle ventana) (make-posn posX posY) 100 100 "crimson")
                  (moverFila matriz (cdr fila) (+ posX 101) posY )))
               ((equal? (car fila) 3)
                (begin
                  ((draw-solid-rectangle ventana) (make-posn posX posY) 100 100 "yellow")
                  (moverFila matriz (cdr fila) (+ posX 101) posY )))
               ((equal? (car fila) 4)
                (begin
                  ((draw-solid-rectangle ventana) (make-posn posX posY) 100 100 "darkorange")
                  (moverFila matriz (cdr fila) (+ posX 101) posY )))
               ((equal? (car fila) 5)
                (begin
                  ((draw-solid-rectangle ventana) (make-posn posX posY) 100 100 "lime green")
                  (moverFila matriz (cdr fila) (+ posX 101) posY )))
               ((equal? (car fila) 6)
                (begin
                  ((draw-solid-rectangle ventana) (make-posn posX posY) 100 100 "royalblue")
                  (moverFila matriz (cdr fila) (+ posX 101) posY )))))))

; Funciones de botones
(define (tipoBoton opcion)
  (cond ( (equal? dimensiones? #f)
          (ponerDimensiones (string->number opcion)))
        (else
         (cond ( (equal? opcion "central")
                 (begin
                   (set! matrizCubo (moverCuboInterno matrizCubo ubicacion direccion))
                   (moverCubo (car matrizCubo))))
               ( (or (equal? opcion "izquierda") (equal? opcion "derecha") (equal? opcion "arriba") (equal? opcion "abajo"))
                 (set! direccion opcion))       
               (else
                (cond ( (<= (string->number opcion) dimensionCubo)
                        (set! ubicacion (string->number opcion)))
                      (else
                       (ventanaEmergente "Numero no valido"))))))))

(define (ventanaEmergente text)
  (define m (open-viewport "Alerta" 500 100))
   ((draw-string m) (make-posn 200 50) text "red")
   (sleep 2)
   (close-viewport m)
   )

; Campo de clic de botones
(define (clic)
  (if (equal? (left-mouse-click? (get-mouse-click ventana)) #f)
      (clic)
      (begin
        (cond
          
          ;Boton Central
          ((and (and (< (posn-x (query-mouse-posn ventana)) (+ 110 50)) (> (posn-x (query-mouse-posn ventana)) 110)) (and (< (posn-y (query-mouse-posn ventana)) (+ 840 50)) (> (posn-y (query-mouse-posn ventana)) 840))) (tipoBoton "central"))

          ;Botones de Izquierda-Derecha y Arrbia-Abajo
          ((and (and (< (posn-x (query-mouse-posn ventana)) (+ 50 50)) (> (posn-x (query-mouse-posn ventana)) 50)) (and (< (posn-y (query-mouse-posn ventana)) (+ 840 50)) (> (posn-y (query-mouse-posn ventana)) 840))) (tipoBoton "izquierda"))
          ((and (and (< (posn-x (query-mouse-posn ventana)) (+ 170 50)) (> (posn-x (query-mouse-posn ventana)) 170)) (and (< (posn-y (query-mouse-posn ventana)) (+ 840 50)) (> (posn-y (query-mouse-posn ventana)) 840))) (tipoBoton "derecha"))

          ((and (and (< (posn-x (query-mouse-posn ventana)) (+ 110 50)) (> (posn-x (query-mouse-posn ventana)) 110)) (and (< (posn-y (query-mouse-posn ventana)) (+ 780 50)) (> (posn-y (query-mouse-posn ventana)) 780))) (tipoBoton "arriba"))
          ((and (and (< (posn-x (query-mouse-posn ventana)) (+ 110 50)) (> (posn-x (query-mouse-posn ventana)) 110)) (and (< (posn-y (query-mouse-posn ventana)) (+ 900 50)) (> (posn-y (query-mouse-posn ventana)) 900))) (tipoBoton "abajo"))

          ;Botones del 1-6
          ((and (and (< (posn-x (query-mouse-posn ventana)) (+ 468 50)) (> (posn-x (query-mouse-posn ventana)) 468)) (and (< (posn-y (query-mouse-posn ventana)) (+ 750 50)) (> (posn-y (query-mouse-posn ventana)) 750))) (tipoBoton "1"))
          ((and (and (< (posn-x (query-mouse-posn ventana)) (+ 528 50)) (> (posn-x (query-mouse-posn ventana)) 528)) (and (< (posn-y (query-mouse-posn ventana)) (+ 810 50)) (> (posn-y (query-mouse-posn ventana)) 810))) (tipoBoton "2"))
          ((and (and (< (posn-x (query-mouse-posn ventana)) (+ 588 50)) (> (posn-x (query-mouse-posn ventana)) 588)) (and (< (posn-y (query-mouse-posn ventana)) (+ 870 50)) (> (posn-y (query-mouse-posn ventana)) 870))) (tipoBoton "3"))

          ((and (and (< (posn-x (query-mouse-posn ventana)) (+ 588 50)) (> (posn-x (query-mouse-posn ventana)) 588)) (and (< (posn-y (query-mouse-posn ventana)) (+ 750 50)) (> (posn-y (query-mouse-posn ventana)) 750))) (tipoBoton "4"))
          ((and (and (< (posn-x (query-mouse-posn ventana)) (+ 648 50)) (> (posn-x (query-mouse-posn ventana)) 648)) (and (< (posn-y (query-mouse-posn ventana)) (+ 810 50)) (> (posn-y (query-mouse-posn ventana)) 810))) (tipoBoton "5"))
          ((and (and (< (posn-x (query-mouse-posn ventana)) (+ 708 50)) (> (posn-x (query-mouse-posn ventana)) 708)) (and (< (posn-y (query-mouse-posn ventana)) (+ 870 50)) (> (posn-y (query-mouse-posn ventana)) 870))) (tipoBoton "6"))

          (void))
        (clic))))



"""

 Backend

"""

(define (moverCuboInterno matrizOriginal ubicacion direccion)
  (moverCuboInternoAux matrizOriginal matrizOriginal ubicacion direccion))

(define (moverCuboInternoAux matrizOriginal matrizAux ubicacion direccion) ; Movimiento horizontal 
  (cond ( (equal? direccion "izquierda")
          (cond ( (equal? (length matrizAux) 3) ; Ultima cara
                  (cons (append (agregarFilasAnteriores (car matrizAux) ubicacion) (cons (agregarFilaCambiada (car matrizOriginal) ubicacion) (agregarFilasPosteriores (car matrizAux) ubicacion))) (moverCuboInternoAux matrizOriginal (cdr matrizAux) ubicacion direccion)))
                ( (equal? (length matrizAux) 2)
                  (cond ( (equal? ubicacion 1) ; Cara superior
                          (cons (voltearCaraContraReloj (voltearCaraContraReloj (voltearCaraContraReloj (car matrizAux)))) (cons (moverCuboInternoAux matrizOriginal (cdr matrizAux) ubicacion direccion) '())))
                        (else
                         (cons (car matrizAux) (cons (moverCuboInternoAux matrizOriginal (cdr matrizAux) ubicacion direccion) '())))))
                ( (equal? (length matrizAux) 1) ; Cara inferior
                  (cond ( (equal? ubicacion (length (car matrizOriginal))) ; Cara inferior
                          (voltearCaraContraReloj (car matrizAux))
                          )
                        (else
                         (car matrizAux))))
                (else
                 (cons (append (agregarFilasAnteriores (car matrizAux) ubicacion) (cons (agregarFilaCambiada (cadr matrizAux) ubicacion) (agregarFilasPosteriores (car matrizAux) ubicacion))) (moverCuboInternoAux matrizOriginal (cdr matrizAux) ubicacion direccion)))))
        ( (equal? direccion "derecha")
          (girarCuboContraReloj (girarCuboContraReloj (moverCuboInterno (girarCuboContraReloj(girarCuboContraReloj matrizAux)) (+ 1 (- (length (car matrizAux)) ubicacion)) "izquierda")) ))
        ( (equal? direccion "arriba")
          (girarCuboContraReloj (girarCuboContraReloj (girarCuboContraReloj (moverCuboInterno (girarCuboContraReloj matrizAux) (+ 1 (- (length (car matrizAux)) ubicacion)) "izquierda")) )))
        ( (equal? direccion "abajo")
          (girarCuboContraReloj (moverCuboInterno (girarCuboContraReloj (girarCuboContraReloj (girarCuboContraReloj matrizAux))) ubicacion "izquierda")) )))

(define (agregarFilasAnteriores matrizAux num) ; Agrega filas anteriores al cambio
  (cond ( (equal? num 1)
          '())
        (else
         (cons (car matrizAux) (agregarFilasAnteriores (cdr matrizAux) (- num 1))))))

(define (agregarFilaCambiada matrizAux num) ; Agrega la fila que cambia
  (cond ( (equal? num 1)
          (car matrizAux))
        (else
         (agregarFilaCambiada (cdr matrizAux) (- num 1)))))

(define (agregarFilasPosteriores matrizAux num) ; Agrega filas posteriores al cambio
  (cond ( (equal? num 1)
          (cdr matrizAux))
        (else
         (agregarFilasPosteriores (cdr matrizAux) (- num 1)))))


; Funciones para voltear cara en contra de las manecillas del reloj

(define (borrarFila mat)
  (cond ( (null? mat) '())
        (else
         (cons (cdr (car mat))
               (borrarFila (cdr mat))))))

(define (sacarFila mat)
  (cond ( (null? mat)
          '())
        ( else
          (cons (car (car mat)) (sacarFila(cdr mat))))))

(define (voltearCaraContraReloj mat)
  (cond ( (null? (car mat))
          '())
        (else
         (append (voltearCaraContraReloj (borrarFila mat)) (cons (sacarFila mat) '())))))


; Funciones para girar el cubo en contra de las manecillas del reloj

(define (girarCuboContraReloj matrizAux)
  (girarCuboContraRelojAux matrizAux 6))

(define (girarCuboContraRelojAux matrizAux numCara)
  (cond ( (zero? numCara)
          '())
        (else
         (cond ((equal? numCara 6)
                (cons (voltearCaraContraReloj (car matrizAux)) (girarCuboContraRelojAux matrizAux (- numCara 1)) ))
               ((equal? numCara 5)
                (cons (voltearCaraContraReloj (voltearCaraContraReloj (voltearCaraContraReloj (cadr (cddddr matrizAux))))) (girarCuboContraRelojAux matrizAux (- numCara 1)) ))
               ((equal? numCara 4)
                (cons (voltearCaraContraReloj (voltearCaraContraReloj (voltearCaraContraReloj (caddr matrizAux)))) (girarCuboContraRelojAux matrizAux (- numCara 1)) ))
               ((equal? numCara 3)
                (cons (voltearCaraContraReloj (car (cddddr matrizAux))) (girarCuboContraRelojAux matrizAux (- numCara 1)) ))
               ((equal? numCara 2)
                (cons (voltearCaraContraReloj (cadr matrizAux)) (girarCuboContraRelojAux matrizAux (- numCara 1)) ))
               ((equal? numCara 1)
                (cons (voltearCaraContraReloj (voltearCaraContraReloj (voltearCaraContraReloj (cadddr matrizAux)))) (girarCuboContraRelojAux matrizAux (- numCara 1)) ))))))


"""

 Main

"""

(pantalla)
(controles)
(clic)


