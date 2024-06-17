CREATE OR REPLACE DATABASE bde_at_1;
USE DATABASE bde_at_1;

//creating storage integration
CREATE OR REPLACE STORAGE INTEGRATION azure_bde_at_1
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = AZURE
  ENABLED = TRUE
  AZURE_TENANT_ID = 'e8911c26-cf9f-4a9c-878e-527807be8791' //directory ID
  STORAGE_ALLOWED_LOCATIONS = ('azure://utsbdeat1.blob.core.windows.net/bde-at1'); 
  //^URL where 'azure://{storage account name}.blob.core.windows.net/{storage container name}'

//describe storage integration
DESC STORAGE INTEGRATION azure_bde_at_1;

//creating stage
CREATE OR REPLACE STAGE stage_bde_at_1
STORAGE_INTEGRATION = azure_bde_at_1
URL='azure://utsbdeat1.blob.core.windows.net/bde-at1'; 

list @stage_bde_at_1;

CREATE OR REPLACE EXTERNAL TABLE ex_table_trending_columns_name
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = (TYPE=CSV)
PATTERN = 'BR_youtube_trending_data.csv';

SELECT * 
FROM BDE_AT_1.PUBLIC.ex_table_trending_columns_name
LIMIT 1;


CREATE OR REPLACE FILE FORMAT file_format_csv 
TYPE = 'CSV' 
FIELD_DELIMITER = ',' 
SKIP_HEADER = 1
NULL_IF = ('\\N', 'NULL', 'NUL', '')
FIELD_OPTIONALLY_ENCLOSED_BY = '"';


CREATE OR REPLACE EXTERNAL TABLE ex_BR_trending
(video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt datetime as (value:c3::datetime),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId int as (value:c6::int),    
trending_date date as (value:c7::date),     
view_count int as (value:c8::int),
likes int as (value:c9::int),
dislikes int as (value:c10::int),
comment_count int as (value:c11::int),
comments_disabled boolean as (value:c12::boolean),
country varchar as 'BR')
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = file_format_csv
PATTERN = 'BR_youtube_trending_data.csv';


CREATE OR REPLACE EXTERNAL TABLE ex_CA_trending
(video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt datetime as (value:c3::datetime),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId int as (value:c6::int),    
trending_date date as (value:c7::date),     
view_count int as (value:c8::int),
likes int as (value:c9::int),
dislikes int as (value:c10::int),
comment_count int as (value:c11::int),
comments_disabled boolean as (value:c12::boolean),
country varchar as 'CA')
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = file_format_csv
PATTERN = 'CA_youtube_trending_data.csv';


CREATE OR REPLACE EXTERNAL TABLE ex_DE_trending
(video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt datetime as (value:c3::datetime),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId int as (value:c6::int),    
trending_date date as (value:c7::date),     
view_count int as (value:c8::int),
likes int as (value:c9::int),
dislikes int as (value:c10::int),
comment_count int as (value:c11::int),
comments_disabled boolean as (value:c12::boolean),
country varchar as 'DE')
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = file_format_csv
PATTERN = 'DE_youtube_trending_data.csv';


CREATE OR REPLACE EXTERNAL TABLE ex_FR_trending
(video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt datetime as (value:c3::datetime),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId int as (value:c6::int),    
trending_date date as (value:c7::date),     
view_count int as (value:c8::int),
likes int as (value:c9::int),
dislikes int as (value:c10::int),
comment_count int as (value:c11::int),
comments_disabled boolean as (value:c12::boolean),
country varchar as 'FR')
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = file_format_csv
PATTERN = 'FR_youtube_trending_data.csv';


CREATE OR REPLACE EXTERNAL TABLE ex_GB_trending
(video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt datetime as (value:c3::datetime),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId int as (value:c6::int),    
trending_date date as (value:c7::date),     
view_count int as (value:c8::int),
likes int as (value:c9::int),
dislikes int as (value:c10::int),
comment_count int as (value:c11::int),
comments_disabled boolean as (value:c12::boolean),
country varchar as 'GB')
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = file_format_csv
PATTERN = 'GB_youtube_trending_data.csv';


