 {-# LANGUAGE UnicodeSyntax #-}

module ObservarTablero where

import TiposDatos

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │  Continene funciones que se usan para obtener información sobre el        │
 │  tablero y sus piezas.                                                    │
 │                                                                           │
 └───────────────────────────────────────────────────────────────────────────┘
-}

-- Recibe una pieza y devuelve su tipo
piezaTipo       :: Pieza -> Tipo
piezaTipo  (Pieza tipo color) = tipo

-- Recibe una pieza y devuelve su color
piezaColor      :: Pieza -> Color
piezaColor (Pieza tipo color) = color

-- Crea un cuadrado Vacio
cuadradoLibre   :: Cuadrado
cuadradoLibre   =  Libre

-- Recibe un cuadrado y nos devuelve la pieza que lo ocupa (si existe)
cuadradoPieza   :: Cuadrado -> Maybe Pieza
cuadradoPieza   Libre           = Nothing
cuadradoPieza   (Ocupado pieza) = Just pieza

-- Recibe un tablero y una posicion y devuelve un cuadrado
obtenerCuadrado :: Tablero -> Posicion -> Cuadrado
obtenerCuadrado (Tablero xxs) pos = xxs!!(fst pos)!!(snd pos)

-- Recibe un tablero y una posicion y nos dice si está libre un cuadrado
estaLibre       :: Tablero -> Posicion -> Bool
estaLibre tablero pos = obtenerCuadrado tablero pos == Libre

-- Da el color contrario
colorContrario  :: Color -> Color
colorContrario  Blanco = Negro
colorContrario  Negro  = Blanco

-- Recibe una posición y nos dice si está fuera del tablero
estaFuera       :: Posicion -> Bool
estaFuera (i,j) = i < 0 || j < 0 || i > 7  || j > 7

-- Recibe una posición y nos dice si está dentro del tablero
estaDentro      :: Posicion -> Bool
estaDentro      = not.estaFuera

-- Recibe un color y un cuadrado y nos dice si en ese cuadrado hay una pieza de ese color
esColor         :: Color -> Cuadrado -> Bool
esColor color   Libre                             = False
esColor color   (Ocupado (Pieza tipo colorPieza)) = color == colorPieza

-- Recibe un color, un tablero y una posición, y nos dice si en esa posición hay una pieza del color
esPosicionColor :: Color -> Tablero -> Posicion -> Bool
esPosicionColor color tablero posicion = esColor color (obtenerCuadrado tablero posicion)

-- Recibe un color y un tablero y devuelve una lista de posiciones en las que hay piezas del color
posicionesColor :: Color -> Tablero -> [Posicion]
posicionesColor color tablero = [(i,j)| i<-[0..7], j<-[0..7], esColor color (obtenerCuadrado tablero (i,j))]

-- Suma Posiciones
sumPos :: Posicion -> Posicion -> Posicion
sumPos (a,b) (c,d) = (a+c,b+d)

-- Multiplica Posiciones por un entero
multPos :: Int -> Posicion -> Posicion
multPos n (a,b) = (n*a,n*b)

-- Recibe un estado y devuelve el tablero
obtenerTablero :: EstadoDelJuego -> Tablero
obtenerTablero (tablero,color) = tablero

-- Recibe un estado y devuelve el color del turno
obtenerColor   :: EstadoDelJuego -> Color
obtenerColor   (tablero,color) = color
