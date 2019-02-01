package pers.lqresier.picc.service.impl;


import ch.qos.logback.core.db.dialect.DBUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.lqresier.picc.condition.DocumentCondition;
import pers.lqresier.picc.entity.Document;
import pers.lqresier.picc.mapper.DocumentMapper;
import pers.lqresier.picc.service.DocumentService;
import pers.lqresier.picc.vo.DocumentSegVO;
import pers.lqresier.picc.vo.DocumentUseVO;
import pers.lqresier.picc.vo.DocumentUseVOTemp;
import pers.lqresier.picc.vo.DocumentVO;

import java.util.ArrayList;
import java.util.List;

@Transactional
@Service
public class DocumentServiceImpl implements DocumentService {
    @Autowired
    private DocumentMapper documentMapper;

    @SuppressWarnings("unchecked")
    @Override
    public List<Document> queryDocumentByDocumentCondition(DocumentCondition documentCondition) throws Exception {
        List<Document> list = (List<Document>) documentMapper.queryByCondition(documentCondition);
        if(list==null||list.size()==0){
            return null;
        }
        return list;
    }

    @Override
    public boolean updateBatchDocument(String beginNum, String endNum, Integer status) throws Exception {
        int executeNum=documentMapper.updateBatchDocument(beginNum, endNum, status);
        return executeNum>0?true:false;
    }

    @Override
    public List<DocumentVO> queryDocumentVoByDocumentCondition(DocumentCondition documentCondition) throws Exception {
        List<DocumentVO> list = null;
        if(documentCondition==null){documentCondition=new DocumentCondition();}
        if (documentCondition.getStatus() == null) {
            list = documentMapper.queryUnfinishDocumentVOByCondition(documentCondition);
            list.addAll(documentMapper.queryFinishDocumentVOByCondition(documentCondition));
        } else if (documentCondition.getStatus() == 0) {
            //只查使用中
            list = documentMapper.queryUnfinishDocumentVOByCondition(documentCondition);
        } else if (documentCondition.getStatus() == 1) {
            //只查使用完
            list = documentMapper.queryFinishDocumentVOByCondition(documentCondition);
        }
        if(list==null||list.size()==0){
            return null;
        }
        return list;
    }

    @Override
    public List<DocumentSegVO> queryDocumentSegVO(String beginNum, String endNum, Integer status) throws Exception {
        List<DocumentSegVO> segVOList = null;
        segVOList = documentMapper.queryDocumentSegVO(beginNum, endNum, status);
        if (segVOList == null || segVOList.size() == 0) {
            return null;
        }
        return segVOList;
    }

    @Override
    public List<DocumentUseVO> queryData(String format, String date) throws Exception {
        List<DocumentUseVOTemp> monthDataLsit = documentMapper.queryData(format, date);
        List<DocumentUseVO> monthDataLsit2 = new ArrayList<DocumentUseVO>();
        DocumentUseVO documentUseVO2 = null;

        for (int i = 0; i < monthDataLsit.size() - 1; i++) {
            if (monthDataLsit.get(i).getName().equals(monthDataLsit.get(i + 1).getName())) {
                if (monthDataLsit.get(i).getDate().equals(monthDataLsit.get(i + 1).getDate())) {
                    documentUseVO2 = new DocumentUseVO();
                    documentUseVO2.setDate(monthDataLsit.get(i).getDate());
                    for(int j=0;j<2;j++){
                        DocumentUseVOTemp temp=monthDataLsit.get(i+j);
                        setStatusNumForDocumentUseVO(documentUseVO2,temp);
                    }
                    documentUseVO2.setName(monthDataLsit.get(i + 1).getName());
                    monthDataLsit2.add(documentUseVO2);
                } else {
                    if (i >= 1 && monthDataLsit.get(i).getDate().equals(monthDataLsit.get(i - 1).getDate())) {
                        continue;
                    } else {
                        documentUseVO2 = new DocumentUseVO();
                        DocumentUseVOTemp temp=monthDataLsit.get(i);
                        documentUseVO2.setDate(temp.getDate());
                        documentUseVO2.setName(temp.getName());
                        setStatusNumForDocumentUseVO(documentUseVO2,temp);
                        monthDataLsit2.add(documentUseVO2);
                    }

                }
            } else if (!monthDataLsit.get(i).getName().equals(monthDataLsit.get(i + 1).getName())) {
                if (i >= 1 && monthDataLsit.get(i).getDate().equals(monthDataLsit.get(i - 1).getDate())) {
                    continue;
                }
                documentUseVO2 = new DocumentUseVO();
                documentUseVO2.setDate(monthDataLsit.get(i).getDate());
                documentUseVO2.setName(monthDataLsit.get(i).getName());
                setStatusNumForDocumentUseVO(documentUseVO2,monthDataLsit.get(i));
                monthDataLsit2.add(documentUseVO2);
            }
        }

        if (monthDataLsit.size() >= 2 && !monthDataLsit.get(monthDataLsit.size() - 1).getName().equals(monthDataLsit.get(monthDataLsit.size() - 2).getName())) {
            documentUseVO2 = new DocumentUseVO();
            documentUseVO2.setDate(monthDataLsit.get(monthDataLsit.size() - 1).getDate());
            documentUseVO2.setName(monthDataLsit.get(monthDataLsit.size() - 1).getName());
            setStatusNumForDocumentUseVO(documentUseVO2,monthDataLsit.get(monthDataLsit.size() - 1));
            monthDataLsit2.add(documentUseVO2);
        } else if (monthDataLsit.size() == 1) {
            documentUseVO2 = new DocumentUseVO();
            documentUseVO2.setDate(monthDataLsit.get(0).getDate());
            documentUseVO2.setName(monthDataLsit.get(0).getName());
            setStatusNumForDocumentUseVO(documentUseVO2,monthDataLsit.get(0));
            monthDataLsit2.add(documentUseVO2);
        } else if (monthDataLsit.size() == 0) {
            documentUseVO2 = new DocumentUseVO();
            monthDataLsit2.add(documentUseVO2);
        }
        return monthDataLsit2;
    }

    /**
     *将各状态的单证数量赋给DocumentUseVO
     */
    private void setStatusNumForDocumentUseVO(DocumentUseVO vo,DocumentUseVOTemp temp){
        switch(temp.getStatus()){
            case 0:
                vo.setUsed(temp.getNum());
                break;
            case 2:
                vo.setDisuse(temp.getNum());
                break;
            case 3:
                vo.setInvalid(temp.getNum());
                break;
            case 4:
                vo.setLost(temp.getNum());
                break;
            default:
                break;
        }
    }

}
