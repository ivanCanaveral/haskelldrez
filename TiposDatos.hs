{-# LANGUAGE UnicodeSyntax #-}
module TiposDatos where

import Parametros
import Cadenas

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │  Contiene las deifinidiones de los tipos de datos, los renombramientos,   │
 │  y las instancias que utilizaremos en el resto del código.                │
 │                                                                           │
 └───────────────────────────────────────────────────────────────────────────┘
-}

--type
type Posicion           = (Int,Int)
type EstadoDelJuego     = (Tablero, Color)
type Direccion          = (Int,Int)
type Direcciones        = [(Int, Int)]
type Marcador           = (Int,Int)
type FuncionComparadora = Int -> Int -> Bool
type Movimiento         = EstadoDelJuego -> EstadoDelJuego
type MovimientoHumano   = (Posicion,Posicion)

--data
data Color        = Blanco | Negro
    deriving Eq
data Tipo         = Peon | Alfil | Caballo | Torre | Reina | Rey
    deriving Eq
data Pieza        = Pieza Tipo Color         -- Constructor : Pieza _ _
    deriving Eq
data Cuadrado     = Libre | Ocupado Pieza    -- Constructor : Libre | Ocupado _
    deriving Eq
data Tablero      = Tablero [[Cuadrado]]
    deriving Eq
data ArbolDeJuego = Arbol EstadoDelJuego [ArbolDeJuego]
    deriving (Eq, Show)

--instance
instance Show Color where
    --(show)
    show Blanco = "■"
    show Negro  = "□"

instance Show Cuadrado where
    --(show)
    show  Libre                           = "▢"
    show (Ocupado (Pieza Peon Blanco))    = "♟"
    show (Ocupado (Pieza Peon Negro))     = "♙"
    show (Ocupado (Pieza Alfil Blanco))   = "♝"
    show (Ocupado (Pieza Alfil Negro))    = "♗"
    show (Ocupado (Pieza Torre Blanco))   = "♜"
    show (Ocupado (Pieza Torre Negro))    = "♖"
    show (Ocupado (Pieza Caballo Blanco)) = "♞"
    show (Ocupado (Pieza Caballo Negro))  = "♘"
    show (Ocupado (Pieza Reina Blanco))   = "♛"
    show (Ocupado (Pieza Reina Negro))    = "♕"
    show (Ocupado (Pieza Rey Blanco))     = "♚"
    show (Ocupado (Pieza Rey Negro))      = "♔"

instance Show Tablero where
    show (Tablero xss) =  "\n" ++ primeraLineaTablero ++ 
                          "\n" ++ ponerTablero xss 8  
                               ++ ultimaLineaTablero  ++
                          "\n" ++ letrasTablero       ++
                          "\n"


--  Funciones para dibujar
-- ═════════════════════════════════════════════════════════════════════════════════════════════════
ponerCuadrado :: Cuadrado -> String
ponerCuadrado x = show x

ponerLinea :: [Cuadrado] -> String
ponerLinea [] = []
ponerLinea (x:xs) = show x ++ " " ++ ponerLinea xs

-- Pinta cada linea del Tablero
ponerTablero :: [[Cuadrado]] -> Int -> String
ponerTablero [] n = []
ponerTablero xs 0 = []
ponerTablero (xs:xss) n = concat (take (espaciado - 2) (repeat " "))  ++
                          show (n) ++  " ║ " ++ ponerLinea xs ++ " ║" ++
                          "\n"     ++  ponerTablero xss (n-1)
