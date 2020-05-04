package com.example.community.service.impl;

import com.example.community.entity.po.Goods;
import com.example.community.repository.GoodsRepository;
import com.example.community.service.GoodsManageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import javax.xml.bind.DatatypeConverter;
import java.io.IOException;
import java.util.List;


/**
 * 商品管理业务实现
 */
@Service
public class GoodsManageServiceImpl implements GoodsManageService {
    @Resource
    private GoodsRepository goodsRepository;

    /**
     * 查询所有商品
     *
     * @return
     */
    @Override
    public List<Goods> listAllGoods() {
        return goodsRepository.findAll();
    }

    /**
     * 添加或修改一个商品
     *
     * @param goods
     */
    @Override
    @Transactional
    public void addOrUpdateOneGoods(Goods goods) {
        if(ObjectUtils.isEmpty(goods.getId())){//新增
            //图片转为base64
            try {
                goods.setImage("data:image/jpeg;base64,"+ DatatypeConverter.printBase64Binary(goods.getImageFile().getBytes()));
            } catch (Exception e) {
                e.printStackTrace();
            }
            goodsRepository.save(goods);
        }else{//修改
            Goods dbGoods = goodsRepository.getOne(goods.getId());
            dbGoods.setName(goods.getName());
            dbGoods.setType(goods.getType());
            dbGoods.setUnitPrice(goods.getUnitPrice());
            dbGoods.setDescribe(goods.getDescribe());
            //上传了图片才修改图片
            if(!ObjectUtils.isEmpty(goods.getImageFile().getOriginalFilename())){
                try {
                    dbGoods.setImage("data:image/jpeg;base64,"+DatatypeConverter.printBase64Binary(goods.getImageFile().getBytes()));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            goodsRepository.save(dbGoods);
        }
    }

    /**
     * 查询获取一个商品
     *
     * @param goodsId 商品id
     * @return
     */
    @Override
    public Goods getOneGoods(Long goodsId) {
        return goodsRepository.findById(goodsId).orElseThrow(RuntimeException::new);
    }

    /**
     * 修改商品库存
     *
     * @param goods
     */
    @Override
    @Transactional
    public void editGoodsCount(Goods goods) {
        Goods dbGoods = goodsRepository.getOne(goods.getId());
        dbGoods.setCount(goods.getCount());
        goodsRepository.save(dbGoods);
    }

}
