package com.sdm.ssm.pos.model.service;

import java.util.List;
import com.sdm.ssm.pos.model.vo.Inventory;
import com.sdm.ssm.pos.model.vo.Menu;

public interface PosService {

    List<Menu> getAllMenus();

    List<Inventory> getAllInventory();

    void updateInventory(Inventory inventory);

    void addMenu(Menu menu);

    void updateMenu(Menu menu);

    void deleteMenu(int id);

    // 추가적인 POS 관련 기능에 대한 메소드를 선언할 수 있습니다.
}