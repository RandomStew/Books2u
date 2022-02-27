package api.data.transform;

import java.lang.reflect.Field;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

public class RequestTransformer implements Transformer {
	
	HttpServletRequest request;
	
	
	public RequestTransformer(HttpServletRequest req) {
		this.request = req;
	}
	
	@Override
	public void setMappingDTO(Object dto) {
		Field[] fields = dto.getClass().getDeclaredFields();
		for(Field field : fields) {
			field.setAccessible(true);
			String value = request.getParameter(field.getName());
			if(value == null) continue;	
			
			// if getParameter value is not null
			try {
				if(field.getType() == int.class) {
					field.set(dto, Integer.parseInt(value));
				} else if(field.getType() == double.class) {
					field.set(dto,  Double.parseDouble(value));
				} else if (field.getType() == long.class) {
					field.set(dto, Long.parseLong(value));
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
		for(String s : strs) {
			String value = (String)request.getParameter(s);
			hash.put(s, value);
		}
	}


}
