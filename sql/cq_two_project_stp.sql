--File Name: CQ2_Project_STPData_DRC_Done
--Created by: Jillian Galle
--Last Updated: 15 April 2015 by jeg


--Query Description: User selects one or more Projects and STP data in Related View.

--User notes:
--1. Please return all fields that are commented "always return this field"
--2. All other fields are selected for inclusion in the query by the user via the query interface.
--3.This query returns STP Data in Related DATA View
--4.This Query is for the DRC Website.


create view cq_two_project_stps as
SELECT
"b"."ProjectName" AS "Project Name", --always return this field
"a"."ProjectID" AS "ProjectID",--always return this field
"c"."Context" AS "Context",--always return this field
"c"."ContextID" AS "ContextID",--always return this field
"d"."YesNo" AS "Excavated",--always return this field
"e"."LevelType" AS "LevelType",
"f"."DepositType" AS "DepositType",--always return this field
"c"."MaximumLithostratigraphicThickness" AS "MaximumLithostratigraphicThickness",
"c"."ActualMeasuredVolume" as "ActualMeasuredVolume(liters)",
"c"."ContextLength" AS "ContextLength",
"c"."ContextWidth" AS "ContextWidth",
"g"."UnitType" AS "UnitType",--always return this field
--STP Data Fields
"c"."STPNorthing" AS "STPNorthing",--**These are the Fields Returned when STP Data is chosen**
"c"."STPEasting" AS "STPEasting",--**These are the Fields Returned when STP Data is chosen**
"jj"."STPLevel" AS "STPLevel",--**These are the Fields Returned when STP Data is chosen**
"jj"."STPClosing" AS "STPClosing",--**These are the Fields Returned when STP Data is chosen**
"ll"."FineSedimentTexture" as "STPFineSediment",--**These are the Fields Returned when STP Data is chosen**
"mm"."MunsellSedimentColor" as "STPSedimentColor",--**These are the Fields Returned when STP Data is chosen**
"nn"."Percentage" as "STPSedimentPercentage",--**These are the Fields Returned when STP Data is chosen**
"qq"."InclusionDescription" as "STPInclusion",--**These are the Fields Returned when STP Data is chosen**
"rr"."InclusionSize" as "STPInclusionSize",--**These are the Fields Returned when STP Data is chosen**
"ss"."PercentageID" as "STPInclusionPercentage",--**These are the Fields Returned when STP Data is chosen**
"i"."YesNo" AS "ArtifactPresence",
"c"."TPQ" AS "ContextTPQ",
"c"."TPQNotes",
"c"."DateOpened" AS "DateOpened",
"c"."DateClosed" AS "DateClosed",
"c"."ExcavatedBy" AS "ExcavatedBy",
"c"."RecordedBy" AS "RecordedBy",
"c"."ExcavatorSedimentDescription" AS "ExcavatorSedimentDescription",
"c"."ExcavatorInterpretation" AS "ExcavatorInterpretation",
"c"."DataEntryNotes" AS "DataEntryNotes",
--Context MetaData
"c"."LevelDesignation" AS "LevelDesignation",
"c"."FSNumber" AS "FSNumber",
"c"."MasterContextNumber" AS "MasterContextNumber",
"c"."MasterContextInterpretation" AS "MasterContextInterpretation",
"c"."ExcavatorPhase" AS "ExcavatorPhase",
"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
"c"."DAACSStratigraphicGroupInterpretation" AS "DAACSStratigraphicGroupInterpretation",
"c"."DAACSPhase" AS "DAACSPhase",
"c"."CAPlowzonePhase" AS "CAPlowzonePhase",
"j"."YesNo" As "Photograph",
"c"."PlanDrawings" AS "PlanDrawings",
"c"."ProfileDrawings" AS "ProfileDrawings",
a."Published"

FROM "public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
INNER JOIN "public"."tblContext" as "c" ON "c"."ProjectID" = "a"."ProjectID"
LEFT JOIN "public"."tblYesNo" as "d" ON "c"."Excavated" = "d"."YesNoID"
LEFT JOIN "public"."tblContextLevelType" as "e" ON "c"."LevelTypeID" = "e"."LevelTypeID"
LEFT JOIN "public"."tblContextDepositType" as "f" ON "c"."DepositTypeID" = "f"."DepositTypeID"
LEFT JOIN "public"."tblContextUnitType" as "g" ON "c"."UnitTypeID" = "g"."UnitTypeID"
LEFT JOIN "public"."tblContextFeatureType" AS "h" ON "c"."FeatureTypeID" = "h"."FeatureTypeID"
LEFT JOIN "public"."tblYesNo" AS "i" ON "c"."ArtifactPresence" = "i"."YesNoID"
LEFT JOIN "public"."tblYesNo" AS "j" ON "c"."Photographs" = "j"."YesNoID"

-- --STP  Tables
LEFT JOIN "public"."tblContextSTPLevel" as "jj" on "c"."ContextAutoID" = "jj"."ContextAutoID"
LEFT JOIN "public"."tblContextSTPSediments" as "kk" on "jj"."ContextSTPLevelID" = "kk"."ContextSTPLevelID"
LEFT JOIN "public"."tblContextFineSedimentTexture" as "ll" ON "kk"."FineSedimentTextureID" = "ll"."FineSedimentTextureID"
LEFT JOIN "public"."tblSedimentColor" as "mm" ON "kk"."MunSedColorID"  = "mm"."MunSedColorID" 
LEFT JOIN "public"."tblContextPercentage" as "nn"  ON "kk"."PercentageID"= "nn"."PercentageID"
Left JOIN "public"."tblContextSTPInclusions" as "pp" ON "jj"."ContextSTPLevelID" = "pp"."ContextSTPLevelID"
LEFT JOIN "public"."tblContextInclusionDescription" as "qq" ON "pp"."InclusionDescriptionID" = "qq"."InclusionDescriptionID"
LEFT JOIN "public"."tblContextInclusionSize" as "rr" ON "pp"."InclusionSizeID" = "rr"."InclusionSizeID"
LEFT JOIN "public"."tblContextPercentage" as "ss"  ON "pp"."PercentageID"="ss"."PercentageID"



Order BY
"b"."ProjectName",
"c"."Context" 