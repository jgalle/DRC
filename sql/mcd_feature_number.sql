
--File Name: 	MCDQ1_FeatureNumber_DRC_Done
--Created by: Fraser Neiman
--Last Updated: 7 April 2015 by jeg

--Query Description: Query Returns MCD for FeatureNumbers for one or more projects, subsetted by Feature Number.
--For DRC Site

create view mcd_one_feature_numbers as
SELECT
a."ProjectID",
"b"."ProjectName",
"cc"."FeatureNumber",
"d"."FeatureType",
a."Published",
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
Left Join "tblContextFeature" as "cc" on "c"."ProjectID" = "cc"."ProjectID" AND "c". "FeatureNumber" = "cc"."FeatureNumber" 
LEFT JOIN "public"."tblContextFeatureType" as "d" ON "cc"."FeatureTypeID" = "d"."FeatureTypeID" 
INNER JOIN "public"."tblContextSample" as "e" ON "c"."ContextAutoID" = "e"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" as "f" ON "e"."ContextSampleID" = "f"."ContextSampleID"
INNER JOIN "public"."tblCeramic" as "g" ON "f"."GenerateContextArtifactID" = "g"."GenerateContextArtifactID"
INNER JOIN "public"."tblCeramicWare" as "h" ON "g"."WareID" = "h"."WareID"

WHERE
"h"."BeginDate" is not NULL 
and "cc"."FeatureNumber" is not NULL


GROUP BY 
"b"."ProjectName",
"cc"."FeatureNumber", 
"d"."FeatureType",
a."ProjectID",
a."Published"

ORDER BY 
"b"."ProjectName",
"cc"."FeatureNumber"