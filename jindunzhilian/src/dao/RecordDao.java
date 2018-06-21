package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import entity.Record;
import entity.User;
import utils.JinDunUtil;

/**
 * @author Y1041
 * */

public class RecordDao {
	/**根据消费时间模糊查询详细通行记录*/
//	public List<Record> queryRecordByArrivalTime(String arrivalTime) {
//		/*创建QueryRunner对象查询*/
//		QueryRunner runner = new QueryRunner(JinDunUtil.getDataSourceWithC3p0ByXML());
//		
//		String str = arrivalTime.substring(0,7);
//		String sql = "select * from Record where arrivaltime like '%?%'";
//		Object[] obj= {str};
//		List<Record> records = new ArrayList<Record>();
//		try {
//			/*利用beanListHandler()将record对象封装成为一个list对象*/
//			records = runner.query(sql,obj,new BeanListHandler<Record>(Record.class));
//			return records;
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return null;
//	}
	
	/*获取当前页面中所有通行记录*/
	public List<Record> getRecordCurrentPage(int currentPage,int pageSize,String arrivalTime){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		/*创建QueryRunner对象查询*/
		String str = arrivalTime.substring(0,7);
		String str1 = "%"+str+"%";
		List<Record> records = new ArrayList<Record>();
		try {
		con = JinDunUtil.getDataSourceWithC3p0ByXML ().getConnection();
			String sql = "select * from (select rownum r,t.* from (select s.* from (select * from Record where arrivaltime like ?) s order by arrivaltime asc ) t where rownum<= ? ) where r>= ?";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, str1);
			pstmt.setInt(2, currentPage * pageSize);
			pstmt.setInt(3, (currentPage - 1) * pageSize + 1);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				int LTID = rs.getInt("LTID");
				String plate = rs.getString("plate");
				String startstation = rs.getString("startstation");
				String arrivalstation = rs.getString("arrivalstation");
				String starttime = rs.getString("starttime");
				String arrivaltime = rs.getString("arrivaltime");
				int monetary = rs.getInt("monetary");
				Record record = new Record(LTID, plate, startstation, arrivalstation, starttime, arrivaltime, monetary);
				
				records.add(record);
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		/*QueryRunner runner = new QueryRunner(JinDunUtil.getDataSourceWithC3p0ByXML());
		
		
		
		Object[] obj = {str1,currentPage * pageSize,(currentPage - 1) * pageSize + 1};
		try {
			records = runner.query(sql, obj, new BeanListHandler<Record>(Record.class)) ;
			return records;
		} catch (SQLException e) {
			// TODO Auto-generated catch bloc
			e.printStackTrace();
		}*/
		return records;
	}

	
	/**获取数据总条数*/
	public int getTotalCount(String arrivaltime) {
		/*创建QueryRunner对象查询*/
		QueryRunner runner = new QueryRunner(JinDunUtil.getDataSourceWithC3p0ByXML());
		String str = arrivaltime.substring(0,7);
		String str1 = "%"+str+"%";
		String sql = "select count(1) count from (select * from Record where arrivaltime like ?)";
		Object[] obj = {str1};
		try {
			Object result = runner.query(sql,obj, new ScalarHandler());
			return  (Integer.parseInt(result.toString()));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
}	
