package cms_wheat.utils;
import cms_wheat.utils.ElementOfSupplyOrDemandCurve;

import java.util.Comparator;

public class ElementOfSupplyOrDemandCurveComparator implements Comparator<ElementOfSupplyOrDemandCurve> {

public int compare(ElementOfSupplyOrDemandCurve element1,ElementOfSupplyOrDemandCurve element2){
	return Double.compare(element1.getPrice(),element2.getPrice());
}
}
