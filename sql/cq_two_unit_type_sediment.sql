--File Name: CQ2_UnitType_SedimentInclusionData_DAACS_Done
--Created by: Jillian Galle
--Last Updated: 15 April 2015 by jeg

--Query Description: User selects one or more Projects, Unit Types, and Sediment/Inclusion Data in Related View.

--User notes:
--1. Please return all fields that are commented "always return this field"
--2. All other fields are selected for inclusion in the query by the user via the query interface.
--3.This query returns Sediment/Inclusion Data in Related DATA View
--4.This Query is for the DAACS Website.

create view cq_two_unit_type_sediments as
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
"c"."QuadratID" AS "QuadratID",--always return this field
"c"."QuadratLength" AS "QuadratLength",
"c"."QuadratWidth" AS "QuadratWidth",
"gg"."FeatureType" AS "FeatureType",--always return this field
"ff"."FeatureNumber" AS "FeatureNumber", --always return this field
--Related Fine Sediment Data
"m"."FineSedimentTexture" as "SedimentTexture",--**These are the Fields Returned when Sediment/Inclusion is chosen**
"n"."MunsellSedimentColor" as "MunsellSedimentColor",--**These are the Fields Returned when Sediment/Inclusion is chosen**
"l"."ExcavatorSedimentColorDescription" as "ExcavatorSedimentColorDescription",--**These are the Fields Returned when Sediment/Inclusion is chosen**
"o"."Percentage" as "SedimentPercentage",--**These are the Fields Returned when Sediment/Inclusion is chosen**
--Inclusion Data
"r"."InclusionDescription" as "InclusionDescription",--**These are the Fields Returned when Sediment/Inclusion is chosen**
"s"."InclusionSize" as "InclusionSize",--**These are the Fields Returned when Sediment/Inclusion is chosen**
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
LEFT JOIN "public"."tblYesNo" AS "i" ON "c"."ArtifactPresence" = "i"."YesNoID"
LEFT JOIN "public"."tblYesNo" AS "j" ON "c"."Photographs" = "j"."YesNoID"
LEFT JOIN "public"."tblContextFeature" as "ff" ON "c"."ProjectID" = "ff"."ProjectID" AND "c"."FeatureNumber" = "ff"."FeatureNumber"
LEFT JOIN "public"."tblContextFeatureType" as "gg" ON "ff"."FeatureTypeID" = "gg"."FeatureTypeID"

-- --Context Sediment Tables
LEFT JOIN "public"."tblContextFineSediment" as "l" ON "l"."ContextAutoID" = "c"."ContextAutoID"
LEFT JOIN "public"."tblContextFineSedimentTexture" as "m" ON "l"."FineSedimentTextureID" = "m"."FineSedimentTextureID"
LEFT JOIN "public"."tblSedimentColor" as "n" ON "l"."MunSedColorID" = "n"."MunSedColorID"
LEFT JOIN "public"."tblContextPercentage" as "o"  ON "l"."PercentageID"="o"."PercentageID"
LEFT JOIN "public"."tblContextRankOrder" AS "p" ON "l"."RankOrder" = "p"."RankOrder"

-- --Context Inclusion Tables
LEFT JOIN "public"."tblContextInclusion" as "q" ON "q"."ContextAutoID" = "c"."ContextAutoID"
LEFT JOIN "public"."tblContextInclusionDescription" as "r" ON "q"."InclusionDescriptionID" = "r"."InclusionDescriptionID"
LEFT JOIN "public"."tblContextInclusionSize" as "s" ON "q"."InclusionSizeID" = "s"."InclusionSizeID"

WHERE
"g"."UnitType" <> ('STP') --Do not return data for STPS 


Order BY
"b"."ProjectName",
"c"."Context" 