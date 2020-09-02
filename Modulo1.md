# Modulo 1

### 1. Flutter

Es el kit de herramientas hecho por google para crear interfaces de usuario muy agradables a la vista del usuario, y que a su vez sean multiplataforma.

### 2. Dart

Es un lenguaje de programacion desarrollado por google y tiene las siguientes caracteristicas:

* Orientado a objetos.
* Lenguaje Tipado y Dinámico.
* Similar a Java, JavaScript y Swift.
* Garbage Collector.
* Sirve tanto para Frontend como Backend.

[Documentacion de Dart](https://dart.dev)

Flutter es bonito, rapido, productivo y abierto.

### Hot reload

* Permite desarrollar una app mientras se ejecuta.
* Se reduce hasta 3 veces el tiempo de desarrollo.

### Widget

Son los bloques más básicos en el desarrollo de la aplicacion.

### ¿Cómo funciona Flutter?

Se organiza en 3 capas

1. **FrameWork**: Son todas las librerias escritas en Dart.
    * Material
    * Cupertino
    * Widgets
    * Rendering
    * Animation
    * Painting
    * Gestures
    * Foundation
2. **Engine**: En su mayoria está escrito en c/c++, aqui se encuentra la maquina virtual
    * Service protocol
    * Composition
    * Platform channels
    * Dart isolate setup
    * Rendering
    * System events
    * Dart VM management
    * Frame scheduling
    * Asset resolution
    * Frame pipelining
    * Text layout
3. **Embedder**: esta capa es la encargada de que las aplicaciones funcionen para cada arquitectura.
    * Render surface setup
    * Thread setup
    * Event loop interop

### Skia y Rive

**Skia** es un compilador gráafico, sirve para crear animaciones, graficos de gran calidad.

**Rive** es una herramienta para hacer renderizaciones para que se vea más fluida la animación.

### Aplicaciones en la indsutria

* Google ads
* Alibaba Group
* Nu bank
* Philips hue
* The new york times
* Square
* Google Assitant
