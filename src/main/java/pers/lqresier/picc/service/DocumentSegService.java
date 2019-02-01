package pers.lqresier.picc.service;
import pers.lqresier.picc.condition.DocumentSegCondition;
import pers.lqresier.picc.entity.DocumentSeg;
import pers.lqresier.picc.entity.User;
import pers.lqresier.picc.exception.DocumentSegIsExistException;

import java.util.List;

public interface DocumentSegService extends Service {
	
	/**
	 * 根据DocumentSegCondition查询单证号段
	 * @return
	 */
	List<DocumentSeg> queryDocumentSegByDocumentSegCondition(DocumentSegCondition documentSegCondition) throws Exception;
	
	/**
	 * 领用单证号段
	 * 验证
	 * 里面要添加发放员和发放时间
	 * @param documentSeg
	 * @return
	 * @throws DocumentSegIsExistException 
	 */
	boolean addDocumentSeg(DocumentSeg documentSeg, User allocator) throws DocumentSegIsExistException,Exception;
	
	/**
	 * 发放单证
	 * 要将发放的所有单证号段添加到单证表中
	 * 要修改已分配号段
	 * 判断输入的结束号段是否大于领取号段，如果大于，就发放失败
	 * 如果单证号段发放完毕，要修改号段的状态为1，即已分配完
	 * @return
	 */
	boolean privodeDocument(Integer documentSegId, String endNum, User user, User allocator) throws Exception;

	/**
	 * 通过id查询单证号段
	 * @return
	 */
	DocumentSeg querDocumentSegyById(int id) throws Exception;
}
