package pers.lqresier.picc.mapper;

import pers.lqresier.picc.entity.Insurer;

public interface InsurerMapper{
	/**
	 * 通过身份证查找保险人
	 * @param cardCode
	 * @return
	 */
	Insurer queryByCardCode(String cardCode);

	int add(Insurer insurer);//添加
	
}
