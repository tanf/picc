package pers.lqresier.picc.mapper;

import pers.lqresier.picc.condition.DocumentSegCondition;
import pers.lqresier.picc.entity.DocumentSeg;

import java.util.List;

public interface DocumentSegMapper{
	
	List<DocumentSeg> queryByCondition(DocumentSegCondition DocumentSegCondition);//条件查询
	
	Integer isDocumentSegExist(String begin,String end);

	List<DocumentSeg> queryAll();//查询所有

	int add(DocumentSeg documentSeg);//添加

	DocumentSeg query(DocumentSeg documentSeg);//主键查找

	int update(DocumentSeg documentSeg);//修改
}
