--File Name: 	MCDQ2_Phase_DRC_Done
--Created by: Jillian Galle
--Last Updated: 7 April 2015 by jeg

--Query Description: User selects one or more Projects and Phase. Returns all Ware Type Frequency DATA.
--User notes: This Query is for the DRC Website.
create view mcd_two_phases as
SELECT
a."ProjectID",
a."Published",
"b"."ProjectName",
"c"."DAACSPhase",
"j"."Ware" as "WareTypes",
SUM("i"."Quantity") as "Count",
SUM("i"."SherdWeight") as "Weight"

FROM

"public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
INNER JOIN "public"."tblContext" as "c" ON "a"."ProjectID" = "c"."ProjectID"
LEFT JOIN "public"."tblContextDepositType" as "d" ON "c"."DepositTypeID" = "d"."DepositTypeID"
INNER JOIN "public"."tblContextSample" as "g" ON "c"."ContextAutoID" = "g"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" as "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblCeramic" as "i" ON "h"."GenerateContextArtifactID" = "i"."GenerateContextArtifactID"
LEFT JOIN "public"."tblCeramicWare" as "j" ON "i"."WareID" = "j"."WareID"


GROUP BY 
"b"."ProjectName",
"c"."DAACSPhase",
"j"."Ware",
a."ProjectID",
a."Published"

ORDER BY 
"b"."ProjectName",
"c"."DAACSPhase",
j."Ware"