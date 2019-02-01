package pers.lqresier.picc.mapper;

import pers.lqresier.picc.condition.DocumentCondition;
import pers.lqresier.picc.entity.Document;
import pers.lqresier.picc.entity.DocumentSeg;
import pers.lqresier.picc.entity.User;
import pers.lqresier.picc.vo.DocumentSegVO;
import pers.lqresier.picc.vo.DocumentUseVO;
import pers.lqresier.picc.vo.DocumentUseVOTemp;
import pers.lqresier.picc.vo.DocumentVO;

import java.util.List;

public interface DocumentMapper{
	List<?> queryByCondition(DocumentCondition DocumentCondition);//条件查询

	/**
	 * 批量更新单证
	 * @param beginNum
	 * @param endNum
	 * @param status
	 */
	int updateBatchDocument(String beginNum, String endNum, Integer status);

	/**
	 * 获取用户最新可用的单证
	 * @param user
	 * @return
	 */
	Document getLatestDocument(User user);

	/**
	 * 按条件查找未使用完的单证展示信息
	 * @param documentCondition
	 * @return
	 */
	List<DocumentVO> queryUnfinishDocumentVOByCondition(DocumentCondition documentCondition);

	/**
	 * 按条件查找使用完的单证展示信息
	 * @param documentCondition
	 * @return
	 */
	List<DocumentVO> queryFinishDocumentVOByCondition(DocumentCondition documentCondition);

	/**
	 * 查询停用、丢失、废弃的单证号段
	 * @param beginNum
	 * @param endNum
	 * @param status
	 * @return
	 */
	List<DocumentSegVO> queryDocumentSegVO(String beginNum, String endNum, Integer status);
	
	/**
	 * 查询使用情况
	 * @param format 自定义日期数据格式
	 * @param date	指定时间或当前时间
	 * @return
	 */
	List<DocumentUseVOTemp> queryData(String format, String date);
	
	int add(Document document);//添加

	int update(Document document);//修改
}
