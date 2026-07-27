package com.ejemplo.alumnos.model;

public class Alumno {

    private Integer id;
    private String nombre;
    private String apellidos;
    private String curso;
    private Double nota;

    public Alumno() {
    }

    public Alumno(Integer id, String nombre, String apellidos, String curso, Double nota) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.curso = curso;
        this.nota = nota;
    }

    public Alumno(String nombre, String apellidos, String curso, Double nota) {
        this(null, nombre, apellidos, curso, nota);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public Double getNota() {
        return nota;
    }

    public void setNota(Double nota) {
        this.nota = nota;
    }
}
