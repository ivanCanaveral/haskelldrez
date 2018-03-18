 {-# LANGUAGE UnicodeSyntax #-}
module EntradaSalida where

import JuegoHumano
import JuegoCPU
import Tableros
import Parametros
import Puntuacion
import TiposDatos
import Cadenas
import Data.Time

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │  En este módulo tenemos todas las funciones relativas a la parte          │
 │  de entradaSalida del programa, que se utilizarán en el módulo Main       │
 │                                                                           │
 └───────────────────────────────────────────────────────────────────────────┘
-}


limpiar         :: IO ()
limpiar = putStr "\ESC[2J"

pintarTablero   :: Tablero -> IO ()
pintarTablero tablero = do
    putStr cabecera
    print tablero

pintarEstado    :: EstadoDelJuego -> IO ()
pintarEstado (tablero,color) = do
    limpiar
    pintarTablero tablero
    if (not (esEstadoFinal (tablero,color)))
        then do
             putStrLn (turno ++ (show color) ++ "\n" ++ "\n")
        else do
             putStrLn (mensajeFinal (tablero,color))

mensajeFinal :: EstadoDelJuego -> String
mensajeFinal (tablero,color)
    | esEstadoGanador(tablero,color) = ganador
    | otherwise                      = perdedor

pedirMovimiento :: EstadoDelJuego -> IO String
pedirMovimiento estado = do
    putStr "Escribe tu jugada : "
    jugada <- getLine
    if (esInputCojonudo estado jugada)
        then do
            return jugada
        else do
            pedirMovimiento estado

juegaHumano     :: EstadoDelJuego -> IO EstadoDelJuego
juegaHumano estado = do
    jugada <- pedirMovimiento estado
    return (movimientoHumano estado jugada)

juegaCPU        :: EstadoDelJuego -> IO EstadoDelJuego
juegaCPU estado = do
    putStr "Pulsa Intro para que juegue tu oponente : "
    getLine
    return (movimientoCPU estado)

jugada          :: EstadoDelJuego -> IO EstadoDelJuego
jugada estado   = do
    estado <- juegaHumano estado
    pintarEstado estado
    estado <- juegaCPU estado
    putStr "Pensando... "
    pintarEstado estado
    return estado

jugar           :: EstadoDelJuego -> IO ()
jugar estado    = do
    if (not (esEstadoFinal estado))
        then do
            estado <- jugada estado
            jugar estado
    else
        putStrLn finDelJuego

iniciarJuego    :: IO ()
iniciarJuego = do
    limpiar
