package nl.gall.reflex.java;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FormattedDate {
    // method for creating dates, enter format and number of hours to add to current timestamp. no format gives epoch timestamp
    public static String getDate(String format, int hoursToAdd){
        Date date = new Date();
        long dateWithAddedHours = date.getTime() + (1000 * 60 * 60 * hoursToAdd);
        SimpleDateFormat sdf =  new SimpleDateFormat(format);
        String formattedDate = "";
        if(format.equals("")){
            formattedDate = String.valueOf(dateWithAddedHours);
        }
        else{
            formattedDate = sdf.format(dateWithAddedHours);
        }
        return formattedDate;
    }
}
