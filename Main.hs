{-# LANGUAGE UnicodeSyntax #-}

import EntradaSalida
import Cadenas
import Texto
import Tableros
import Data.Time

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │  Módulo que contiene la función principal del juego.                      │
 │                                                                           │
 │                                                                           │
 └───────────────────────────────────────────────────────────────────────────┘
-}

main =  do
        limpiar
        putStrLn bienvenida
        getLine
        limpiar
        putStrLn instrucciones01
        getLine
        putStrLn instrucciones02
        getLine
        putStrLn instrucciones03
        getLine
        a <- getCurrentTime
        pintarEstado estadoInicial
        jugar estadoInicial
        b <- getCurrentTime
        putStr   "Duración de la partida  :  " 
        putStrLn (show (diffUTCTime b a))
