/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processing;

/**
 *
 * @author manas
 */
import db.Dbconn;
import java.io.FileOutputStream;
import java.sql.*;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class Export {
    // public static void main(String[] args) throws Exception  { 
     void exportdata() throws Exception
     {   
         
       // Workbook readWorkbook = WorkbookFactory.create(new FileInputStream("/home/manas/Desktop/test.xlsx") );
             
	Dbconn db=new Dbconn();
        Connection con = Dbconn.connect();
        Workbook writeWorkbook = (Workbook) new HSSFWorkbook();
        Sheet desSheet = writeWorkbook.createSheet("new_sheet");

        Statement stmt;
        ResultSet rs;
        try
        {
            
            HSSFWorkbook work = new HSSFWorkbook();
            HSSFSheet sheet = work.createSheet("Sheet_1");
            
            String query ="SELECT * FROM sap_report";
            System.out.println("DEmo1");
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnsNumber = rsmd.getColumnCount();

            Row desRow1 = desSheet.createRow(0);
            System.out.println("DEmo2");
            for(int col=0 ;col < columnsNumber;col++) 
            {
                Cell newpath = desRow1.createCell(col);
                newpath.setCellValue(rsmd.getColumnLabel(col+1));
            }
            
            while(rs.next())
            {
                System.out.println("Row number" + rs.getRow() );
                Row desRow = desSheet.createRow(rs.getRow());
                for(int col=0 ;col < columnsNumber;col++) 
                {
                    Cell newpath = desRow.createCell(col);
                    newpath.setCellValue(rs.getString(col+1));  
                }
                //the following path is to be replaced by the path of your file location
                FileOutputStream fileOut = new FileOutputStream("/report-2-mar.xlsx");
                writeWorkbook.write(fileOut);
                fileOut.close();
            }
        }
        catch (SQLException e) {
            System.out.println("Failed to get data from database"+e.toString());
        }
    }
}
