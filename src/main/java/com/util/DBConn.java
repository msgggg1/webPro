package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// 싱글톤(Singleton) 패턴
public class DBConn {

   private static Connection conn = null;
   
   private DBConn() {
   }
   
   public static synchronized Connection getConnection() {
      if(conn == null) {
         
         String className = "oracle.jdbc.driver.OracleDriver";         
         String url = "jdbc:oracle:thin:@localhost:1521:xe";
         String user = "scott";
         String password = "TIGER";
         
         try {
            Class.forName(className);
            conn = DriverManager.getConnection(url, user, password);
         } catch (ClassNotFoundException e) {
            e.printStackTrace();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
      return conn;
   }
   
   public static synchronized Connection getConnection(String url, String user, String password) {
      if(conn == null) {
         
         String className = "oracle.jdbc.driver.OracleDriver";
         
         try {
            Class.forName(className);
            conn = DriverManager.getConnection(url, user, password);
         } catch (ClassNotFoundException e) {
            e.printStackTrace();
         } catch (SQLException e) {
            e.printStackTrace();
         }
         
      }
      return conn;
   }
   
   public static void close() {
      try {
         if(conn != null && !conn.isClosed()) {
            conn.close();
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      conn = null;
   }
   
}
