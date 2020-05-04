package com.example.community.controller;

import com.example.community.entity.enums.GoodsType;
import com.example.community.entity.po.Goods;
import com.example.community.service.GoodsManageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * 商品管理的控制器
 */
@Controller
@RequestMapping("/admin/goods")
public class GoodsManageController {

    @Resource
    private GoodsManageService goodsManageService;

    /**
     * 查询所有商品
     * @return
     */
    @GetMapping("/listAll")
    public String listAllGoods(Model model){
        model.addAttribute("goodsList",goodsManageService.listAllGoods());
        return "goods/list-for-admin";
    }

    /**
     * 去添加商品
     * @param model
     * @return
     */
    @GetMapping("/toAdd")
    public String toAddGoods(Model model){
        model.addAttribute("goodsTypes", GoodsType.values());
        return "goods/add-goods-modal";
    }

    /**
     * 添加商品
     * @return
     */
    @PostMapping("/add")
    public String add(Goods goods){
        goodsManageService.addOrUpdateOneGoods(goods);
        return "redirect:/admin/goods/listAll";
    }

    /**
     * 去修改商品
     * @return
     */
    @GetMapping("/toEdit")
    public String toEdit(Long goodsId,Model model){
        //商品类型
        model.addAttribute("goodsTypes", GoodsType.values());
        model.addAttribute("goods",goodsManageService.getOneGoods(goodsId));
        return "goods/update-goods-modal";
    }

    /**
     * 修改商品
     * @param goods
     * @return
     */
    @PostMapping("/edit")
    public String edit(Goods goods){
        goodsManageService.addOrUpdateOneGoods(goods);
        return "redirect:/admin/goods/listAll";
    }

    /**
     * 去修改商品库存
     * @param goodsId 商品id
     * @return
     */
    @GetMapping("/toEditCount")
    public String toEditCount(Long goodsId,Model model){
        model.addAttribute("goodsTypes", GoodsType.values());
        model.addAttribute("goods",goodsManageService.getOneGoods(goodsId));
        return "goods/update-goods-count-modal";
    }

    /**
     * 需改库存
     * @param goods 商品实体
     * @return
     */
    @PostMapping("/editCount")
    public String editCount(Goods goods){
        goodsManageService.editGoodsCount(goods);
        return "redirect:/admin/goods/listAll";
    }
}

