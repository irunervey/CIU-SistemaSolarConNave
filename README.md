# CIU-SistemaSolarConNave
Práctica 4 de CIU

## Autoría.
El trabajo fue realizado por Iru Nervey Navarro Alejo.

## Descripción.
La práctica consiste en una mejora de la practica anterior, en la cual se desarrolló un sistema planetario, añadiéndole una nave trabajar con la cámara de processing.

## Controles.
- Los movimientos de la nave estan controlados por 'w', 's', 'a', 'd', la barra espaciadora y la tecla SHIFT. Cada par de teclas controlan el eje Z, X e Y respectivamente.
- Para el control de la vista de la nave se utilizan las flechas.
- Se puede reiniciar la posición de la nave con ‘r’, la vista con ‘z’ y la velocidad con ‘x’.
- Para alternar entre el modo cámara y nave se utiliza la tecla ‘c’.
- Para salir o entrar en el modo menú se utiliza la tecla ‘ESC’.
- Para pausar los planetas se utiliza la tecla 'p'.

## Implementación.
El movimiento de la nave se realiza en los ejes sin tener en cuenta a donde apunte la vista de la nave. Se puede utilizar el panel que indica las velocidades de los ejes para orientarse o pulsar la tecla ‘z’. La velocidad aumenta cuanto mayor tiempo tengas pulsada la tecla hasta un máximo de 10 o un mínimo de -10 y permanece a la velocidad a la que sueltes la tecla hasta que pulses la tecla contraria o reinicies la velocidad. Con esto se quería imitar el efecto de no rozamiento en el espacio.

## Herramientas utilizadas.
Para crear el gif que muestro a continuación utilize la herramienta de gif-animation que puedes encontrar en este [enlace](https://github.com/extrapixel/gif-animation)

## Resultado.
![](https://github.com/irunervey/CIU-SistemaSolarConNave/blob/master/Practica4/Data/animation.gif)
