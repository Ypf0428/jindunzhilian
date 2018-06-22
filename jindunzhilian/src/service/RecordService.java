package service;

import java.util.List;

import dao.RecordDao;
import entity.Record;

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
	
	/**按照结算时间查询*/
	public List<Record> queryRecordByArrivalTime(String username,String plate,String startTimeScope,String endTimeScope){
		return dao.queryRecordByArrivalTime(username, plate, startTimeScope, endTimeScope);
	}
	
	/**按照消费时间查询**/
	public List<Record> queryRecordByStartTime(String username,String plate,String startTimeScope,String endTimeScope){
		return dao.queryRecordByStartTime(username, plate, startTimeScope, endTimeScope);
	}
}