CREATE OR REPLACE EXTERNAL TABLE ex_IN_trending
(video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt datetime as (value:c3::datetime),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId int as (value:c6::int),    
trending_date date as (value:c7::date),     
view_count int as (value:c8::int),
likes int as (value:c9::int),
dislikes int as (value:c10::int),
comment_count int as (value:c11::int),
comments_disabled boolean as (value:c12::boolean),
country varchar as 'IN')
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = file_format_csv
PATTERN = 'IN_youtube_trending_data.csv';


CREATE OR REPLACE EXTERNAL TABLE ex_JP_trending
(video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt datetime as (value:c3::datetime),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId int as (value:c6::int),    
trending_date date as (value:c7::date),     
view_count int as (value:c8::int),
likes int as (value:c9::int),
dislikes int as (value:c10::int),
comment_count int as (value:c11::int),
comments_disabled boolean as (value:c12::boolean),
country varchar as 'JP')
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = file_format_csv
PATTERN = 'JP_youtube_trending_data.csv';


CREATE OR REPLACE EXTERNAL TABLE ex_KR_trending
(video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt datetime as (value:c3::datetime),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId int as (value:c6::int),    
trending_date date as (value:c7::date),     
view_count int as (value:c8::int),
likes int as (value:c9::int),
dislikes int as (value:c10::int),
comment_count int as (value:c11::int),
comments_disabled boolean as (value:c12::boolean),
country varchar as 'KR')
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = file_format_csv
PATTERN = 'KR_youtube_trending_data.csv';


CREATE OR REPLACE EXTERNAL TABLE ex_MX_trending
(video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt datetime as (value:c3::datetime),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId int as (value:c6::int),    
trending_date date as (value:c7::date),     
view_count int as (value:c8::int),
likes int as (value:c9::int),
dislikes int as (value:c10::int),
comment_count int as (value:c11::int),
comments_disabled boolean as (value:c12::boolean),
country varchar as 'MX')
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = file_format_csv
PATTERN = 'MX_youtube_trending_data.csv';


CREATE OR REPLACE EXTERNAL TABLE ex_RU_trending
(video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt datetime as (value:c3::datetime),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId int as (value:c6::int),    
trending_date date as (value:c7::date),     
view_count int as (value:c8::int),
likes int as (value:c9::int),
dislikes int as (value:c10::int),
comment_count int as (value:c11::int),
comments_disabled boolean as (value:c12::boolean),
country varchar as 'RU')
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = file_format_csv
PATTERN = 'RU_youtube_trending_data.csv';


CREATE OR REPLACE EXTERNAL TABLE ex_US_trending
(video_id varchar as (value:c1::varchar), 
title varchar as (value:c2::varchar),
publishedAt datetime as (value:c3::datetime),
channelId varchar as (value:c4::varchar),
channelTitle varchar as (value:c5::varchar),
categoryId int as (value:c6::int),    
trending_date date as (value:c7::date),     
view_count int as (value:c8::int),
likes int as (value:c9::int),
dislikes int as (value:c10::int),
comment_count int as (value:c11::int),
comments_disabled boolean as (value:c12::boolean),
country varchar as 'US')
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = file_format_csv
PATTERN = 'US_youtube_trending_data.csv';


CREATE TABLE table_youtube_trending AS
SELECT * from EX_BR_TRENDING UNION ALL
SELECT * from EX_DE_TRENDING UNION ALL
SELECT * from EX_CA_TRENDING UNION ALL
SELECT * from EX_FR_TRENDING UNION ALL
SELECT * from EX_GB_TRENDING UNION ALL
SELECT * from EX_IN_TRENDING UNION ALL
SELECT * from EX_JP_TRENDING UNION ALL
SELECT * from EX_KR_TRENDING UNION ALL
SELECT * from EX_MX_TRENDING UNION ALL
SELECT * from EX_RU_TRENDING UNION ALL
SELECT * from EX_US_TRENDING;

