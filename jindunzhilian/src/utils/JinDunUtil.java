package utils;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JinDunUtil {
	/**
	 * 通过C3P0配置文件的方式获取数据源对象
	 * */
	public static ComboPooledDataSource getDataSourceWithC3p0ByXML () {
		ComboPooledDataSource cpds = new ComboPooledDataSource("jindun");
		return cpds;
	}
}
