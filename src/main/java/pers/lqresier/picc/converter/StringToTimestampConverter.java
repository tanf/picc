package pers.lqresier.picc.converter;

import org.springframework.core.convert.converter.Converter;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class StringToTimestampConverter implements Converter<String, Timestamp> {
    private static final Map<String,String> dateFormatMap =new HashMap<String,String>();
    static{
        dateFormatMap.put("^\\d{4}-\\d{1,2}$","yyyy-MM");
        dateFormatMap.put("^\\d{4}-\\d{1,2}-\\d{1,2}$","yyyy-MM-dd");
        dateFormatMap.put("^\\d{4}-\\d{1,2}-\\d{1,2} {1}\\d{1,2}:\\d{1,2}$","yyyy-MM-dd hh:mm");
        dateFormatMap.put("^\\d{4}-\\d{1,2}-\\d{1,2} {1}\\d{1,2}:\\d{1,2}:\\d{1,2}$","yyyy-MM-dd hh:mm:ss");
    }

    @Override
    public Timestamp convert(String s) {
        s=s.trim();
        for(Map.Entry<String,String> entry:dateFormatMap.entrySet()) {
            if (s.matches(entry.getKey())) {
                DateFormat df = new SimpleDateFormat(entry.getValue());
                Date date = null;
                try {
                    date = df.parse(s);
                } catch (ParseException e) {
                    return null;
                }
                return new Timestamp(date.getTime());
            } else {
                continue;
            }
        }
        return null;
    }
}
