package com.wth.dao;

import com.wth.entity.SuccessKilled;

/**
 * Created by wth on 2019/9/25.
 */
public interface SuccessKilledDao {

    /**
     * 插入购买明细，可过滤重复
     * @param seckillId
     * @param userPhone
     * @return
     * 插入的结果集行数
     */
    int insertSuccessKilled(long seckillId,long userPhone);

    /**
     * 根据ID查询seccesskilled并携带秒杀产品列表
     * @param seckillId
     * @return
     */
    SuccessKilled queryByIdWithSeckill(long seckillId);

}