//dropping value column
ALTER TABLE table_youtube_trending
DROP COLUMN value;

  
//jsons as external table
CREATE OR REPLACE EXTERNAL TABLE ex_BR_category
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'BR_category_id.json';

CREATE OR REPLACE EXTERNAL TABLE ex_CA_category
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'CA_category_id.json';

CREATE OR REPLACE EXTERNAL TABLE ex_DE_category
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'DE_category_id.json';

CREATE OR REPLACE EXTERNAL TABLE ex_FR_category
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'FR_category_id.json';

CREATE OR REPLACE EXTERNAL TABLE ex_GB_category
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'GB_category_id.json';

CREATE OR REPLACE EXTERNAL TABLE ex_IN_category
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'IN_category_id.json';

CREATE OR REPLACE EXTERNAL TABLE ex_JP_category
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'JP_category_id.json';

CREATE OR REPLACE EXTERNAL TABLE ex_KR_category
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'KR_category_id.json';

CREATE OR REPLACE EXTERNAL TABLE ex_MX_category
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'MX_category_id.json';

CREATE OR REPLACE EXTERNAL TABLE ex_RU_category
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'RU_category_id.json';

CREATE OR REPLACE EXTERNAL TABLE ex_US_category
WITH LOCATION = @stage_bde_at_1
FILE_FORMAT = (TYPE=JSON)
PATTERN = 'US_category_id.json';



CREATE TABLE table_youtube_category AS
SELECT 'BR'::varchar as country,
l.value:id::int as categoryid, 
l.value:snippet:title::varchar as category_title
from ex_BR_category, lateral flatten(input => value:items) l UNION ALL

SELECT 'CA'::varchar as country,
l.value:id::int as categoryid, 
l.value:snippet:title::varchar as category_title
from ex_CA_category, lateral flatten(input => value:items) l UNION ALL

SELECT 'DE'::varchar as country,
l.value:id::int as categoryid, 
l.value:snippet:title::varchar as category_title
from ex_DE_category, lateral flatten(input => value:items) l UNION ALL

SELECT 'FR'::varchar as country,
l.value:id::int as categoryid, 
l.value:snippet:title::varchar as category_title
from ex_FR_category, lateral flatten(input => value:items) l UNION ALL

SELECT 'GB'::varchar as country,
l.value:id::int as categoryid, 
l.value:snippet:title::varchar as category_title
from ex_GB_category, lateral flatten(input => value:items) l UNION ALL

SELECT 'IN'::varchar as country,
l.value:id::int as categoryid, 
l.value:snippet:title::varchar as category_title
from ex_IN_category, lateral flatten(input => value:items) l UNION ALL

SELECT 'JP'::varchar as country,
l.value:id::int as categoryid, 
l.value:snippet:title::varchar as category_title
from ex_JP_category, lateral flatten(input => value:items) l UNION ALL

SELECT 'KR'::varchar as country,
l.value:id::int as categoryid, 
l.value:snippet:title::varchar as category_title
from ex_KR_category, lateral flatten(input => value:items) l UNION ALL

SELECT 'MX'::varchar as country,
l.value:id::int as categoryid, 
l.value:snippet:title::varchar as category_title
from ex_MX_category, lateral flatten(input => value:items) l UNION ALL

SELECT 'RU'::varchar as country,
l.value:id::int as categoryid, 
l.value:snippet:title::varchar as category_title
from ex_RU_category, lateral flatten(input => value:items) l UNION ALL

SELECT 'US'::varchar as country,
l.value:id::int as categoryid, 
l.value:snippet:title::varchar as category_title
from ex_US_category, lateral flatten(input => value:items) l;


//merging tables using join on country and categoryid
CREATE OR REPLACE TABLE table_youtube_final AS 
SELECT uuid_string() as id, table_youtube_trending.*, table_youtube_category.category_title 
FROM table_youtube_trending 
LEFT JOIN table_youtube_category 
ON table_youtube_trending.country=table_youtube_category.country 
AND table_youtube_trending.categoryid=table_youtube_category.categoryid ;



