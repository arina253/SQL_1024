
--Test3: 16 June 2024
select *from orders$

select [customer name],max([order date]),sales from orders$ 
group by [customer name],sales

select  max(sales) from orders$ where [customer name]='zuschuss carroll'

select  sales from orders$ where [customer name]='zuschuss carroll'
select  max(sales) from orders$ where [customer name]='zuschuss carroll'


select [customer name],max([sales]),sales from orders$ 
group by [customer name],sales

select [customer name],[order id],max(sales) from orders$ group by [customer name],[order id]

select max(sales)from orders$ where [customer name] = 'Dennis Kane'

select [order id],[customer name], max(sales) from orders$ where [customer name] = 'Dennis Kane' group by [customer name], [order id],sales

select[customer name], sales,max([order id]) from orders$ where [customer name] = 'Dennis Kane' group by [customer name], [order id],sales

select sales from orders$ where [customer name] = 'Kalyca Meade'

select distinct count([order date]),[customer name],max(sales) from orders$ group by [customer name]--------------this is the correct query




CREATE TABLE TBLC
(
ID INT
)

CREATE TABLE TBLD
(
ID INT
)

INSERT INTO TBLC VALUES(1)
INSERT INTO TBLC VALUES(2)
INSERT INTO TBLC VALUES(3)
INSERT INTO TBLC VALUES(4)


INSERT INTO TBLD VALUES(3)
INSERT INTO TBLD VALUES(4)
INSERT INTO TBLD VALUES(5)
INSERT INTO TBLD VALUES(6)
INSERT INTO TBLD VALUES(7)
INSERT INTO TBLD VALUES(8)

SELECT *FROM TBLC
SELECT *FROM TBLD

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------