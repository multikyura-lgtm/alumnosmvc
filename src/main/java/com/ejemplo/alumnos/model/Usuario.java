package com.ejemplo.alumnos.model;

public class Usuario {

    private Integer id;
    private String usuario;
    private String password;
    private String rol;

   public Usuario(Integer id,
               String usuario,
               String password,
               String rol) {

    this.id = id;
    this.usuario = usuario;
    this.password = password;
    this.rol = rol;
}

    public Usuario(String usuario,
               String password,
               String rol) {

    this(null, usuario, password, rol);
}

 

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
      this.password = password;
    }
    public String getRol() {
    return rol;
}

public void setRol(String rol) {
  this.rol = rol;
}
public Integer getId() {
    return id;
}

public void setId(Integer id) {
    this.id = id;
}
}