--File Name: 	ObQ3_DRC_Concatenated_Done
--Created by: Jillian Galle
--Last Updated: 5 April 2015 by jeg

--Query Description: User selects one or more Projects and can subset by either ObjectID, ObjectType, ObjectForm, or Ware. Returns all data on Objects from one or more projects in a concatenated format

--User notes:
--1.This Query is for the DRC Website.
create view query_objects_three_concats as
SELECT 
a."Published",
a."ProjectID",
"b"."ProjectName", 
"c"."ObjectID", 
"d"."ObjectType" AS "Object Type", 
"e"."ObjectMaterial" AS "Object Material", 
"f"."Ware", 
"g"."ObjectManuTech" AS "Manufacturing Tech",
"h"."ObjectVesselCategory" AS "Vessel Category", 
"i"."ObjectForm" AS "Form", 
"j"."ObjectShape" AS "Shape", 
"k"."ObjectCompleteness" as "Completeness", 
"n"."ObjectColor",
"c"."ObjectDescription",
"c"."Notes",
--Curation Information
"c"."InstitutionalObjectNumber",
"l"."Institution" as "CuratingInstitution",
"c"."ObjectLocation",
"m"."YesNo" as "Conserved?",
"c"."ConservationNotes",
--Measurements
"c"."ObjectLength",
"o"."YesNo" as "ObjectLengthCompleteMeasurement?",
"c"."ObjectWidth",
"p"."YesNo" as "WidthCompleteMeasurement?",
"c"."ObjectHeight",
"q"."YesNo" as "HeightCompleteMeasurement?",
"c"."ObjectWeight",
"c"."ObjectCapacity",
"c"."ObjectRimDiameter",
"c"."ObjectBaseDiameter",
"c"."ObjectHeightRimToBase",
"c"."ExhibitLength",
"c"."ExhibitWidth",
"c"."ExhibitHeight",
--Decoration No need to concatentate
"r"."ObjectDecTech" as "DecorativeTechnique",
"s"."ObjectColor" as "DecorationColor",
"t"."ObjectDecPattern" as "DecorationPattern",
"c"."DecorationNotes",
--Dating the Object
"c"."ObjectDate",
"c"."ExcavatorPhase",
"c"."DAACSPhase",
--AssociatedArtifacts concatenatedlist of related artifact ids
string_agg("v"."ArtifactID", ';') AS "ObjectArtifactIDs",--ObjectLocation related table

string_agg(distinct COALESCE ("u"."LoanedTo")||', '||COALESCE("u"."InstitutionContact")||', '||
COALESCE("u"."ExhibitName")||', '||COALESCE("u"."ArtifactHandler")||', '||COALESCE("u"."LoanLength")
||', '||COALESCE("u"."DateLoaned")||', '||COALESCE("u"."DateReturned")||', '||COALESCE("c"."Notes"), '; ') as "ObjectLoanInformation",

--Images
string_agg("x"."ImageFileLocation", ';') AS "Images",
cast("c"."ObjectID" as text) as object_id_str

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
  LEFT JOIN "public"."tblProjectInstitution" AS "l" ON "c"."InstitutionID" = "l"."InstitutionID"
	LEFT JOIN "public"."tblYesNo" AS "m" ON "c"."Conserved" = "m"."YesNoID"
	LEFT JOIN "public"."tblObjectColor" AS "n" ON "c"."ObjectColorID" = "n"."ObjectColorID"
	LEFT JOIN "public"."tblYesNo" AS "o" ON "c"."ObjectLengthComplete" = "o"."YesNoID"
	LEFT JOIN "public"."tblYesNo" AS "p" ON "c"."ObjectWidthComplete" = "p"."YesNoID"
	LEFT JOIN "public"."tblYesNo" AS "q" ON "c"."ObjectHeightComplete" = "q"."YesNoID"
	LEFT JOIN "public"."tblObjectDecTech" AS "r" ON "c"."ObjectDecTechID" = "r"."ObjectDecTechID"
	LEFT JOIN "public"."tblObjectColor" AS "s" ON "c"."ObjectDecColorID" = "s"."ObjectColorID"
	LEFT JOIN "public"."tblObjectDecPattern" AS "t" ON "c"."ObjectDecPatternID" = "t"."ObjectDecPatternID"
	LEFT JOIN	"public"."tblObjectLocation" AS "u" ON "c"."ObjectID" = "u"."ObjectID"
	LEFT JOIN	"public"."tblObjectArtifact" AS "v" ON "c"."ObjectID" = "v"."ObjectID"
	LEFT JOIN	"public"."tblObjectImage" AS "w" ON "c"."ObjectID" = "w"."ObjectID"
	left join "public"."tblImage" as "x" on "w"."ImageID" = "x"."ImageID"


Group BY

"b"."ProjectName", 
"c"."ObjectID", 
"d"."ObjectType", 
"e"."ObjectMaterial", 
"f"."Ware", 
"g"."ObjectManuTech",
"h"."ObjectVesselCategory", 
"i"."ObjectForm", 
"j"."ObjectShape", 
"k"."ObjectCompleteness", 
"n"."ObjectColor",
"c"."ObjectDescription",
"c"."Notes",
"c"."InstitutionalObjectNumber",
"l"."Institution",
"c"."ObjectLocation",
"m"."YesNo", --Conserved?
"c"."ConservationNotes",
"c"."ObjectLength",
"o"."YesNo", --"ObjectLengthCompleteMeasurement?"
"c"."ObjectWidth",
"p"."YesNo", --"WidthCompleteMeasurement?"
"c"."ObjectHeight",
"q"."YesNo", --"HeightCompleteMeasurement?"
"c"."ObjectWeight",
"c"."ObjectCapacity",
"c"."ObjectRimDiameter",
"c"."ObjectBaseDiameter",
"c"."ObjectHeightRimToBase",
"c"."ExhibitLength",
"c"."ExhibitWidth",
"c"."ExhibitHeight",
"r"."ObjectDecTech",
"s"."ObjectColor",
"t"."ObjectDecPattern",
"c"."DecorationNotes",
"c"."ObjectDate",
"c"."ExcavatorPhase",
"c"."DAACSPhase",
a."ProjectID",
a."Published"

ORDER BY
"b"."ProjectName", 
"c"."ObjectID", 
"d"."ObjectType", 
"e"."ObjectMaterial", 
"f"."Ware", 
"i"."ObjectForm"