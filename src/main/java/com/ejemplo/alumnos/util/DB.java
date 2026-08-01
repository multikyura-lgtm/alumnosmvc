package com.ejemplo.alumnos.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DB {

    // Шлях до бази даних SQLite
    private static final String URL = "jdbc:sqlite:C:/data/alumnos.db";

    static {
        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("No se encontró el driver SQLite", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL);
    }

    // Створення таблиці alumnos, якщо її ще немає
    public static void initSchema() {

    String sqlAlumnos = """
        CREATE TABLE IF NOT EXISTS alumnos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nombre TEXT NOT NULL,
            apellidos TEXT NOT NULL,
            curso TEXT NOT NULL,
            nota REAL
        );
        """;

    String sqlUsuarios = """
        CREATE TABLE IF NOT EXISTS usuarios (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            usuario TEXT NOT NULL UNIQUE,
            password TEXT NOT NULL,
            rol TEXT NOT NULL DEFAULT 'USER'
        );
        """;

    try (Connection con = getConnection();
         PreparedStatement psAlumnos = con.prepareStatement(sqlAlumnos);
         PreparedStatement psUsuarios = con.prepareStatement(sqlUsuarios)) {

        psAlumnos.executeUpdate();
        psUsuarios.executeUpdate();

    } catch (SQLException e) {
        throw new RuntimeException("Error creando las tablas", e);
    }
}
}