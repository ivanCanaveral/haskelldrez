{-# LANGUAGE UnicodeSyntax #-}
module ArbolJuego where

import TiposDatos
import Movimientos
import Puntuacion

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │  Contine funciones necesarias para el manejo del árbol de juego.          │
 │                                                                           │
 │                                                                           │
 └───────────────────────────────────────────────────────────────────────────┘
-}

-- Despliega el árbol de juego
desplegarArbol :: Int -> EstadoDelJuego -> ArbolDeJuego
desplegarArbol 0 estado = Arbol estado []
desplegarArbol n estado
    | esEstadoFinal estado = Arbol estado []
    | otherwise            = Arbol estado (map (desplegarArbol (n-1)) (generarEstados estado))

-- Dado un árbol de juego, devulevo el estado raíz
raiz :: ArbolDeJuego -> EstadoDelJuego
raiz (Arbol estado xs) = estado

-- Dado un árbol de juego, devuelve la lista de sus hijos
hijos  :: ArbolDeJuego -> [ArbolDeJuego]
hijos  (Arbol estado hijos) = hijos

esHoja :: ArbolDeJuego -> Bool
esHoja arbol = hijos arbol == []
