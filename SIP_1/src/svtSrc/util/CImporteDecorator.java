package conicet.apps.svt.util;

import java.math.BigDecimal;

import javax.servlet.jsp.PageContext;

import org.displaytag.decorator.DisplaytagColumnDecorator;
import org.displaytag.exception.DecoratorException;
import org.displaytag.properties.MediaTypeEnum;

public class CImporteDecorator implements DisplaytagColumnDecorator {

	@Override
	public Object decorate(Object columnValue, PageContext pageContext, MediaTypeEnum media) throws DecoratorException {		
		if (columnValue instanceof BigDecimal) {
			return CImporteWrapper.formateaMiles((BigDecimal)columnValue);
		} else if (columnValue instanceof String) {
			try {
				BigDecimal columnValueBD= new BigDecimal(((String)columnValue));
				return CImporteWrapper.formateaMiles(columnValueBD);				
			} catch (NumberFormatException ex) {
				return columnValue;
			}
		} else {
			return "";
		}
	}
}
