 {-# LANGUAGE UnicodeSyntax #-}

module Puntuacion where

import TiposDatos
import Tableros
import Parametros
import ObservarTablero

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │  Continene funciones necesarias para evaluar cómo de favorable o desfa-   │
 │  vorable es un tablero para cada jugador.                                 │
 │                                                                           │
 └───────────────────────────────────────────────────────────────────────────┘
-}

-- Recibe un Tipo de pieza y devuelve su valor
valor           :: Tipo -> Int
valor Peon      = 1
valor Alfil     = 3
valor Caballo   = 3
valor Torre     = 5 
valor Reina     = 9
valor Rey       = infinito


-- Suma los puntos de un cuadrado al marcador
sumarPuntos     :: Marcador -> Cuadrado -> Marcador
sumarPuntos (puntosBlanco, puntosNegro) Libre = (puntosBlanco, puntosNegro)
sumarPuntos (puntosBlanco, puntosNegro) (Ocupado (Pieza tipo color))
    | color == Blanco = (puntosBlanco + valor tipo, puntosNegro)
    | otherwise       = (puntosBlanco, puntosNegro + valor tipo)

-- Establece un marcador de las piezas que hay en el tablero
sumarTablero    :: Tablero -> Marcador
sumarTablero (Tablero xss) = foldl sumarPuntos (0,0) $ concat xss

-- Da un entero que nos da información sobre quién tiene ventaja
-- gana blanco > 0   gana negro < 0
balanceJuego    :: Tablero -> Int
balanceJuego tablero = puntosBlanco - puntosNegro
    where (puntosBlanco, puntosNegro) = sumarTablero tablero

-- Función que devuelve el marcador de un estado del juego
marcador        :: EstadoDelJuego -> Marcador
marcador estado = sumarTablero (fst estado)

-- Función que devuelve el balance de un estado del juego
balanceEstado   :: EstadoDelJuego -> Int
balanceEstado   estado  = balanceJuego (fst estado)

-- Recibe un estado de juego y nos dice si el juego ha acabado o no
esEstadoFinal :: EstadoDelJuego -> Bool
esEstadoFinal estado = balance < -limite || balance > limite
    where balance = balanceEstado estado

-- Recibe un estado de juego y nos dice si es estado ganador para el color al que le toque
esEstadoGanador :: EstadoDelJuego -> Bool
esEstadoGanador (tablero, Blanco) = balanceEstado (tablero, Blanco) > limite
esEstadoGanador (tablero, Negro ) = balanceEstado (tablero, Negro ) < limite
