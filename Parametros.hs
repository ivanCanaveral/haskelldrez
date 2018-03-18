 {-# LANGUAGE UnicodeSyntax #-}
module Parametros where

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │  Continene algunas constantes que se utilizarán a lo largo del juego.     │
 │  Será de especial importancia la constante profundidad, que nos indica    │
 │  la profundidad hasta la que se generará el arbol de juego.               │
 │                                                                           │
 └───────────────────────────────────────────────────────────────────────────┘
-}

infinito :: Int
infinito = 1000

-- si pasa el limite ganas
limite :: Int
limite = 500

-- profundidad del árbol de juego
profundidad :: Int
profundidad = 3

-- espaciado del tablero en la terminal
espaciado :: Int
espaciado = 26

vertical,horizontal,diagonal,ele :: [(Int,Int)]
vertical   = [(1,0),(-1,0)]
horizontal = [(0,1),(0,-1)]
diagonal   = [(1,1),(-1,1),(1,-1),(-1,-1)]
ele        = [(2,1),(2,-1),(-2,1),(-2,-1),
              (1,2),(1,-2),(-1,2),(-1,-2)]
