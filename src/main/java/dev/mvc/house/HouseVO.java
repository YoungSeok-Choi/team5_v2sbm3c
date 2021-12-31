package dev.mvc.house;

import org.springframework.web.multipart.MultipartFile;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
/*
houseno NUMERIC(10) NOT NULL PRIMARY KEY,
nomination VARCHAR(30) NOT NULL,
area INTEGER NOT NULL,
terrain VARCHAR(30),
price INT NOT NULL,
hdate DATE NOT NULL,
likes INT NOT NULL,
himage VARCHAR(100) NOT NULL,
loca VARCHAR(100) NOT NULL,
adminid NUMERIC(10) NOT NULL,
hname VARCHAR(100) NOT NULL,
*/
@Getter @Setter @ToString
public class HouseVO {
  private int houseno;
  private String nomination = "";
  private String area = "";
  private String terrain = "";
  private int price;
  private String hdate = "";
  private int likes;
  private String himage = "";
  private String loca = "";
  private int adminid;
  private String hname = "";
  
  public HouseVO() {
      
  }
  
  public HouseVO(int houseno, String hname, int price, String hdate) {
      this.houseno = houseno;
      this.hname = hname;
      this.price = price;
      this.hdate = hdate;
  }
}