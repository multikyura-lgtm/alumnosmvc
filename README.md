# 🎓 Alumnos MVC

Aplicación web para la gestión de alumnos desarrollada con Java siguiendo el patrón MVC.

![Java](https://img.shields.io/badge/Java-21-orange)
![Maven](https://img.shields.io/badge/Maven-3.9-blue)
![SQLite](https://img.shields.io/badge/SQLite-Database-green)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5-purple)
![License](https://img.shields.io/badge/License-MIT-yellow)

**Características principales:**

- Gestión de alumnos
- Asignación de notas
- Base de datos SQLite
- Interfaz con Bootstrap 5

## Tecnologías utilizadas

- Java 21
- Jakarta Servlet
- JSP
- Maven
- SQLite
- Bootstrap 5
- Apache Tomcat 11
- Git y GitHub

## 🏗️ Arquitectura

El proyecto sigue el patrón MVC (Model-View-Controller).

- **Model** → Clase `Alumno`
- **DAO** → Acceso a la base de datos SQLite
- **Servlet** → Controlador principal
- **JSP** → Vistas de la aplicación

## Funcionalidades

- ✅ Listado de alumnos
- ✅ Crear alumno
- ✅ Editar alumno
- ✅ Asignar nota
- ✅ Almacenamiento en SQLite

## 📸 Capturas de pantalla

### 🏠 Página principal

![Página principal](screenshots/inicio.png)

### 📋 Listado de alumnos

![Listado de alumnos](screenshots/listado.png)

### ➕ Nuevo alumno

![Nuevo alumno](screenshots/nuevo.png)

### ✏️ Editar alumno

![Editar alumno](screenshots/editar.png)

### ⭐ Asignar nota

![Asignar nota](screenshots/nota.png)

## Estructura del proyecto

```
src/
 ├── main/
 │   ├── java/
 │   └── webapp/
 └── pom.xml
```

## 🚀 Cómo ejecutar

### Requisitos

- Java 21
- Apache Tomcat 11
- Maven 3.9+

### Pasos

1. Clonar el repositorio.
2. Abrir el proyecto con IntelliJ IDEA o Visual Studio Code.
3. Ejecutar Maven.
4. Desplegar el archivo WAR en Apache Tomcat.
5. Abrir el navegador en:

```
http://localhost:8080/alumnosmvc
```

## 🚀 Próximas mejoras

- 🔍 Buscar alumnos
- 🗑️ Eliminar alumnos
- 📊 Estadísticas de notas
- 🌐 Migración a Spring Boot
- 🔐 Sistema de autenticación

## 📦 Versión

**v1.0**

## Autor

**Yurii Kutko**
