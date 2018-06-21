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
	public int getTotalCount(String arrivalTime,String username) {
		return dao.getTotalCount(arrivalTime,username);
	}
	
	/*获取当前页面中所有通行记录*/
	public List<Record> getRecordCurrentPage(int currentPage,int pageSize,String arrivalTime,String username){
		return dao.getRecordCurrentPage(currentPage, pageSize, arrivalTime,username);
	}
}
