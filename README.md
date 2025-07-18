# prueba
Prueba tecnica

## Aplicación

Esta aplicación toma datos de la API: **TheCatAPI** https://api.thecatapi.com/, esta API devuelve un JSON con la siguiente estructura: 
  > {"id":,"width":,"url":,"breeds":[] }  

En la cual el atributo breeds puede estar vacio o no.

### Uso

Al iniciar esta aplicación, se encontrara con 3 elementos principales:
+ Lista de imagenes
+ Botón de reiniciar lista
+ Botón de agregar imagen aleatoria

#### Lista de imagenes
Cada elemento de la lista de imagenes presenta una imagen y el id de la imagen.  
Al hacer clic en la imagen, esta te muestra la **pantalla de detalles**

> **Pantalla de detalles**  
>En esta pantalla es posible ver la imagen completa, así los detalles de la imagen, es decir:
> + **Id** de la imagen 
> + Ancho (Width)
> + Alto (Height)
> + Url
> + Raza del gato (Breed)

#### Botón de reiniciar lista
Este botón elimina los elementos existentes de la lista, y llama a otros 10 aleatorios nuevos

#### Botón de añadir imagen
Este botón añade una imagen a la lista de images, la cual se comporta como las demás


### Funcionamiento técnico
Esta aplicación hace uso del manejador de estados Provider, con el cual se creó un "*cat_provider*", la cual se declará como una lista de "*Cat*" el cual en si mismo es un modelo que toma la misma forma que la API

cat_provider.dart

    class CatProvider extends ChangeNotifier {
      List<Cat> _cats = [];
      //... código para cambiar los estados
    }

cat.dart (models)

    class Cat {
      String id;
      String url;
      int width;
      int height;
      List<Map<String, dynamic>> breeds;

      Cat(this.id, this.url, this.width, this.height, this.breeds);
      //... codigo para consultar a la api
    }

Cuando se consulta los detalles de una imagen, se busca dentro del provider para reutilizar los datos del mismo.


## Proceso de desarrollo
1. Leer los requerimientos de la prueba:
    + Necesita dos pantallas:
      + Pantalla de Inicio
      + Pantalla de detalle
    + Hace uso de una API publica
    + Usa un manejador de estados
    + Navegación entre pantallas
    + Diseño
    + Código Limpio
2. Toma de decisiones:      
    + Se uso la API publica de **TheCatAPI** https://api.thecatapi.com/
    + De esta manera, la pantalla de inicio desplegaria una lista de imagenes de gatos, mientras que la pantalla de detalle sería el detalle de la imagen que se obtuvo de la API
    + Como manejador de estados, se uso Provider


> Aclaraciones:  
> Esta es la primera vez que uso Flutter, por esto mismo, varias de las decisiones que tome se basan en videos vistos y en el uso de la inteligencia artificial para hacer esta aplicación.
