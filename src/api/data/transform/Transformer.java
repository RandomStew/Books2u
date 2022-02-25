package api.data.transform;

import java.util.HashMap;

public interface Transformer {
	public void setMappingDTO(Object dto);
	public void setMappingHash(HashMap<String, String> hash, String ...  strs);
}
