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
 */
public class RecordService {
	/**
	 * 通行记录业务逻辑
	 */
	RecordDao dao = new RecordDao();

	// /*根据消费时间查询通行信息*/
	// public List<Record> queryRecordByArrivalTime(String arrivalTime){
	// return dao.queryRecordByArrivalTime(arrivalTime);
	// }

	/* 获取数据总条数 */
	public int getTotalCount(String startTime, String username) {
		return dao.getTotalCount(startTime, username);
	}

	/* 获取当前页面中所有通行记录 */
	public List<Record> getRecordCurrentPage(int currentPage, int pageSize, String startTime, String username) {
		return dao.getRecordCurrentPage(currentPage, pageSize, startTime, username);
	}

	/** 月份查询：按消费时间(startTime)查询 */
	public List<Record> queryRecordByMonStartTime(String username, String plate, String Mouth) {
		return dao.queryRecordByMonStartTime(username, plate, Mouth);
	}

	/** 月份查询：按结算时间(arrivalTime)查询 */
	public List<Record> queryRecordByMonArrivalTime(String username, String plate, String Mouth) {
		return dao.queryRecordByMonArrivalTime(username, plate, Mouth);
	}

	/** 按照结算时间查询 */
	public List<Record> queryRecordByArrivalTime(String username, String plate, String startTimeScope,
			String endTimeScope) {
		/* 起始时间年份 */
		List<Record> records = new ArrayList<Record>();
		List<Record> record1 = new ArrayList<Record>();

		records = dao.queryRecordByPlateUsername(plate, username);
		for (int i = 0; i < records.size(); i++) {
			String arrivaltime = records.get(i).getStarttime();
			/* 遍历获取消费时间 */
			int starttimeTotal = Integer
					.parseInt(arrivaltime.substring(0, 4) + arrivaltime.substring(5, 7) + arrivaltime.substring(8, 10));
			int starttimescope = Integer.parseInt(
					startTimeScope.substring(0, 4) + startTimeScope.substring(5, 7) + startTimeScope.substring(8, 10));
			int endtimescope = Integer.parseInt(
					endTimeScope.substring(0, 4) + endTimeScope.substring(5, 7) + endTimeScope.substring(8, 10));

			if (starttimescope <= starttimeTotal && starttimeTotal <= endtimescope) {
				record1.add(records.get(i));
			}
		}
		return record1;
	}

	/** 按照消费时间查询 **/
	public List<Record> queryRecordByStartTime(String username, String plate, String startTimeScope,
			String endTimeScope) {
		/* 起始时间年份 */
		List<Record> records = new ArrayList<Record>();
		List<Record> record1 = new ArrayList<Record>();

		records = dao.queryRecordByPlateUsername(plate, username);
		System.out.println(records);
		for (int i = 0; i < records.size(); i++) {
			String starttime = records.get(i).getStarttime();
			/* 遍历获取消费时间 */
			int starttime1 = Integer.parseInt(starttime.substring(0, 4));
			System.out.println(starttime1);
			/* 起始时间月份 */
			int starttime2 = Integer.parseInt(starttime.substring(5, 7));
			System.out.println(starttime2);
			/* 起始时间天 */
			int starttime3 = Integer.parseInt(starttime.substring(8, 10));
			System.out.println(starttime3);

			int starttimeTotal = Integer
					.parseInt(starttime.substring(0, 4) + starttime.substring(5, 7) + starttime.substring(8, 10));
			int starttimescope = Integer.parseInt(
					startTimeScope.substring(0, 4) + startTimeScope.substring(5, 7) + startTimeScope.substring(8, 10));
			int endtimescope = Integer.parseInt(
					endTimeScope.substring(0, 4) + endTimeScope.substring(5, 7) + endTimeScope.substring(8, 10));

			if (starttimescope <= starttimeTotal && starttimeTotal <= endtimescope) {
				record1.add(records.get(i));
			}
		}

		return record1;
	}
	
	public List<Record> selectRecord(String username) {
		return dao.selectRecord(username);
	}

	public List<Record> selectByPlate(String plate) {
		return dao.selectByPlate(plate);
	}
}
