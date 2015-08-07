
--File Name: 	MCDQ1_Context_DRC_Done
--Created by: Fraser Neiman
--Last Updated: 7 April 2015 by jeg

--Query Description: Query Returns MCD for Contexts for one or more projects, subsetted by Context.
--For DRC Site

create view mcd_one_contexts as
SELECT
a."ProjectID",
"b"."ProjectName",
"c"."Context",
round(sum(("h"."EndDate" + "h"."BeginDate")/ 2 * "g"."Quantity") / 
sum("g"."Quantity")) as "MCD",
round(sum(("h"."EndDate" + "h"."BeginDate")/ 2 
* ("g"."Quantity" * 1/((("h"."EndDate" - "h"."BeginDate")/6)^2))) / 
sum("g"."Quantity" * 1/((("h"."EndDate" - "h"."BeginDate")/6)^2))) as "BlueMCD",
sum("g"."Quantity") as "TotalCount",
a."Published"


FROM
"public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
INNER JOIN "public"."tblContext" as "c" ON "a"."ProjectID" = "c"."ProjectID"
INNER JOIN "public"."tblContextSample" as "e" ON "c"."ContextAutoID" = "e"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" as "f" ON "e"."ContextSampleID" = "f"."ContextSampleID"
INNER JOIN "public"."tblCeramic" as "g" ON "f"."GenerateContextArtifactID" = "g"."GenerateContextArtifactID"
INNER JOIN "public"."tblCeramicWare" as "h" ON "g"."WareID" = "h"."WareID"

WHERE
"c"."Context" is not null
and "h"."BeginDate" is not NULL 


GROUP BY 
a."ProjectID",
"b"."ProjectName",
"c"."Context",
a."Published"
ORDER BY 
"b"."ProjectName",
"c"."Context"