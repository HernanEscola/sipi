package conicet.apps.svt.util.autoComplete.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;

import org.apache.struts.taglib.TagUtils;

public class CTagAutoCompleteView extends org.apache.struts.taglib.bean.WriteTag {
	
	private String tipoAutocomplete;

	public CTagAutoCompleteView() {
	}

	public int doStartTag() throws JspException {
		this.setProperty("autoCompleteMappedDescripcion(" + tipoAutocomplete + ")");
		return super.doStartTag();
	}

	public String getTipoAutocomplete() {
		return tipoAutocomplete;
	}

	public void setTipoAutocomplete(String tipoAutocomplete) {
		this.tipoAutocomplete = tipoAutocomplete.substring(0, 1).toUpperCase() + tipoAutocomplete.substring(1);
	}
	
	
 
	public static String generarAutoCompleteView(PageContext pc, String nameForm, String tipoAutocomplete) throws JspException {
		CTagAutoCompleteView ac = new CTagAutoCompleteView();
		ac.setName(nameForm);
	     // Look up the requested property value
        Object value =
            TagUtils.getInstance().lookup(pc, ac.getName(), ac.getProperty(), ac.getScope());

        if (value == null) {
            return "";
        }

        // Convert value to the String with some formatting
        String output = ac.formatValue(value);
        
        return output;
		 /*if (filter) {
	            TagUtils.getInstance().write(pageContext,
	                TagUtils.getInstance().filter(output));
	        } else {
	            TagUtils.getInstance().write(pageContext, output);
	        }*/
	}
}
