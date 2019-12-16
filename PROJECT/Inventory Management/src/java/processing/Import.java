
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processing;

import db.Dbconn;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author manas
 */
public class Import {

    //takes filepath of excel sheet and tablename to import it in as parameters
    int doImport(String fp, String tabnme) throws Exception{
    //public static void main(String[] args) throws Exception {
        try {
            //CONNECTING DATABASE
            Dbconn db = new Dbconn();
            Connection con = Dbconn.connect();
            Statement st = con.createStatement();
            //  String fp = "/home/manas/Desktop/SHEET.xlsx";
            //  String tabnme = "sap_report";
            st.executeUpdate("TRUNCATE TABLE " + tabnme);
            con.setAutoCommit(false);
            PreparedStatement stmt = null;
            FileInputStream input = new FileInputStream(fp);

            XSSFWorkbook wb = new XSSFWorkbook(input);

            XSSFSheet sheet = wb.getSheetAt(0);
            Row row;
            int i;
            DataFormatter dataFormatter = new DataFormatter();

            String format = "yyyy-mm-dd";
            SimpleDateFormat sdf = new SimpleDateFormat(format);

            for (i = 1; i <= sheet.getLastRowNum(); i++) {

                row = sheet.getRow(i);

                //READING DATA FROM SHEET 

                String material = (String) row.getCell(0).getStringCellValue();
                String desc = (String) row.getCell(1).getStringCellValue();
                String unit = (String) row.getCell(2).getStringCellValue();
                double quantity = row.getCell(3).getNumericCellValue();
                double curstk = row.getCell(4).getNumericCellValue();
                double cost = row.getCell(5).getNumericCellValue();
                Date indentdate = row.getCell(6).getDateCellValue();
                Date podate = row.getCell(7).getDateCellValue();
                Date recdate = row.getCell(8).getDateCellValue();
                Date issuedate = row.getCell(9).getDateCellValue();
                double issued = row.getCell(10).getNumericCellValue();
                double used = row.getCell(11).getNumericCellValue();
                String currency = (String) row.getCell(12).getStringCellValue();
                String matgrp = (String) row.getCell(13).getStringCellValue();
                String creater = (String) row.getCell(14).getStringCellValue();
                System.out.println(podate);
                DateCalc i2 = new DateCalc();
                int lead = i2.calDate(recdate,indentdate);
                
                
                //WRITING DATA TO TABLE
                
                String sql = "INSERT INTO `" + tabnme + "` VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                stmt = con.prepareStatement(sql);
                stmt.setString(1, material);
                stmt.setString(2, desc);
                stmt.setString(3, unit);
                stmt.setDouble(4, quantity);
                stmt.setDouble(5, curstk);
                stmt.setDouble(6, cost);
                stmt.setDate(7, new java.sql.Date(indentdate.getTime()));
                stmt.setDate(8, new java.sql.Date(podate.getTime()));
                stmt.setDate(9, new java.sql.Date(recdate.getTime()));
                stmt.setDate(10, new java.sql.Date(issuedate.getTime()));
                stmt.setDouble(11, issued);
                stmt.setDouble(12, used);
                stmt.setString(13, currency);
                stmt.setString(14, matgrp);
                stmt.setString(15, creater);
                stmt.setInt(16, lead);
                //System.out.println("sql =   "+sql);

                stmt.executeUpdate();

            }
            System.out.println("Imported rows " + i);
            con.commit();
            stmt.close();
            con.close();
            input.close();
            System.out.println("Success import excel to mysql table");
            return 1;
        } catch (IOException e) {
            System.out.println(e.toString());
            return 0;
        }
    }
    
    

    
}
