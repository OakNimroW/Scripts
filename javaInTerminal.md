# Use java compiler in Terminal

```bash
cd /path/to/proyect/
```

## Configure

Configure proyect distribution

```bash
mkdir baseFolder
cd baseFolder
mkdir src bin
```

## Create files

create files.java in src folder

```bash
touch src/File1.java src/Test.java src/AplicacionDePrueba.java src/Alumno.java
```

## Compilation

compile src files in bin folder

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

```bash
javac -d bin -cp libs/* src/*.java
```

## Examples

Project in **"/home/oaknimrow/Desktop/The Folder/Carpetas/Uni/Terminado/Programacion 3/Practica 7/Programacion3"**, Practica 7 Parte A Programacion 3

```bash
javac -d bin -cp lib/hamcrest-core-1.3.jar $(find . -name '*.java' -type f | grep -v "Test")
java -cp bin ParteA.ParteA
```



