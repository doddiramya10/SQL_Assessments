create table products(prod_id number primary key ,
                       prod_name varchar2(50),
                       price number,
                       stock number)

INSERT INTO products VALUES (101, 'Laptop', 50000, 20);
INSERT INTO products VALUES (102, 'Mobile', 25000, 30);
INSERT INTO products VALUES (103, 'Headphones', 2000, 50);
INSERT INTO products VALUES (104, 'Keyboard', 1500, 40);
INSERT INTO products VALUES (105, 'Mouse', 800, 60);

COMMIT;


CREATE TABLE sales
(
    sale_id       NUMBER PRIMARY KEY,
    product_id    NUMBER,
    quantity      NUMBER,
    total_amount  NUMBER
);

-- ============================================================
-- PROCEDURE 1: ADD PRODUCT
-- ============================================================

-- DROP PROCEDURE add_product;

CREATE OR REPLACE PROCEDURE add_product
(
    p_id    IN NUMBER,
    p_name  IN VARCHAR2,
    p_price IN NUMBER,
    p_stock IN NUMBER
)
AS
BEGIN

    INSERT INTO products
    VALUES (p_id, p_name, p_price, p_stock);

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Product Added');

END;
/

BEGIN
    add_product(106, 'Monitor', 12000, 10);
END;
/

delete from products where PROD_ID = 106


-- ============================================================
-- PROCEDURE 2: UPDATE PRODUCT PRICE
-- ============================================================
create or replace procedure update_product(
    p_id in number,
    p_new_price in number
)
as
begin 
    update PRODUCTS set PRICE = p_new_price
    where PROD_ID = p_id;

    commit;

    DBMS_OUTPUT.PUT_LINE('Price Updated');
end;
/
begin
     update_product(101,55000);
end;
/

-- ============================================================
-- PROCEDURE 3: ADD STOCK
-- ============================================================
create or replace procedure add_stock(
    p_id in number,
    p_stock in number
)
AS
begin
     update PRODUCTS
     set stock = stock+p_stock
     where PROD_ID= p_id;
     
     commit;
end;
/

begin
    add_stock(101,30);
END;
/

-- select * from PRODUCTS

-- ============================================================
-- PROCEDURE 4: MAKE SALE
-- ============================================================

create or replace procedure make_sale(
    p_sale_id in number,
    p_product_id in number,
    p_quantity in number
)
as
   v_price number;
   v_total number;
begin
    select price into v_price
    from PRODUCTS where PROD_ID = p_product_id;
    v_total := p_quantity * v_price;
    
    insert into SALES values(p_sale_id,p_product_id, p_quantity,v_total);

    commit;
    DBMS_OUTPUT.PUT_LINE('Sales Completed');
end;
/
begin
  make_sale(1001,101,2);
end;
/

-- select * from SALES








