package pers.lqresier.picc.service;

import pers.lqresier.picc.condition.DocumentCondition;
import pers.lqresier.picc.entity.Document;
import pers.lqresier.picc.vo.DocumentSegVO;
import pers.lqresier.picc.vo.DocumentUseVO;
import pers.lqresier.picc.vo.DocumentVO;

import java.util.List;

public interface DocumentService extends Service {
	/**
	 * 根据DocumentCondition查询单证
	 * @param documentCondition
	 * @return
	 */
	List<Document> queryDocumentByDocumentCondition(DocumentCondition documentCondition) throws Exception;
	
	/**
	 * 修改单证
	 * 要根据号段批量修改
	 * @param beginNum 起始号
	 * @param endNum 结束号
	 * @param status 状态
	 * @return
	 */
	boolean updateBatchDocument(String beginNum, String endNum, Integer status) throws Exception;
	
	/**
	 * 根据DocumentCondition查询单证展示信息
	 * @param documentCondition
	 * @return
	 */
	List<DocumentVO> queryDocumentVoByDocumentCondition(DocumentCondition documentCondition) throws Exception;

	/**
	 * 查询停用、丢失、废弃的单证号段
	 * @param beginNum
	 * @param endNum
	 * @param status
	 * @return
	 */
	List<DocumentSegVO> queryDocumentSegVO(String beginNum, String endNum, Integer status) throws Exception;
	
	/**
	 * 查询本月使用情况
	 * @return
	 */
	List<DocumentUseVO> queryData(String format, String date) throws Exception;
	

}
