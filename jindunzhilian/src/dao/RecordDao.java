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
	public List<Record> getRecordCurrentPage(int currentPage,int pageSize,String startTime,String username){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		/*创建QueryRunner对象查询*/
		String str = startTime.substring(0,7);
		String str1 = "%"+str+"%";
		List<Record> records = new ArrayList<Record>();
		try {
		con = JinDunUtil.getDataSourceWithC3p0ByXML ().getConnection();
			String sql = "select * from (select rownum r,t.* from (select s.* from (select * from Record where starttime like ? and LTID=(select LTID from userinformation where username=?)) s order by starttime asc ) t where rownum<= ? ) where r>= ?";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, str1);
			pstmt.setString(2, username);
			pstmt.setInt(3, currentPage * pageSize);
			pstmt.setInt(4, (currentPage - 1) * pageSize + 1);
			
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
	public int getTotalCount(String starttime,String username) {
		/*创建QueryRunner对象查询*/
		QueryRunner runner = new QueryRunner(JinDunUtil.getDataSourceWithC3p0ByXML());
		String str = starttime.substring(0,7);
		String str1 = "%"+str+"%";
		String sql = "select count(1) count from (select * from Record where starttime like ? and LTID=(select LTID from userinformation where username=?))";
		Object[] obj = {str1,username};
		try {
			Object result = runner.query(sql, new ScalarHandler(),obj);
			return  (Integer.parseInt(result.toString()));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	/**
	 * @author Y1041
	 * */
	/**按消费时间查询*/
	public List<Record> queryRecordByArrivalTime(String username,String plate,String startTimeScope,String endTimeScope){
		QueryRunner runner = new QueryRunner(JinDunUtil.getDataSourceWithC3p0ByXML());
		List<Record> record = new ArrayList<Record>();
		String sql = "select * from record where ";
		Object[] obj = {};
		try {
			record = runner.query(sql, new BeanListHandler<Record>(Record.class),obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return record;
	}
	
	/**
	 * @author Y1041
	 * */
	/**月份查询：按消费时间(startTime)查询*/
	public List<Record> queryRecordByMonStartTime(String username,String plate,String Mouth){
		QueryRunner runner = new QueryRunner(JinDunUtil.getDataSourceWithC3p0ByXML());
		List<Record> records = new ArrayList<Record>();
		String sql = "select * from record where LTID=(select LTID from userinformation where username=?)and plate=?  and starttime like ?";
		Object[] obj = {username,plate,Mouth};
		try {
			records = runner.query(sql, new BeanListHandler<Record>(Record.class),obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return records;
	}
	/**月份查询：按结算时间(arrivalTime)查询*/
	public List<Record> queryRecordByMonArrivalTime(String username,String plate,String Mouth){
		QueryRunner runner = new QueryRunner(JinDunUtil.getDataSourceWithC3p0ByXML());
		List<Record> records = new ArrayList<Record>();
		String sql = "select * from record where LTID=(select LTID from userinformation where username=?)and plate=?  and arrivaltime like ?";
		Object[] obj = {username,plate,Mouth};
		try {
			records = runner.query(sql, new BeanListHandler<Record>(Record.class),obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return records;
	}
}	
