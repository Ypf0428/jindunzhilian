package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import dao.RecordDao;
import entity.Record;
import utils.JinDunUtil;

/**
 * @author Y1041
 * */
public class RecordService {
	/**
	 * 通行记录业务逻辑
	 * */
	RecordDao dao = new RecordDao();
	
//	/*根据消费时间查询通行信息*/
//	public List<Record> queryRecordByArrivalTime(String arrivalTime){
//		return dao.queryRecordByArrivalTime(arrivalTime);
//	}
	
	/*获取数据总条数*/
	public int getTotalCount(String startTime,String username) {
		return dao.getTotalCount(startTime,username);
	}
	
	/*获取当前页面中所有通行记录*/
	public List<Record> getRecordCurrentPage(int currentPage,int pageSize,String startTime,String username){
		return dao.getRecordCurrentPage(currentPage, pageSize, startTime,username);
	}
	
	/**月份查询：按消费时间(startTime)查询*/
	public List<Record> queryRecordByMonStartTime(String username,String plate,String Mouth){
		return dao.queryRecordByMonStartTime(username, plate, Mouth);
	}
	/**月份查询：按结算时间(arrivalTime)查询*/
	public List<Record> queryRecordByMonArrivalTime(String username,String plate,String Mouth){
		return dao.queryRecordByMonArrivalTime(username, plate, Mouth);
	}
}
