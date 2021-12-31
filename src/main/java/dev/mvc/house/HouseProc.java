package dev.mvc.house;
 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
 
@Component("dev.mvc.house.HouseProc")
public class HouseProc implements HouseProcInter {

  @Autowired 
  private HouseDAOInter houseDAO;

@Override
public int create(HouseVO houseVO) {
    int cnt = houseDAO.create(houseVO);

    return cnt;
}

@Override
public List<HouseVO> list_houseno_asc() {
    // TODO Auto-generated method stub
    return null;
}

@Override
public List<HouseVO> list_price_asc() {
    // TODO Auto-generated method stub
    return null;
}

@Override
public HouseVO read(int houseno) {
    // TODO Auto-generated method stub
    return null;
}

@Override
public int update(HouseVO houseVO) {
    // TODO Auto-generated method stub
    return 0;
}

  


}