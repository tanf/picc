package pers.lqresier.picc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.lqresier.picc.condition.DocumentSegCondition;
import pers.lqresier.picc.entity.Document;
import pers.lqresier.picc.entity.DocumentSeg;
import pers.lqresier.picc.entity.User;
import pers.lqresier.picc.exception.DocumentSegIsExistException;
import pers.lqresier.picc.mapper.DocumentMapper;
import pers.lqresier.picc.mapper.DocumentSegMapper;
import pers.lqresier.picc.mapper.UserMapper;
import pers.lqresier.picc.service.DocumentSegService;

import java.sql.Timestamp;
import java.util.List;

@Transactional
@Service
public class DocumentSegServiceImpl implements DocumentSegService {

    @Autowired
    private DocumentSegMapper documentSegMapper;
    @Autowired
    private DocumentMapper documentMapper;
    @Autowired
    private UserMapper userMapper;

    @SuppressWarnings("unchecked")
    @Override
    public List<DocumentSeg> queryDocumentSegByDocumentSegCondition(DocumentSegCondition documentSegCondition) throws Exception {
        List<DocumentSeg> list = documentSegMapper.queryByCondition(documentSegCondition);
        if (list == null || list.size() == 0) {
            return null;
        }
        return list;
    }

    @SuppressWarnings("unchecked")
    @Override
    public boolean addDocumentSeg(DocumentSeg documentSeg, User allocator) throws DocumentSegIsExistException, Exception {
        // 要验证
        Long begin = Long.parseLong(documentSeg.getBeginNum());
        Long end = Long.parseLong(documentSeg.getEndNum());
        // 1.验证领取的起始及结束号段大小关系及差是否为200的整数倍
        boolean addCondition1 = (begin <= end && (end - begin + 1) % 200 == 0);
        if (!addCondition1) {
            return false;
        }
        List<DocumentSeg> allSeg = null;
        allSeg = (List<DocumentSeg>) documentSegMapper.queryAll();
        // 2.判断号段表是否已存在

        Integer count = documentSegMapper.isDocumentSegExist(documentSeg.getBeginNum(), documentSeg.getEndNum());
        if (count != 0) {
            throw new DocumentSegIsExistException();
        }
//			for (DocumentSeg sb : allSeg) {
//				// 一定是&而不是&&
//				boolean addCondition2 = (begin >= Long.parseLong(sb.getBeginNum()) & end <= Long.parseLong(sb.getEndNum()));	
//				if (addCondition2) {
//					return false;
//				}
//			}
        Timestamp createTime = new Timestamp(System.currentTimeMillis());
        documentSeg.setCreateTime(createTime);
        documentSeg.setStatus(0);
        documentSeg.setAllotNum("未使用");
        documentSeg.setAllocator(allocator);
        // 3.添加领取号段到号段表中
        int executeNum = documentSegMapper.add(documentSeg);
        return executeNum > 0 ? true : false;
    }

    @Override
    public boolean privodeDocument(Integer documentSegId, String endNum, User user, User allocator) throws Exception {

//		发放单证
//		要将发放的所有单证号段添加到单证表中
//		要修改已分配号段
//		判断输入的结束号段是否大于领取号段，如果大于，就发放失败
//		如果单证号段发放完毕，要修改号段的状态为1，即已分配完

        DocumentSeg documentSeg = new DocumentSeg();
        documentSeg.setId(documentSegId);
        DocumentSeg documentSeg2 = documentSegMapper.query(documentSeg);
        //获得要添加的单证号段
        Long segEndNum = Long.parseLong(documentSeg2.getEndNum());//号段表结束号段
        Long segBeginNum = Long.parseLong(documentSeg2.getBeginNum());//号段表起始号段

        //要发放的起始值
        Long privodeStartNum = null;
        if (documentSeg2.getAllotNum().equals("未使用")) {
            privodeStartNum = segBeginNum;
        } else {
            privodeStartNum = Long.parseLong(documentSeg2.getAllotNum()) + 1;
        }
        Long privodeEndNum = Long.parseLong(endNum);//要发放的结束值

        //判断起始号和结尾号的大小及差是否为两百的倍数和状态
        boolean privodeCondition = privodeStartNum < privodeEndNum && (privodeEndNum - privodeStartNum + 1) % 200 == 0 && documentSeg2.getStatus() == 0;
        if (!privodeCondition) {
            return false;
        }

        //设置要添加的单证的相关属性
        Document document = new Document();
        Timestamp privodeTime = new Timestamp(System.currentTimeMillis());
        user = userMapper.query(user);
        String name = user.getName();
        document.setSeg(documentSeg);
        document.setUserName(name);
        document.setUser(user);
        document.setCreateTime(privodeTime);
        document.setSeg(documentSeg);
        document.setStatus(0);

        allocator = userMapper.query(allocator);
        document.setAllocator(allocator);
        document.setAllocatorName(allocator.getName());

        //添加到单证表
        document.setUseTime(null);
        while (privodeStartNum <= privodeEndNum) {

            document.setNum(String.valueOf(privodeStartNum));
            documentMapper.add(document);
            ++privodeStartNum;
        }
//			System.out.println("privodeStartNum=="+privodeStartNum);

        //修改已分配号段
//			System.out.println("修改已分配号段=="+privodeEndNum);
        documentSeg.setAllotNum(String.valueOf(privodeEndNum));
        int executeNum = documentSegMapper.update(documentSeg);

        //判断号段是否已分配完
        if (privodeStartNum - 1 == segEndNum) {
            documentSeg.setStatus(1);
            documentSegMapper.update(documentSeg);
        }
        return executeNum > 0 ? true : false;
    }

    @Override
    public DocumentSeg querDocumentSegyById(int id) throws Exception {
        DocumentSeg documentSeg = new DocumentSeg();
        documentSeg.setId(id);
        DocumentSeg result = documentSegMapper.query(documentSeg);
        return result;
    }
}
