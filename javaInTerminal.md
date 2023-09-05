# Use java compiler in Terminal

```bash
cd /path/to/proyect/
```

Configure proyect distribution

```bash
mkdir baseFolder
cd baseFolder
mkdir src bin
```

create files.java in src folder

```bash
touch src/File1.java src/Test.java src/AplicacionDePrueba.java src/Alumno.java
```

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

Execute compiled files

```bash
java -cp bin package.ObjectWithMain
java -cp bin Test
java -cp bin practica1.AplicacionDePrueba 0
```





















