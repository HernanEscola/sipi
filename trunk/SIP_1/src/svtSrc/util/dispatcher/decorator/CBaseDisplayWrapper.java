package conicet.apps.svt.web.dispatcher.decorator;

import java.util.Collection;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.displaytag.decorator.TableDecorator;
import org.displaytag.decorator.hssf.DecoratesHssf;

public class CBaseDisplayWrapper extends TableDecorator implements
		DecoratesHssf {

	@Override
	public void setSheet(HSSFSheet arg0) {
		// TODO Auto-generated method stub

	}

	public static List sort(Collection col, String nombreOrder, String order) {
		CSortTool sort = new CSortTool();
		int o = Integer.valueOf(order).intValue();
		String b = (o == 1)? ":asc" : ":desc";
		Collection sorteada = sort.sort(col, nombreOrder+b);
		return (List)sorteada;
	}
}
