--File Name: CQ1_Site_DAACS_withBoundaries_Done
--Created by: Jillian Galle
--Last Updated: 27 Feb 2015 by jeg

--Query Description: User selects one or more Projects.

--User notes:
--1. Please return all fields 
--2.Currently, as written, this query returns average quadrat northings and eastings.
--3. This Query is for the DAACS Website.
create view query_context_one as
SELECT
"b"."ProjectName" AS "Project Name",
"a"."ProjectID" AS "ProjectID",
"c"."Context" AS "Context",
"c"."QuadratID" AS "QuadratID",
AVG("k"."QuadratNorthing") AS "MeanQuadratNorthing",
AVG("k"."QuadratEasting") AS "MeanQuadratEasting",
"c"."STPNorthing" AS "STPNorthing",
"c"."STPEasting" AS "STPEasting",
"e"."DepositType" AS "DepositType",
"d"."UnitType" AS "UnitType",
"g"."FeatureType" AS "FeatureType",
"f"."FeatureNumber" AS "FeatureNumber",
"f"."FeatureGroup" AS "Feature Group",
"f"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
"c"."DAACSStratigraphicGroupInterpretation" AS "DAACSStratigraphicGroupInterpretation",
"c"."DAACSPhase" AS "DAACSPhase",
"c"."ExcavatorSedimentDescription" AS "ExcavatorSedimentDescription",
"c"."ExcavatorInterpretation" AS "ExcavatorInterpretation",
"c"."ContextLength" AS "ContextLength",
"c"."ContextWidth" AS "ContextWidth",
"c"."MaximumLithostratigraphicThickness" AS "MaximumLithostratigraphicThickness",
"c"."UnitSize" AS "UnitSize",
"c"."QuadratLength" AS "QuadratLength",
"c"."QuadratWidth" AS "QuadratWidth",
"h"."YesNo" AS "ArtifactPresence",
string_agg("i"."ContextSampleID",' ') AS "ContextSampleID",
string_agg("j"."RecoveryMethod",',') AS "RecoveryMethod",
a."Published"

FROM
"public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
INNER JOIN "public"."tblContext" as "c" ON "c"."ProjectID" = "a"."ProjectID"
LEFT JOIN "public"."tblContextUnitType" as "d" ON "c"."UnitTypeID" = "d"."UnitTypeID"
LEFT JOIN "public"."tblContextDepositType" as "e" ON "c"."DepositTypeID" = "e"."DepositTypeID"
LEFT JOIN "public"."tblContextFeature" as "f" ON "c"."ProjectID" = "f"."ProjectID" AND "c"."FeatureNumber" = "f"."FeatureNumber"
LEFT JOIN "public"."tblContextFeatureType" as "g" ON "f"."FeatureTypeID" = "g"."FeatureTypeID"
LEFT JOIN "public"."tblYesNo" as "h" ON "c"."ArtifactPresence" = "h"."YesNoID"
LEFT JOIN "public"."tblContextSample" as "i" ON "i"."ContextAutoID" = "c"."ContextAutoID"
LEFT JOIN "public"."tblContextRecoveryMethod" as "j" ON "i"."RecoveryMethodID" = "j"."RecoveryMethodID"

--Quadrat Boundary Tables
LEFT JOIN "public"."tblContextQuadratBoundary" as "k" ON "c"."ProjectID" = "k"."ProjectID" AND "c"."QuadratID" = "k"."QuadratID"



Group BY
"b"."ProjectName",
"a"."ProjectID",
"c"."Context",
"c"."QuadratID",
"e"."DepositType",
"d"."UnitType",
"g"."FeatureType",
"f"."FeatureNumber",
"f"."FeatureGroup",
"f"."FeatureGroupInterpretation",
"c"."DAACSStratigraphicGroup",
"c"."DAACSStratigraphicGroupInterpretation",
"c"."DAACSPhase",
"c"."ExcavatorSedimentDescription",
"c"."ExcavatorInterpretation",
"c"."ContextLength",
"c"."ContextWidth",
"c"."MaximumLithostratigraphicThickness",
"c"."UnitSize",
"c"."QuadratLength",
"c"."QuadratWidth",
"h"."YesNo",
"c"."STPNorthing",
"c"."STPEasting"



ORDER BY
"b"."ProjectName" ASC,
"c"."Context" ASC,
"f"."FeatureNumber" ASC,
"c"."DAACSStratigraphicGroup"  ASC,
"c"."DAACSPhase" ASC
