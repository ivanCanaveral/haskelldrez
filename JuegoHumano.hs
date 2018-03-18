{-# LANGUAGE UnicodeSyntax #-}

module JuegoHumano where

import TiposDatos
import Movimientos
import ObservarTablero
import EditarTablero

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │  Este módulo contiene todas las funciones necesarias para procesar la     │
 │  entrada pasada por el usuario y mover las piezas en consecuencia.        │
 │                                                                           │
 └───────────────────────────────────────────────────────────────────────────┘
-}

-- Recibe un estado de juego y una posición, y nos dice si ese cuadrado contiene una pieza que
-- puede ser movida este turno.
esPosInicialValida       :: EstadoDelJuego -> MovimientoHumano -> Bool
esPosInicialValida (tab,col) (pos1,pos2) = estaDentro pos1 && esPosicionColor col tab pos1

-- Recibe un estado y un movimiento humano y nos dice si la posición final es válida
esPosFinalValida         :: EstadoDelJuego -> MovimientoHumano -> Bool
esPosFinalValida (tab,col) (pos1,pos2) = elem pos2 (generarListaMovs (tab,col) pos1)

-- Recibe un estado del juego y un movimiento humano y dice si es válido
esMovimientoHumanoValido :: EstadoDelJuego -> MovimientoHumano -> Bool
esMovimientoHumanoValido est mov = esPosInicialValida est mov && esPosFinalValida est mov

-- Pasa un string de la forma a1:h5 a MovimientoHumano
toMovimientoHumano       :: String -> MovimientoHumano
toMovimientoHumano (letra1:numero1:puntos:letra2:numero2:[]) =
                                (toPosicion (letra1:numero1:[]), toPosicion(letra2:numero2:[]))

-- Recibe un String y dice si es válido o no
esInputValido            :: String -> Bool
esInputValido (a:b:c:d:e:[]) =    esLetraValida a && esNumeroValido b && esDosPuntos c
                               && esLetraValida d && esNumeroValido e
esInputValido _ = False

-- toma los un string de la forma a1 y devuelve una posición
toPosicion               :: String -> Posicion
toPosicion (letra:numero:[]) = (toNumero numero, toNumero letra)

-- Toma un estado de Juego y un input y dice si es un input cojonudo
esInputCojonudo          :: EstadoDelJuego -> String -> Bool
esInputCojonudo estado input = esInputValido input
                               && esMovimientoHumanoValido estado (toMovimientoHumano input)

-- Recibe un estado de juego y un Input y devuelve un estado de juego
movimientoHumano         :: EstadoDelJuego -> String -> EstadoDelJuego
movimientoHumano (tablero,color) input
    | esInputCojonudo (tablero,color) input = (moverPieza' tablero (toMovimientoHumano input), colorContrario color)
    | otherwise = error "eso que has hecho no vale"

esLetraValida            :: Char -> Bool
esLetraValida x  = if (x=='a'||x=='b'||x=='c'||x=='d'||
                      x=='e'||x=='f'||x=='g'||x=='h'  ) then True else False

esNumeroValido           :: Char -> Bool
esNumeroValido x = if (x=='1'||x=='2'||x=='3'||x=='4'||
                       x=='5'||x=='6'||x=='7'||x=='8'  ) then True else False

esDosPuntos              :: Char -> Bool
esDosPuntos ':'  = True
esDosPuntos  _   = False

-- Pasa de letras a valores numéricos
toNumero :: Char -> Int
toNumero x
    | x=='a' = 0
    | x=='b' = 1
    | x=='c' = 2
    | x=='d' = 3
    | x=='e' = 4
    | x=='f' = 5
    | x=='g' = 6
    | x=='h' = 7
    | x=='1' = 7-0
    | x=='2' = 7-1
    | x=='3' = 7-2
    | x=='4' = 7-3
    | x=='5' = 7-4
    | x=='6' = 7-5
    | x=='7' = 7-6
    | x=='8' = 7-7
    | otherwise = 444
