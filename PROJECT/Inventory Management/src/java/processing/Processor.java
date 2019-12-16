/*
enter data in table
take an item 

 */
package processing;
import db.Dbconn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
/**
 *
 * @author manas
 */
public class Processor {
    void doOperations() throws Exception
    {
        try{
            Import imp = new Import();
            //this will be the directory where sap will put its report
            String filepath = "/home/manas/Desktop/SHEET.xlsx";
            //database import of file
            int i = imp.doImport(filepath,"sap_report");                            //database created of sap report
            //i will be 1 if import succeeds
            if(i == 1)
            {
                //connecting database
                Dbconn db=new Dbconn();
                Connection con = Dbconn.connect();
                
                String selectsql = "Select * from `sap_report`";
                PreparedStatement pst = null;
                Statement st = con.createStatement();
                
                ResultSet rs =  st.executeQuery(selectsql); 
                
                // rs has row of sap report
                int num = 3;
                for(int j = 0;j<num;j++)
                {
                rs =  st.executeQuery(selectsql); 
                    
                    if(num==20)
                        break;
                    //int q = j;
                    for(int q=0;q<j;q++)
                    {
                        rs.next();
                    }
                    
                    float sumlead = 0;
                    int n = 4;
                    
                    while(rs.next())
                    {
                        System.out.println("3");
                        sumlead += rs.getInt("lead_time");
                    }
                    //substract lead time of just the prev one and get aggregate
                    rs.last();
                    
                    //System.out.println(rs.getInt("lead_time"));
                    sumlead -= rs.getInt("lead_time");
                    System.out.println("sumlead = " + sumlead);
                    
                    
                    sumlead = sumlead/3;
                    
                    float tpsumlead = sumlead;
                    
                    //new issue date = previssuedate+(aggregate of lead *0.7)+4
                    
                    Date preissue = rs.getDate("material_issue_date");
                    
                    float tempsumlead = (float) ((sumlead*0.7)+4);
                    Date issuedate  = new java.util.Date(preissue.getTime());
                    
                    issuedate = addDays(issuedate , Math.round(tempsumlead));
                    
                    //new indentdate = issuedate - prevleadtime - 4
                    Date indentdate = new java.util.Date(issuedate.getTime());
                    
                    int prevlead = rs.getInt("lead_time") + 4;
                    
                    indentdate = subtractDays(issuedate,prevlead);
                    
                    System.out.println("indent = "+indentdate+" issuedate = "+issuedate);
                    
                    //prepared statement
                    String insque = "insert into `sap_report`(`indent_date`,`material_issue_date`,`lead_time`) values (?,?,?)";
                    
                    pst = con.prepareStatement(insque);
                    pst.setDate(1,new java.sql.Date(indentdate.getTime()));
                    pst.setDate(2,new java.sql.Date(issuedate.getTime()));
                    pst.setFloat(3,tpsumlead);
                    pst.executeUpdate();
                    
                    rs.beforeFirst();
                    num++;
                }
                
                Export exp = new Export();
                exp.exportdata();
            }else{
                System.out.println("Problem while importing data in mysql!");
            }
            
        }catch(Exception e){
            System.out.println(e.toString());
        }
    }
    //add days
   public static Date addDays(Date date, int days) {
		GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.add(Calendar.DATE, days);
				
		return cal.getTime();
   }
   //substract days
   public static Date subtractDays(Date date, int days) {
		GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(date);
		cal.add(Calendar.DATE, -days);
				
		return cal.getTime();
    }
   
  /* public static void main(String[] args) throws Exception
   {
       Processor p = new Processor();
       p.doOperations();
       
       
   }*/
   
}
