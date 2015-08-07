
--File Name: 	MCDQ1_FeatureGroup_DRC_Done
--Created by: Fraser Neiman
--Last Updated: 7 April 2015 by jeg

--Query Description: Query Returns MCD for FeatureTypes for one or more projects, subsetted by Feature Group.
--For DRC Website
create view mcd_one_feature_groups as 
SELECT
a."ProjectID",
a."Published",
"b"."ProjectName",
"dd"."FeatureGroup",
"dd"."FeatureGroupInterpretation",
round(sum(("h"."EndDate" + "h"."BeginDate")/ 2 * "g"."Quantity") / 
sum("g"."Quantity")) as "MCD",
round(sum(("h"."EndDate" + "h"."BeginDate")/ 2 
* ("g"."Quantity" * 1/((("h"."EndDate" - "h"."BeginDate")/6)^2))) / 
sum("g"."Quantity" * 1/((("h"."EndDate" - "h"."BeginDate")/6)^2))) as "BlueMCD",
sum("g"."Quantity") as "TotalCount"


FROM
"public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
INNER JOIN "public"."tblContext" as "c" ON "a"."ProjectID" = "c"."ProjectID"
LEFT JOIN "public"."tblContextFeature" as "dd" ON "c"."ProjectID" = "dd"."ProjectID" and "c"."FeatureNumber" = "dd"."FeatureNumber"
INNER JOIN "public"."tblContextSample" as "e" ON "c"."ContextAutoID" = "e"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" as "f" ON "e"."ContextSampleID" = "f"."ContextSampleID"
INNER JOIN "public"."tblCeramic" as "g" ON "f"."GenerateContextArtifactID" = "g"."GenerateContextArtifactID"
INNER JOIN "public"."tblCeramicWare" as "h" ON "g"."WareID" = "h"."WareID"

WHERE
"h"."BeginDate" is not NULL 
and "c"."FeatureNumber" is not NULL

GROUP BY 
"b"."ProjectName",
"dd"."FeatureGroup", 
"dd"."FeatureGroupInterpretation",
a."ProjectID",
a."Published"

ORDER BY 
"b"."ProjectName",
"dd"."FeatureGroup"