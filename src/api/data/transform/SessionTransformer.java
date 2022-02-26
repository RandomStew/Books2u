package api.data.transform;

import java.lang.reflect.Field;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

public class SessionTransformer implements Transformer{

	HttpSession session;
	
	
	public SessionTransformer(HttpSession session) {
		this.session = session;
	}
	
	@Override
	public void setMappingDTO(Object dto) {
		Field[] fields = dto.getClass().getDeclaredFields();
		for(Field field : fields) {
			field.setAccessible(true);
			String value = (String)session.getAttribute(field.getName());
			if(value == null) continue;	
			
			// if getParameter value is not null
			try {
				if(field.getType() == int.class) {
					field.set(dto, Integer.parseInt(value));
				} else {
					field.set(dto, value);
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public void setMappingHash(HashMap<String, String> hash, String... strs) {
		for (String s : strs) {
			String value = (String)session.getAttribute(s);
			hash.put(s, value);
		}
		
	}
	
	



}
