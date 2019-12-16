/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processing;
import java.util.Date;

/**
 *
 * @author manas
 */
public class DateCalc {
    int calDate(Date date1,Date date2) throws Exception
    {
        try {
			// getTime() returns the number of milliseconds since January 1, 1970, 00:00:00 GMT represented by this Date object
			long diff = date1.getTime() - date2.getTime();
 
			int diffDays = (int) (diff / (24 * 60 * 60 * 1000));
			
                        return diffDays;
            } catch (Exception e) {
			System.out.println("Exception occured in date calculation: "+e.toString());
                        return 999999;
            }
    }
}
