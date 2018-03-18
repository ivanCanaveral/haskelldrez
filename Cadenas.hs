{-# LANGUAGE UnicodeSyntax #-}

module Cadenas where

import Parametros

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │   Contine cadenas de texto que se utilizarán para mostrar el tablero      │
 │   por pantalla.                                                           │
 │                                                                           │
 └───────────────────────────────────────────────────────────────────────────┘
-}

espacios             :: String
espacios             = concat (take (espaciado) (repeat " "))

cabecera            :: String
cabecera             = "\n" ++ concat (take (espaciado-3) (repeat " ")) ++
                    " ┌" ++ concat (take 21 (repeat "─")) ++ "┐ "    ++
                    "\n" ++ concat (take (espaciado-2) (repeat " ")) ++
                    "│" ++"    λ Haskelldrez    " ++ "│"             ++
                    "\n" ++ concat (take (espaciado-3) (repeat " ")) ++
                    " └" ++ concat (take 21 (repeat "─")) ++ "┘ "    ++ "\n"

primeraLineaTablero :: String
primeraLineaTablero = espacios ++ "╔══════════════════╗" 

ultimaLineaTablero  :: String
ultimaLineaTablero  = espacios ++ "╚══════════════════╝"

letrasTablero       :: String
letrasTablero       = espacios ++ "  a b c d e f g h   "

turno               :: String
turno               = "\n" ++ concat (take (espaciado-2) (repeat " ")) 
                    ++ " Es turno del color :"

ganador             :: String
ganador             = espacios ++ " ☺ ¡¡ Has Ganado !! " ++ "\n" ++ "\n"

perdedor            :: String
perdedor            = espacios ++ " ☹ ...Has Perdido..." ++ "\n" ++ "\n"

bienvenida          :: String
bienvenida          = espacios ++ "    Bienvenido a"   ++ "\n" ++ "\n" ++
                      espacios ++ cabecera  ++ "\n" ++
                      espacios ++ " ♜ ♞ ♝ ♛  ♕ ♗ ♘ ♖"  ++ "\n" ++ "\n" ++
                      "\n" ++ "\n" ++
                      "                       Pulsa intro para continuar"
                      ++ "\n" ++ "\n" ++
                      "\n" ++ "\n"

finDelJuego             :: String
finDelJuego             = "\n" ++ "\n" ++ "\n" ++ "\n" ++ "\n" ++ "\n" ++
                          "\n" ++ "\n" ++ "\n" ++ "\n" ++ "\n" ++ "\n" ++
                          "                     ♜ ♞ ♝ ♛ GAME OVER ♕ ♗ ♘ ♖ " ++
                          "\n" ++ "\n" ++ "\n"++"\n" ++ "\n" ++ "\n" ++
                          "\n" ++ "\n" ++ "\n" ++ "\n"
