--File Name: CQ2_Project_ContextSampleRelated_DRC_Done
--Created by: Jillian Galle
--Last Updated: 15 April 2015 by jeg


--Query Description: User selects one or more Projects and stratigraphic relationship data in Related View.

--User notes:
--1. Please return all fields that are commented "always return this field"
--2. All other fields are selected for inclusion in the query by the user via the query interface.
--3.This query returns stratigraphic relationship Data in Related DATA View
--4.This Query is for the DRC Website.


create view cq_two_project_context_samples as
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

--Context Sample Data
"y"."ContextSampleID" as "ContextSampleID",--**These are the Fields Returned when Context Sample is chosen**
"z"."RecoveryMethod" as "RecoveryMethod",--**These are the Fields Returned when Context Sample is chosen**
"y"."SampleNumber" as "SampleNumber",--**These are the Fields Returned when Context Sample is chosen**
"y"."SampleSize" as "SampleSize",--**These are the Fields Returned when Context Sample is chosen**
"aa"."ContextSampleType" as "ContextSampleType",--**These are the Fields Returned when Context Sample is chosen**
"ab"."ScreenSize" as "ScreenSize",--**These are the Fields Returned when Context Sample is chosen**
"y"."StorageBoxNumber" as "StorageBoxNumber",--**These are the Fields Returned when Context Sample is chosen**
"y"."BoxComments" as "BoxComments",--**These are the Fields Returned when Context Sample is chosen**
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
LEFT JOIN "public"."tblContextFeature" as "ff" ON "c"."ProjectID" = "ff"."ProjectID" AND "c"."FeatureNumber" = "ff"."FeatureNumber"
LEFT JOIN "public"."tblContextFeatureType" as "gg" ON "ff"."FeatureTypeID" = "gg"."FeatureTypeID"
--Context Sample Tables
LEFT JOIN "public"."tblContextSample" as "y" ON "y"."ContextAutoID" = "c"."ContextAutoID"
LEFT JOIN "public"."tblContextRecoveryMethod" as "z" ON "y"."RecoveryMethodID" = "z"."RecoveryMethodID"
LEFT JOIN "public"."tblContextSampleType" as "aa" ON "y"."ContextSampleTypeID" = "aa"."ContextSampleTypeID"
LEFT JOIN "public"."tblContextScreenSize" as "ab" ON "y"."ScreenSizeID" = "ab"."ScreenSizeID"



Order BY
"b"."ProjectName",
"c"."Context" 