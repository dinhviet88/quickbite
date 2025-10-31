CREATE TABLE restaurant (
  id varchar(100) PRIMARY KEY,
  name varchar(100) NOT NULL,
  tags varchar(50)
);

CREATE TABLE menu_item (
  id varchar(100) PRIMARY KEY,
  restaurant_id varchar(100) REFERENCES restaurant(id),
  name varchar(100) NOT NULL,
  price NUMERIC(10, 2) NOT NULL
);

insert into restaurant(id,name,tags) values
 ('r_kitchen','Rocket Kitchen','burgers,fries'),
 ('sushi_go','Sushi Go','sushi,japanese');

insert into menu_item(id,restaurant_id,name,price) values
 ('m_burger','r_kitchen','Classic Burger',5.99),
 ('m_fries','r_kitchen','Fries',2.49),
 ('m_roll','sushi_go','Salmon Roll',6.49);

