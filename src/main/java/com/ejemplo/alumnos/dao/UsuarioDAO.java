package com.ejemplo.alumnos.dao;

import com.ejemplo.alumnos.model.Usuario;
import com.ejemplo.alumnos.util.DB;
import java.sql.ResultSet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UsuarioDAO {

  public void insertar(Usuario usuario) {

    String sql = """
        INSERT INTO usuarios(usuario, password, rol)
        VALUES (?, ?, ?)
        """;

    try (Connection con = DB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)) {

      ps.setString(1, usuario.getUsuario());
      ps.setString(2, usuario.getPassword());
      ps.setString(3, usuario.getRol());

      ps.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException("Error insertando usuario", e);
    }
  }

  public Usuario buscarPorUsuario(String usuario) {

    String sql = """
        SELECT *
        FROM usuarios
        WHERE usuario = ?
        """;

    try (Connection con = DB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)) {

      ps.setString(1, usuario);

      ResultSet rs = ps.executeQuery();

      if (rs.next()) {

        return new Usuario(
            rs.getInt("id"),
            rs.getString("usuario"),
            rs.getString("password"),
            rs.getString("rol"));
      }

      return null;

    } catch (SQLException e) {
      throw new RuntimeException("Error buscando usuario", e);
    }
  }

  public void actualizarPassword(int id, String passwordHash) {

    String sql = """
        UPDATE usuarios
        SET password = ?
        WHERE id = ?
        """;

    try (Connection con = DB.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)) {

      ps.setString(1, passwordHash);
      ps.setInt(2, id);

      ps.executeUpdate();

    } catch (SQLException e) {
      throw new RuntimeException("Error actualizando contraseña", e);
    }
  }
public void cambiarPassword(Integer id, String password) {

    String sql = """
        UPDATE usuarios
        SET password = ?
        WHERE id = ?
        """;

    try (Connection con = DB.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, password);
        ps.setInt(2, id);

        ps.executeUpdate();

    } catch (SQLException e) {
        throw new RuntimeException("Error cambiando contraseña", e);
    }
}
}