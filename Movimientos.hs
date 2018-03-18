 {-# LANGUAGE UnicodeSyntax #-}

module Movimientos where

import TiposDatos
import Parametros
import ObservarTablero
import EditarTablero

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │  Contiene las funciones relativas a los movimientos de las piezas.        │
 │  Éstas se utilizarán para generar todos los estados posibles siguientes   │
 │  en la función generarEstados.                                            │
 │                                                                           │ 
 └───────────────────────────────────────────────────────────────────────────┘
-}

--  Recibe un tipo de pieza y nos devuelve una lista con sus posibles direcciones
direcciones         :: Tipo -> Direcciones
direcciones Alfil   = diagonal
direcciones Torre   = vertical ++ horizontal
direcciones Reina   = vertical ++ horizontal ++ diagonal

-- Recibe un estado, una posicion y una direccion y prolonga la direccion mientras sea posible
prolongarDireccion  :: EstadoDelJuego -> Posicion -> Direccion -> [Posicion]
prolongarDireccion estado (a,b) (i,j)
    | estaFuera  (a+i,b+j) || hayAmigo   estado (a+i,b+j) = []
    | estaDentro (a+i,b+j) && hayEnemigo estado (a+i,b+j) = (a+i,b+j):[]
    | estaDentro (a+i,b+j) = (a+i,b+j):prolongarDireccion estado (a+i,b+j) (i,j)

-- Devuelve una lista de movimientos en varias direcciones hasta que sale fuera
prolongarDirecciones :: EstadoDelJuego -> Posicion -> Direcciones -> [Posicion]
prolongarDirecciones estado (a,b) []     = []
prolongarDirecciones estado (a,b) (x:xs) = prolongarDireccion estado (a,b) x 
                                            ++ prolongarDirecciones estado (a,b) xs
-- Recibe un estado, una pieza y una posicion, y devuelve los movimientos que puede hacer esa pieza
-- en esa posición del tablero dado
movimientos         :: EstadoDelJuego -> Pieza -> Posicion -> [Posicion]
movimientos            estado (Pieza tipo color) pos
    | tipo == Peon    = filter (noHayNadie estado) (filter (esValido estado pos) ([sumPos pos (sentidoJuego color,0)])) ++
                        filter (hayEnemigo estado) (filter (esValido estado pos) (movsAtaquePeon estado pos))
    | tipo == Caballo = filter (esValido estado pos) (map (sumPos pos) ele)
    | tipo == Rey     = filter (esValido estado pos) (map (sumPos pos) (vertical ++ horizontal ++ diagonal))
    | otherwise       = filter (esValido estado pos) (prolongarDirecciones estado pos (direcciones tipo))

-- Recibe un estado del Juego y una posicion y devuleve los cuadrados donde
-- atacaría un peón situado en ese cuadrado
movsAtaquePeon      :: EstadoDelJuego -> Posicion -> [Posicion]
movsAtaquePeon (tablero, color) pos = map (sumPos (sentidoJuego color,0)) 
    (map (sumPos pos) [(0,-1),(0,1)])

-- Recibe un color y devuelve la dirección de avance para los peones
sentidoJuego        :: Color -> Int
sentidoJuego Blanco = -1
sentidoJuego Negro  =  1

-- Recibe un estado y una posicion dice si en una posición hay una pieza 'amiga'
hayAmigo            :: EstadoDelJuego -> Posicion -> Bool
hayAmigo (tablero, color) pos = (estaDentro pos) && (esPosicionColor color tablero pos)

-- Recibe un estado y una posicion dice si en una posición hay una pieza 'enemiga'
hayEnemigo          :: EstadoDelJuego -> Posicion -> Bool
hayEnemigo (tablero, color) pos = (estaDentro pos) && esPosicionColor (colorContrario color) tablero pos

-- Recibe un estado y una posicion y dice si no hay piezas
noHayNadie          :: EstadoDelJuego -> Posicion -> Bool
noHayNadie estado pos = (not (hayAmigo   estado pos)) && 
                        (not (hayEnemigo estado pos))

-- Recibe un estado, una posicion inicial y otra final, y dice si la posicion final está dentro, no contiene piezas amigas y no es la misma que la inicial. 
esValido            :: EstadoDelJuego -> Posicion -> Posicion-> Bool
esValido estado inicio fin = (estaDentro fin) && (not (hayAmigo estado fin)) && not (inicio == fin)

-- Recibe un estado del juego y una posicion, y devuelve una lista de posiciones
generarListaMovs    :: EstadoDelJuego -> Posicion -> [Posicion]
generarListaMovs (tablero, color) posicion = case obtenerCuadrado tablero posicion of
    Libre         -> []
    Ocupado pieza -> (movimientos (tablero, color) pieza posicion)

-- Recibe un estado del juego y una posicion, y devuelve todos los tableros resultantes de mover la pieza que estaba en esa posición
generarMovimientos  :: EstadoDelJuego -> Posicion -> [Tablero]
generarMovimientos (tablero, color) posicion = case obtenerCuadrado tablero posicion of
    Libre         -> []
    Ocupado pieza -> map (moverPieza tablero posicion) (movimientos (tablero, color) pieza posicion)

-- Recibe un estado del juego, y devuelve todos los estados siguientes posibles
generarEstados      :: EstadoDelJuego -> [EstadoDelJuego]
generarEstados (tablero, color) = [(nuevoEstado, colorContrario color)| pos<-(posicionesColor color tablero), nuevoEstado <- generarMovimientos (tablero, color) pos]
