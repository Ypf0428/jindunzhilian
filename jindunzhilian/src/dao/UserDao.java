package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import entity.User;

public class UserDao {
	
	 public static DataSource getDataSourceWithC3p0ByXML (){
		  ComboPooledDataSource cpds = new ComboPooledDataSource("jindun");
		  return cpds ; 
		 }
	 
	 public List<User> findUser() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<User> users = new ArrayList<User>();
		
		try {
			conn = getDataSourceWithC3p0ByXML ().getConnection();
			String sql = "select * from userinformation";
			pstmt= conn.prepareStatement(sql);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				String username = rs.getString("username");
				String password = rs.getString("password");
				User user = new User(username,password);
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		 return users;
	 }
	
	public User findUserByusername(String username) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user = null;
		
			try {
				conn = getDataSourceWithC3p0ByXML ().getConnection();
				String sql = "select * from userinformation where username= ?";
				pstmt= conn.prepareStatement(sql);
				pstmt.setString(1,username);
				rs= pstmt.executeQuery();
				while(rs.next()) {
					String uname = rs.getString("username");
					String password = rs.getString("password");
					int LTID = rs.getInt("LTID");
					user = new User(username,password,LTID);
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}finally {
				try {
					if(rs != null) {
						rs.close();
					}
					if(pstmt != null) {
						pstmt.close();
					}
					if(conn != null) {
						conn.close();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		return user;
	}
	
		public boolean isExistByusername(String username) {
			boolean isExist = false;
			User user = this.findUserByusername(username);
			isExist = (user == null) ? false : true;
			return isExist;
			
		}
	
		public boolean updateUser(User user,String username) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			boolean flag = true;
		try {
			conn = getDataSourceWithC3p0ByXML().getConnection();
			String sql = "update userinformation set username = ?,password = ? where username= ?";
			pstmt = conn.prepareStatement(sql);
			//1、2、3按先后顺序
			pstmt.setString(1,user.getUsername());
			pstmt.setString(2,user.getPassword());
			pstmt.setString(3,username);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			flag = false;
		}finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				flag = false;
			}
		}
		return flag;
		}
		//增加用户信息
		public boolean addUser(User user) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			boolean flag = true;
			try {
				// 连接数据库
				conn = getDataSourceWithC3p0ByXML().getConnection();
				// sql语句
				String sql = "insert into userinformation values(?,?,?)";
				pstmt = conn.prepareStatement(sql);
				// 传参数
				pstmt.setString(1, user.getUsername());
				pstmt.setString(2, user.getPassword());
				pstmt.setInt(3, user.getLTID());

				int result = pstmt.executeUpdate();

				if (result > 0) {
					System.out.println("增加成功");
					return true;
				} else {
					System.out.println("增加失败");
					return false;
				}

			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			} finally {
				// 关闭连接
				try {
					if (pstmt != null) {
						pstmt.close();
					}
					if (conn != null) {
						conn.close();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();

				}
			}
			return false;
		}
		
}
