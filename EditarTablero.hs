 {-# LANGUAGE UnicodeSyntax #-}

module EditarTablero where

import TiposDatos
import ObservarTablero

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │  Continene funciones que se usan para manipular las piezas de un          │
 │  tablero.                                                                 │
 │                                                                           │
 └───────────────────────────────────────────────────────────────────────────┘
-}

-- Recibe un tablero una posición y un cuadrado, y pone el cuadrado en la posición dada del tablero
cambiarTablero :: Tablero -> Posicion -> Cuadrado -> Tablero
cambiarTablero (Tablero xss) posicion cuadrado = Tablero (cambiarMatriz posicion cuadrado xss)

-- Recibe un tablero y una posición y devuelve un tablero con un hueco libre en la posición dada
quitarPieza :: Tablero -> Posicion -> Tablero
quitarPieza tablero posicion = cambiarTablero tablero posicion Libre

-- Recibe un tablero, una posición y una pieza y devuelve un tablero con la pieza en la posicion
ponerPieza :: Tablero -> Posicion -> Pieza -> Tablero
ponerPieza tablero posicion pieza = cambiarTablero tablero posicion (Ocupado pieza) 

-- Recibe un tablero y dos posiciones, y devuelve el tablero resultante de mover lo que habia en la 
-- primera posición hasta la segunda posición
moverPieza :: Tablero -> Posicion -> Posicion -> Tablero
moverPieza tablero pos1 pos2 = quitarPieza (cambiarTablero tablero pos2 (obtenerCuadrado tablero pos1)) pos1 

moverPieza' :: Tablero -> MovimientoHumano -> Tablero
moverPieza' tablero (pos1, pos2) = quitarPieza (cambiarTablero tablero pos2 (obtenerCuadrado tablero pos1)) pos1

-- Cambia el elemento i-ésimo de una lista
cambiarLista :: [a] -> Int -> (a -> a) -> [a]
cambiarLista [] _ _     = []
cambiarLista (x:xs) 0 f = (f x):xs
cambiarLista (x:xs) n f = x:cambiarLista xs (n-1) f

-- Cambia un elemento de una matriz
cambiarMatriz:: Posicion -> a -> [[a]] -> [[a]]
cambiarMatriz (i,j) a m = cambiarLista m i (\lambda->cambiarLista lambda j (const a))

-- Aplica una lista de funciones a un elemento
aplicar :: [a -> a] -> a -> a
aplicar [] x   = x
aplicar (f:fs) x = aplicar fs (f x)
