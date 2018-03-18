{-# LANGUAGE UnicodeSyntax #-}

module Texto where

{-
 ┌───────────────────────────────────────────────────────────────────────────┐
 │                                                                           │
 │  Continene el texto que se mostrará al comienzo del juego.                │
 │                                                                           │
 │                                                                           │
 └───────────────────────────────────────────────────────────────────────────┘
-}

instrucciones01     :: String
instrucciones01     = "         ¡Bienvenido a Haskelldrez!" ++ "\n" ++ "\n" ++
                      "         Haskelldrez no es un juego de ajedrez usual, es  "  ++ "\n" ++
                      "         un juego de ajedrez para auténticos hombres, y   "  ++ "\n" ++
                      "         por eso tiene algunas reglas propias. Por ejemplo"  ++ "\n" ++
                      "         nadie nos avisará caundo estemos en una situación"  ++ "\n" ++
                      "         de jaque, así que... ¡deberás estar alerta!      "  ++ "\n" ++ "\n" ++
                      "         Tampoco vas a poder enrocarte, que esconderse es "  ++ "\n" ++
                      "         de cobardes... "                                    ++ "\n" ++ "\n" ++
                      "         Por último, los peones aquí tienen las patitas un"  ++ "\n" ++
                      "         poco más cortas de lo habitual, así que eso de   "  ++ "\n" ++
                      "         avanzar dos posiciones al comenzar el juego no va"  ++ "\n" ++
                      "         con ellos."                                         ++ "\n" ++ "\n" ++
                      "         Pulsa Intro si quieres saber más..."                ++ "\n" ++ "\n"

instrucciones02     :: String
instrucciones02     = "         ¡Muy bien! Como veo que estás interesado, te voy "  ++ "\n" ++
                      "         a contar cómo introducir los movimientos. Cada   "  ++ "\n" ++
                      "         vez que te toque te pediré que escribas tu jugada"  ++ "\n" ++
                      "         Para que me entere bien, deberá tener el siguien-"  ++ "\n" ++
                      "         te formato: "                                       ++ "\n" ++ "\n" ++
                      "                             a2:b2                        "  ++ "\n" ++ "\n" ++
                      "         donde lo que hay a la izquierda de los dos puntos"  ++ "\n" ++
                      "         es la posición de lo que queremos mover, y a la  "  ++ "\n" ++
                      "         derecha, dónde lo queremos mover."                  ++ "\n" ++ "\n" ++
                      "         Si no has seguido el formato, o la jugada que    "  ++ "\n" ++
                      "         quieres hacer no es válida, volveré a pedirte una"  ++ "\n" ++
                      "         jugada."                                            ++ "\n" ++ "\n" ++ "\n" ++
                      "         Y venga, pulsa Intro para que esto empiece.      "  ++ "\n" ++ "\n"

instrucciones03     :: String
instrucciones03     = "\n" ++ "\n" ++ "\n" ++ "\n" ++
                      "         ¡Ah! Y una última cosa...                        "  ++ "\n" ++ "\n" ++
                      "         Si en algún momento te das cuenta de que no eres "  ++ "\n" ++
                      "         lo suficientemente hombre para seguir jugando a  "  ++ "\n" ++
                      "         Haskelldrez, siempre puedes huir pulsando        "  ++ "\n" ++ "\n" ++
                      "                             Ctrl + C                     "  ++ "\n" ++
                      "\n" ++ "\n" ++
                      "               ¡Dejémonos ya de rollos y juguemos!"          ++ "\n" ++ "\n" ++
                      "\n" ++ "\n" ++ "\n" ++ "\n" ++ "\n" ++ "\n"
