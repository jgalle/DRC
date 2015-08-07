--File Name: 	OQ1_DAACS_Done
--Created by: Derek Wheeler
--Last Updated: 27 Feb 2015 by jeg

--Query Description: User selects one or more Projects. Returns basic data on Objects from one or more projects.

--User notes:
--1.This Query is for the DAACS Website.

create view query_objects as
SELECT 
a."ProjectID",
"b"."ProjectName", 
"c"."ObjectID", 
"c"."InstitutionalObjectNumber", 
"d"."ObjectType" AS "Object Type", 
"e"."ObjectMaterial" AS "Object Material", 
"f"."Ware", 
"g"."ObjectManuTech" AS "Manufacturing Tech",
"h"."ObjectVesselCategory" AS "Vessel Category", 
"i"."ObjectForm" AS "Form", 
"j"."ObjectShape" AS "Shape", 
"k"."ObjectCompleteness" as "Completeness", 
"c"."ObjectDescription",
a."Published"

FROM "public"."tblProject" AS "a"
	LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
	LEFT JOIN "public"."tblObject" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
	LEFT JOIN "public"."tblObjectType" AS "d" ON "c"."ObjectTypeID" = "d"."ObjectTypeID"
  LEFT JOIN "public"."tblObjectMaterial" AS "e" ON "c"."ObjectMaterialID" = "e"."ObjectMaterialID"
  LEFT JOIN "public"."tblCeramicWare" AS "f" ON "c"."ObjectWareTypeID" = "f"."WareID"
  LEFT JOIN "public"."tblObjectManuTech" AS "g" ON "c"."ObjectManuTechID" = "g"."ObjectManuTechID"
  LEFT JOIN "public"."tblObjectVesselCategory" AS "h" ON "c"."ObjectVesselCategoryID" = "h"."ObjectVesselCategoryID"
  LEFT JOIN "public"."tblObjectForm" AS "i" ON "c"."ObjectFormID" = "i"."ObjectFormID"
  LEFT JOIN "public"."tblObjectShape" AS "j" ON "c"."ObjectShapeID" = "j"."ObjectShapeID"
  LEFT JOIN "public"."tblObjectCompleteness" AS "k" ON "c"."ObjectCompletenessID" = "k"."ObjectCompletenessID"
  

ORDER BY
"b"."ProjectName", 
"c"."ObjectID", 
"c"."InstitutionalObjectNumber", 
"d"."ObjectType", 
"e"."ObjectMaterial", 
"f"."Ware", 
"i"."ObjectForm";