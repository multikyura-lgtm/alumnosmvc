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

       public List<Alumno> listar(String buscar, String campo, String orden) {

      List<Alumno> lista = new ArrayList<>();

      if (campo == null
          || (!campo.equals("id")
              && !campo.equals("nombre")
              && !campo.equals("apellidos")
              && !campo.equals("curso")
              && !campo.equals("nota"))) {

        campo = "id";
      }

      if (orden == null
          || (!orden.equalsIgnoreCase("ASC")
              && !orden.equalsIgnoreCase("DESC"))) {

        orden = "DESC";
      }

      StringBuilder sql = new StringBuilder(
          "SELECT * FROM alumnos");

      boolean buscarTexto = buscar != null && !buscar.isBlank();

      if (buscarTexto) {

        sql.append("""
                WHERE nombre LIKE ?
                   OR apellidos LIKE ?
            """);
      }

      sql.append(" ORDER BY ")
          .append(campo)
          .append(" ")
          .append(orden);

      try (Connection con = DB.getConnection();
          PreparedStatement ps = con.prepareStatement(sql.toString())) {

        if (buscarTexto) {

          String texto = "%" + buscar + "%";

          ps.setString(1, texto);
          ps.setString(2, texto);
        }

        try (ResultSet rs = ps.executeQuery()) {

          while (rs.next()) {

            Double nota = rs.getObject("nota") == null
                ? null
                : rs.getDouble("nota");

            lista.add(new Alumno(
                rs.getInt("id"),
                rs.getString("nombre"),
                rs.getString("apellidos"),
                rs.getString("curso"),
                nota));
          }
        }

      } catch (SQLException e) {
        throw new RuntimeException(e);
      }

      return lista;
    }

    public int contarAlumnos() {

      String sql = "SELECT COUNT(*) FROM alumnos";

      try (Connection con = DB.getConnection();
          PreparedStatement ps = con.prepareStatement(sql);
          ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
          return rs.getInt(1);
        }

      } catch (SQLException e) {
        throw new RuntimeException(e);
      }

      return 0;
    }

public Double notaMedia() {

    String sql = "SELECT AVG(nota) FROM alumnos";

    try (Connection con = DB.getConnection();
         PreparedStatement ps = con.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            return (Double) rs.getObject(1);
        }

    } catch (SQLException e) {
        throw new RuntimeException(e);
    }

    return null;
}
    // Пошук учня за ID
    public Alumno buscarPorId(int id) {
        String sql = "SELECT * FROM alumnos WHERE id=?";

        try (Connection con = DB.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
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
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error buscando alumno por ID", e);
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
