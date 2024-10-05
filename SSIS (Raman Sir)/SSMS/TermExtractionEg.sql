ReviewID	ReviewText
1	"The product quality is excellent and the delivery was very fast. Highly recommend it!"
2	"I love the user-friendly interface of this product. The customer service is also great."
3	"Not satisfied with the product. The quality is poor and it stopped working in a week."
4	"Great value for money. The product exceeds my expectations in terms of performance."
5	"The product arrived damaged. The packaging was not sufficient to protect it during transit."

Drop table termreview
CREATE TABLE TERMREVIEW
(
REVIEWID INT not null,
REVIEWTEXT VARCHAR(150)
)

alter table termreview alter column reviewtext nvarchar(max)
alter table termreview add constraint termreview_reviewid primary key (reviewid)

INSERT INTO TERMREVIEW VALUES																	
(1,'The product quality is excellent and the delivery was very fast. Highly recommend it!'),
(2,'I love the user-friendly interface of this product. The customer service is also great.'),
(3,'Not satisfied with the product. The quality is poor and it stopped working in a week.'),
(4,'Great value for money. The product exceeds my expectations in terms of performance.'),
(5,'The product arrived damaged. The packaging was not sufficient to protect it during transit.')

SELECT *FROM TERMREVIEW

CREATE TABLE REVIEWEXCLUSION
(
EXCLUDEDWORD NVARCHAR(50)
)

INSERT INTO REVIEWEXCLUSION VALUES ('THE QUALITY IS POOR')
INSERT INTO REVIEWEXCLUSION VALUES('PRODUCT')


SELECT *FROM TERMREVIEW
SELECT *FROM REVIEWEXCLUSION
