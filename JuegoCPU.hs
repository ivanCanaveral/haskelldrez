{-# LANGUAGE UnicodeSyntax #-}

module JuegoCPU where

import TiposDatos
import Movimientos
import Puntuacion
import Parametros
import ArbolJuego

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │  Contiene las funciones necesarias para que se genere un movimiento       │
 │  "bueno" a partir de un estado de juego.                                  │
 │                                                                           │
 └───────────────────────────────────────────────────────────────────────────┘
-}

-- Recibe un árbol de juego y devuelve el mejor valor posible para el árbol
minimax :: ArbolDeJuego -> Int
minimax (Arbol estado []) = balanceEstado estado
minimax (Arbol (_,Blanco) xs) = maximum (map minimax xs)
minimax (Arbol (_,Negro ) xs) = minimum (map minimax xs)

-- Recibe un Arbol de juego y devuelve un tupla con el Estado raíz y el mejor valor posible del arbol
evaluarArbol :: ArbolDeJuego -> (Int, EstadoDelJuego)
evaluarArbol arbol = (minimax arbol, raiz arbol)

-- funcion que devuelve el mejor movimiento elegido entre una lista de tuplas (Valor, EstadoDelJuego)
devolverMejor :: FuncionComparadora -> [(Int, EstadoDelJuego)] -> (Int,EstadoDelJuego)
devolverMejor _ [par] = par
devolverMejor comparador ((valor1,estado1):xs)
    | esEstadoGanador estado1 = (valor1,estado1)
    | otherwise = if comparador valor1 valor2 then (valor1,estado1) else (valor2,estado2)
      where (valor2,estado2) = devolverMejor comparador xs

-- Recibe un color y devuelve una función comparadora
elegirComparadoraMinimax :: Color -> FuncionComparadora
elegirComparadoraMinimax Blanco = (>)
elegirComparadoraMinimax Negro  = (<)

-- Realiza el mejor movimiento devuelto por el algoritmo del minimax
movimientoCPU :: EstadoDelJuego -> EstadoDelJuego
movimientoCPU (tablero,color)
    | esHoja arbol = (tablero,color)
    | otherwise    = snd (devolverMejor (elegirComparadoraMinimax color) siguientes)
      where arbol  = desplegarArbol profundidad (tablero,color)
            siguientes = map evaluarArbol (hijos arbol)

{-
Minimax visto en clase. No encaja con esta definicion de estado de juego
minimax :: Ord b => Int -> (EstadoDelJuego->[EstadoDelJuego])->(EstadoDelJuego->b)->EstadoDelJuego->b
minimax prof generarEstados balanceEstado estado
    | prof == 0 || esEstadoFinal estado = balanceEstado estado
    | otherwise = maximum (map (minimax (prof-1) generarEstados balanceEstado) siguientes)
      where siguientes = generarEstados estado
-}
