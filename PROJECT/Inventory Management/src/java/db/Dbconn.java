/**
 *  SIMPLE FILE RETURNS THE CONNECTION OBJECT IF THE DATABSE CONNECCTION IS SUCCESSFULL ELSE RETURNS NULL!
 * @author manas
 */

package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconn {
    static Connection connection ;

    public static Connection connect() throws Exception {
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/INVENTORY","root", "");            
            return connection;
        } catch (Exception e) {
            System.out.println("Ex : " + e.toString());//prints exception in connection if any
            System.out.println("Error connecting the database maybe mysql down!");
        }
        return null;
    }
}