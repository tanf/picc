package pers.lqresier.picc.mapper;

import pers.lqresier.picc.entity.Website;
import java.util.List;

public interface WebsiteMapper{
    List<Website> queryAll();//查询所有
    int update(Website website);//修改
    int add(Website website);//添加
}
