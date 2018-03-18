 {-# LANGUAGE UnicodeSyntax #-}
module Tableros where

import TiposDatos

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │  Continene varios tableros y estados de juego que han sido utilizados     │
 │  durante el desarrollo del tablero.                                       │
 │                                                                           │
 └───────────────────────────────────────────────────────────────────────────┘
-}

estadoInicial     = (tableroInicial, Blanco)
estadoGanado      = (tableroGanado , Blanco)
estadoReyCaballo  = (tableroReyCaballo, Blanco)
estadoAlejandro   = (tableroAlejandro, Blanco)

tableroVacio   :: Tablero
tableroVacio   = Tablero [[Libre|_<-[1..8]]|_<-[1..8]]

tableroInicial :: Tablero
tableroInicial = Tablero [[Ocupado(Pieza Torre Negro),Ocupado (Pieza Caballo Negro),
                   Ocupado (Pieza Alfil Negro), Ocupado (Pieza Reina Negro), Ocupado(Pieza Rey Negro),
                   Ocupado (Pieza Alfil Negro),Ocupado (Pieza Caballo Negro),Ocupado(Pieza Torre Negro)],
                  [Ocupado (Pieza Peon Negro),Ocupado (Pieza Peon Negro),Ocupado (Pieza Peon Negro),
                   Ocupado (Pieza Peon Negro),Ocupado (Pieza Peon Negro),Ocupado (Pieza Peon Negro),
                   Ocupado (Pieza Peon Negro),Ocupado (Pieza Peon Negro)],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Ocupado (Pieza Peon Blanco),Ocupado (Pieza Peon Blanco),Ocupado (Pieza Peon Blanco),
                   Ocupado (Pieza Peon Blanco),Ocupado (Pieza Peon Blanco),Ocupado (Pieza Peon Blanco),
                   Ocupado (Pieza Peon Blanco),Ocupado (Pieza Peon Blanco)],
                  [Ocupado(Pieza Torre Blanco),Ocupado (Pieza Caballo Blanco),Ocupado (Pieza Alfil Blanco),
                   Ocupado (Pieza Reina Blanco), Ocupado(Pieza Rey Blanco), Ocupado (Pieza Alfil Blanco),
                   Ocupado (Pieza Caballo Blanco),Ocupado(Pieza Torre Blanco)]]

tableroReyCaballo :: Tablero
tableroReyCaballo = Tablero [[Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Ocupado(Pieza Rey Negro),Libre,Libre],
                  [Libre,Ocupado(Pieza Caballo Negro),Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Ocupado(Pieza Rey Blanco),Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Ocupado(Pieza Caballo Blanco),Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre]]

tableroGanado :: Tablero
tableroGanado = Tablero [[Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Ocupado(Pieza Peon Negro),Libre,Libre],
                  [Libre,Ocupado(Pieza Caballo Negro),Libre,Libre,Libre,Ocupado(Pieza Peon Blanco),Ocupado(Pieza Peon Blanco),Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Ocupado(Pieza Rey Blanco),Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Ocupado(Pieza Peon Blanco),Libre,Libre,Libre,Ocupado(Pieza Caballo Blanco),Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre]]

tableroCualquiera :: Tablero
tableroCualquiera = Tablero [[Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Ocupado (Pieza Reina Negro),Libre,Libre,Ocupado (Pieza Alfil Negro),Libre,Libre],
                  [Ocupado (Pieza Alfil Negro),Libre,Ocupado (Pieza Peon Blanco),Libre,Libre,Ocupado(Pieza Rey Negro),Libre,Libre],
                  [Libre,Ocupado(Pieza Caballo Negro),Libre,Libre,Libre,Libre,Libre,Libre],
                  [Ocupado (Pieza Caballo Blanco),Libre,Libre,Ocupado (Pieza Peon Negro),Libre,Libre,Libre,Libre],
                  [Libre,Libre,Ocupado(Pieza Rey Blanco),Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Ocupado(Pieza Caballo Blanco),Libre],
                  [Libre,Ocupado(Pieza Torre Blanco),Libre,Ocupado(Pieza Torre Blanco),Libre,Libre,Libre,Libre]]

tableroPrueba :: Tablero
tableroPrueba = Tablero [[Ocupado(Pieza Torre Negro),Ocupado (Pieza Caballo Negro),
                   Ocupado (Pieza Alfil Negro), Ocupado (Pieza Reina Negro), Ocupado(Pieza Rey Negro),
                   Ocupado (Pieza Alfil Negro),Ocupado (Pieza Caballo Negro),Ocupado(Pieza Torre Negro)],
                  [Ocupado (Pieza Peon Negro),Ocupado (Pieza Peon Negro),Ocupado (Pieza Peon Negro),
                   Ocupado (Pieza Peon Negro),Ocupado (Pieza Peon Negro),Ocupado (Pieza Peon Negro),
                   Ocupado (Pieza Peon Negro),Ocupado (Pieza Peon Negro)],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Ocupado(Pieza Torre Blanco),Ocupado (Pieza Caballo Blanco),Ocupado (Pieza Alfil Blanco),
                   Ocupado (Pieza Reina Blanco), Ocupado(Pieza Rey Blanco), Ocupado (Pieza Alfil Blanco),
                   Ocupado (Pieza Caballo Blanco),Ocupado(Pieza Torre Blanco)]]

tableroAlejandro :: Tablero
tableroAlejandro = Tablero [[Libre,Libre,Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Ocupado(Pieza Rey Negro),Libre,Libre,Ocupado(Pieza Torre Negro),Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Ocupado(Pieza Rey Negro),Libre,Libre],
                  [Libre,Ocupado(Pieza Caballo Negro),Libre,Libre,Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Ocupado(Pieza Peon Blanco),Libre],
                  [Libre,Ocupado(Pieza Peon Negro),Libre,Ocupado(Pieza Rey Blanco),Libre,Libre,Libre,Libre],
                  [Libre,Libre,Libre,Libre,Libre,Libre,Ocupado(Pieza Caballo Blanco),Libre],
                  [Libre,Ocupado(Pieza Torre Blanco),Libre,Libre,Libre,Ocupado(Pieza Rey Blanco),Libre,Libre]]
