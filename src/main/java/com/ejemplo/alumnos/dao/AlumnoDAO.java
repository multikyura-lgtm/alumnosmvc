package com.ejemplo.alumnos.dao;

import com.ejemplo.alumnos.model.Alumno;
import com.ejemplo.alumnos.util.DB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlumnoDAO {

    // Додати учня
    public void insertar(Alumno alumno) {

        String sql = """
                INSERT INTO alumnos
                (nombre, apellidos, curso, nota)
                VALUES (?, ?, ?, ?)
                """;

        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, alumno.getNombre());
            ps.setString(2, alumno.getApellidos());
            ps.setString(3, alumno.getCurso());

            if (alumno.getNota() == null) {
                ps.setNull(4, Types.REAL);
            } else {
                ps.setDouble(4, alumno.getNota());
            }

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Error insertando alumno", e);
        }
    }

    // Отримати список учнів
    public List<Alumno> listar() {

        List<Alumno> lista = new ArrayList<>();

        String sql = """
                SELECT *
                FROM alumnos
                ORDER BY id DESC
                """;

        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Double nota = rs.getObject("nota") == null
                        ? null
                        : rs.getDouble("nota");

                lista.add(new Alumno(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("apellidos"),
                        rs.getString("curso"),
                        nota
                ));
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error listando alumnos", e);
        }

        return lista;
    }

    // Пошук учня за ID
    public Alumno buscarPorId(int id) {

        String sql = "SELECT * FROM alumnos WHERE id=?";

        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                Double nota = rs.getObject("nota") == null
                        ? null
                        : rs.getDouble("nota");

                return new Alumno(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getString("apellidos"),
                        rs.getString("curso"),
                        nota
                );
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error buscando alumno", e);
        }

        return null;
    }

    // Оновити оцінку
    public void actualizarNota(int id, Double nota) {

      String sql = "UPDATE alumnos SET nota=? WHERE id=?";

      try (Connection con = DB.getConnection();
          PreparedStatement ps = con.prepareStatement(sql)) {

        if (nota == null) {
          ps.setNull(1, Types.REAL);
        } else {
          ps.setDouble(1, nota);
        }

        ps.setInt(2, id);

        ps.executeUpdate();

      } catch (SQLException e) {
        throw new RuntimeException("Error actualizando nota", e);
      }
    }
    // Actualizar alumno
    public void actualizar(Alumno alumno) {

      String sql = """
          UPDATE alumnos
          SET nombre = ?,
              apellidos = ?,
              curso = ?
          WHERE id = ?
          """;

      try (Connection con = DB.getConnection();
          PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, alumno.getNombre());
        ps.setString(2, alumno.getApellidos());
        ps.setString(3, alumno.getCurso());
        ps.setInt(4, alumno.getId());

        ps.executeUpdate();

      } catch (SQLException e) {
        throw new RuntimeException("Error actualizando alumno", e);
      }
    }
// Eliminar alumno
public void eliminar(int id) {

    String sql = "DELETE FROM alumnos WHERE id = ?";

    try (Connection con = DB.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setInt(1, id);

        ps.executeUpdate();

    } catch (SQLException e) {
        throw new RuntimeException("Error eliminando alumno", e);
    }
}
}