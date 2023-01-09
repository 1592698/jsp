package market.ver01.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import market.ver01.dto.Product;
import market.ver01.dto.CartDTO;
import mvc.database.DBConnection;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

public class CartDAO {
	private Connection connection = null;
	private PreparedStatement preparedStatement = null;
	private ResultSet resultSet = null;

	public CartDAO() {
		connect();
	}

	private void connect() {
		try {
			connection = DBConnection.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean updateCart(Product productDTO, String orderNo, String memberId) {
		// 동일한 주문번호에 같은 productId만 있으면 update 없으면 insert
		int flag = 0;
		String productId = productDTO.getProductId();
		System.out.println(orderNo + " " + memberId);
		String sql = "SELECT p_cartId FROM cart WHERE p_orderNo = ? AND p_productId = ?";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, orderNo);
			preparedStatement.setString(2, productId);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				int cartId = resultSet.getInt("p_cartId");
				sql = "UPDATE cart SET p_cnt = p_cnt + 1 WHERE p_cartId = ? ";

				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setInt(1, cartId);
				flag = preparedStatement.executeUpdate();
			} else {
				sql = "INSERT INTO cart VALUES(null, ?, ?, ?, ?, ?, ?,  now())";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, memberId);
				preparedStatement.setString(2, orderNo);
				preparedStatement.setString(3, productId);
				preparedStatement.setString(4, productDTO.getPname());
				preparedStatement.setInt(5, productDTO.getUnitPrice());
				preparedStatement.setInt(6, 1);
				flag = preparedStatement.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag == 1;
	}

	public ArrayList<CartDTO> getCartList(String orderNo) {
		ArrayList<CartDTO> cartArrayList = new ArrayList<>();
		String sql = "SELECT * FROM cart WHERE p_orderNo = ?";
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, orderNo);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				CartDTO cart = new CartDTO();
				cart.setP_cartId(resultSet.getInt("p_cartId"));
				cart.setP_productId(resultSet.getString("p_productId"));
				cart.setP_name(resultSet.getString("p_name"));
				cart.setP_unitPrice(resultSet.getInt("p_unitPrice"));
				cart.setP_cnt(resultSet.getInt("p_cnt"));
				cartArrayList.add(cart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cartArrayList;
	}

	public boolean updateCartBylogin (HttpSession session) {
		int flag = 0;
		String orderNo = session.getId();
		String id = (String) session.getAttribute("sessionId");
		// 이전 로그인에 담은 상품 업데이트
		String sql = "UPDATE cart SET orderNo= ? WHERE id = ?";
		try {
		
		preparedStatement =connection.prepareStatement(sql);
		preparedStatement.setString(1, orderNo);
		preparedStatement.setString(2, id);
		flag= preparedStatement.executeUpdate();
		// 로그인 전에 담은 상품 업데이트
		sql = "UPDATE cart SET id=? WHERE orderNo= ?";
		preparedStatement = connection.prepareStatement(sql);
		
		preparedStatement.setString(1,id);
		preparedStatement.setString(2, orderNo);
		flag =preparedStatement.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag != 0;
	}
}