//cleaning q1 - answer: comedy
SELECT country, category_title, COUNT(*) AS count
FROM table_youtube_category
GROUP BY country, category_title
HAVING COUNT(*) > 1;

//cleaning q2 - answer: Nonprofits & Activism 
SELECT category_title, COUNT(*)
FROM table_youtube_category
GROUP BY category_title
HAVING COUNT(*) = 1;

//cleaning q3 - answer: categroyid 29
SELECT country, categoryid 
FROM table_youtube_final
WHERE category_title IS NULL
GROUP BY country, categoryid;

//cleaning q4 - 
UPDATE table_youtube_final
SET category_title = 'Nonprofits & Activism'
WHERE category_title IS NULL;


//cleaning q5 - answer: Kala Official Teaser | Tovino Thomas | Rohith V S | Juvis Productions | Adventure Company
SELECT title, channeltitle
FROM table_youtube_final
WHERE (channeltitle is NULL or channeltitle = '');

//cleaning q6 - answer: 14619 rows deleted
DELETE FROM table_youtube_final
WHERE video_id = '#NAME?';

//cleaning q7 - answer: 37842 rows table
CREATE OR REPLACE TABLE table_youtube_duplicates AS
SELECT  *
FROM (SELECT *, ROW_NUMBER() OVER(PARTITION BY country, video_id, trending_date ORDER BY view_count DESC) AS rownum 
      FROM table_youtube_final) q
WHERE rownum > 1;

DELETE FROM table_youtube_final
WHERE EXISTS( SELECT 1 FROM table_youtube_duplicates Where table_youtube_final.id = table_youtube_duplicates.id);

//cleaning q8 - answer: 1123017 rows
SELECT COUNT(*) 
FROM table_youtube_final;



//analysis q1 
SELECT *
FROM (SELECT country, title, channeltitle, view_count, RANK() OVER (PARTITION BY country ORDER BY view_count DESC) AS rk
      FROM table_youtube_final
     WHERE trending_date = '2021-10-17'
     AND category_title = 'Sports') q
WHERE rk IN (1,2,3);


//analysis q2
SELECT country, count(distinct video_id) as ct 
FROM table_youtube_final
WHERE title LIKE '%BTS%'
GROUP BY country
ORDER BY ct DESC;




//analysis 3
SELECT country, year_month, title, channeltitle, category_title, view_count, ROUND(likes * 100.0 / view_count, 2) AS like_ratio
FROM (SELECT *, DATE_FROM_PARTS(YEAR(trending_date), MONTH(trending_date), 1 ) AS year_month, ROW_NUMBER()OVER (PARTITION BY country, year_month ORDER BY view_count DESC) AS rownum
      FROM table_youtube_final
     )
WHERE rownum = 1
ORDER BY year_month, country;



//analysis 4 
SELECT a.country, category_title, total_category_video, total_country_video, ROUND(total_category_video * 100.0 / total_country_video, 2) AS percentage  
FROM 
    (SELECT country, category_title, count(distinct video_id) as total_category_video
    from table_youtube_final
    group by country, category_title
    order by total_category_video desc) a
LEFT JOIN 
    (SELECT country, count(distinct video_id) as total_country_video
    from table_youtube_final
    group by country
    order by total_country_video desc) b
ON a.country = b.country
ORDER BY category_title, country ASC;



//analysis 5
SELECT channeltitle, count(distinct video_id) AS ct
FROM table_youtube_final
GROUP BY channeltitle
ORDER BY ct DESC;


//business question
//getting total of most viewed for each category
SELECT category_title, sum(view_count) AS total_views
FROM table_youtube_final
GROUP BY category_title
ORDER BY total_views DESC;

//ranking most viewed categories in each country
SELECT country, category_title, sum(view_count) AS total_views, RANK() OVER (PARTITION BY country ORDER BY total_views DESC) AS rk
FROM table_youtube_final
GROUP BY category_title, country 
ORDER BY category_title, total_views DESC;




