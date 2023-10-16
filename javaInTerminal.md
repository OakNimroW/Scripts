# Use java compiler in Terminal

```bash
cd /path/to/proyect/
```

## Configure

Configure project distribution

```bash
mkdir baseFolder
cd baseFolder
mkdir src bin libs
```

## Create files

Create files.java in src folder

```bash
touch src/File1.java src/Test.java src/AplicacionDePrueba.java src/Alumno.java
```

## Compilation

Compile `src` files in bin folder

```bash
javac -d bin src/*.java
```

The **practica1** folder is created because the file **AplicacionDePrueba.java** uses the package *practica1*

```bash
$ javac -d bin src/*.java
$ tree
.
├── bin
│   ├── practica1
│   │   ├── Alumno.class
│   │   └── AplicacionDePrueba.class
│   └── Test.class
└── src
    ├── Alumno.java
    ├── AplicacionDePrueba.java
    └── Test.java
```

## Execution

Execute compiled files

```bash
java -cp bin package.ObjectWithMain
java -cp bin Test
java -cp bin practica1.AplicacionDePrueba 0
```

## Libraries

Compile: 
```bash
javac -d bin -cp libs/* src/*.java
```

Execute:
```bash
java -cp bin:./libs/libraries.jar package.objectWithMain
java -cp bin:./libs/stdlib.jar Dibujo
```

## Examples

Project in **"/home/oaknimrow/Desktop/The Folder/Carpetas/Uni/Terminado/Programacion 3/Practica 7/Programacion3"**, Practica 7 Parte A Programacion 3

```bash
javac -d bin -cp lib/hamcrest-core-1.3.jar $(find . -name '*.java' -type f | grep -v "Test")
java -cp bin ParteA.ParteA
```

Project with libraries:
> TO-DO: Use Multiple Libraries.
```bash
tree -a
.
├── bin
├── .classpath
├── libs
│   └── stdlib.jar
├── .project
└── src
    └── Dibujo.java

javac -d bin -cp libs/* src/*.java

java -cp bin:./libs/stdlib.jar Dibujo
```

# Create JAR Files

To create an JAR file the project has to be compiled first.
After that the JAR file can be created using the command `jar`, it needs an `manifest.txt` file that explicites where the Main class is.

*Manifest.txt*
```txt
Main-Class: Package.ObjectWithMain
```

*Comand to create JAR file*
```bash
# At the base project folder 
jar cfm Project.jar ProjectManifest.txt -C bin .
```

*Comand to execute JAR file*
```bash
java -jar Project.jar
```

# UML Diagram

Using PlantUML

```bash
java -jar ./plantuml-1.2023.11.jar UML.txt
kitty +kitten icat UML.png
```

Example:

```txt
@startuml

abstract class MagnitudFisica {
  - value: double
  - equivalenciaSI: double

  + getValue(): double
  + setValue(): void
  + getEquivalenciaSI(): double
  + toString(): String
}

abstract class Longitud {
  + add(): Longitud
}
MagnitudFisica <|-- Longitud

class Metro {
  + getAbreviatura(): "m"
  + getUnidad(): "Metro"
}
Longitud <|-- Metro

class Pie {
  + getAbreviatura(): "ft"
  + getUnidad(): "Pie"
}
Longitud <|-- Pie

@enduml
```
