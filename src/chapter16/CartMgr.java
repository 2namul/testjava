package chapter16;
import java.util.Hashtable;
public class CartMgr {
	private Hashtable<String, OrderBean> hCart=new Hashtable<String, OrderBean>();
	public CartMgr() {
		
	}
	
	
	public void addCart(OrderBean order) {
		String product_no = order.getProduct_no();
		System.out.println("제품번호"+product_no);
		int quantity = order.getQuantity();
		System.out.println("수량"+quantity);
		if(quantity>0) {
			
			if(hCart.containsKey(product_no)) {
				OrderBean tempOrder = (OrderBean)hCart.get(product_no);
				quantity += tempOrder.getQuantity();
				tempOrder.setQuantity(quantity);
				hCart.put(product_no, tempOrder);
			}else {
				hCart.put(product_no, order);
			}
		}
	}
	
	public Hashtable getCartList() {
		return hCart;
	}
	
	public void updateCart(OrderBean order) {
		String product_no = order.getProduct_no();
		hCart.put(product_no, order);
	}
	public void deleteCart(OrderBean order) {
		String product_no = order.getProduct_no();
		hCart.remove(product_no);
	}

}
