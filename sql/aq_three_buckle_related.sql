--File Name: AQ3_Buckles_RelatedView_DRC_Done
--Created by: Jillian Galle
--Last Updated: 6 March by jeg
--Artifact Query 3 Buckles: This file returns related data for Buckles for the DRC Website.


--Step 1: Users select One or All Buckle Attributes.  The data always returned for this query are the following, in addition to any other Buckle Fields selected by User. 
create view aq_three_related_buckles as
SELECT
"b"."ProjectName" as "ProjectName",--always return this field
"c"."ProjectID" as "ProjectID",--always return this field
"c"."Context" as "Context",--always return this field
"c"."QuadratID" as "QuadratID",
"d"."DepositType" as "DepositType",
"f"."FeatureType" as "FeatureType",
"e"."FeatureNumber" as "FeatureNumber",--always return this field
"e"."FeatureGroupInterpretation" as "FeatureGroupInterpretation",--always return this field
"e"."FeatureGroup" as "FeatureGroup",--always return this field
"c"."DAACSStratigraphicGroup" as "StratigraphicGroup",--always return this field
"c"."DAACSPhase" as "DAACSPhase",--always return this field
"i"."ArtifactID" as "ArtifactID",--always return this field
"i"."Quantity" as "Quantity",--always return this field
"j"."BuckleType" as "BuckleType",
"k"."BuckleCompleteness" as "Completeness",
"l"."FramePlating" as "FramePlating",
"n"."BucklePart" as "BucklePart", 
"o"."BuckleMaterial" as "BuckleMaterial", 
"p"."BuckleManuTech" as "BuckleManuTech", 
"q"."BuckleShape" as "BuckleShape", 
"r"."BuckleElement" as "BuckleElement",
"m"."Length" as "Length", 
"m"."Width" as "Width", 
"i"."Weight" as "Weight",
"m"."PinCenterpointMeasure" as "PinCenterpointMeasure", 
"y"."BuckleDecTechType" as "BuckleDecTechType", 
"z"."BuckleDecMotif" as "BuckleDecMotif", 
"i"."Marks",
"t"."YesNo" as "Burned",
"i"."Conservation",
"u"."YesNo" as "Mended",
"s"."YesNo" as "Post Manufacturing Modification",
"i"."Notes",
"w"."ImageFileLocation" AS "Images",
"aa"."ObjectID",
a."Published"

FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID" 
left join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID" 
left join "public"."tblContextDepositType" AS "d" on "c"."DepositTypeID" = "d"."DepositTypeID" 
left join "public"."tblContextFeature" AS "e" on "c"."ProjectID"="e"."ProjectID" and "c"."FeatureNumber" = "e"."FeatureNumber" 
left join "public"."tblContextFeatureType" AS "f" on "e"."FeatureTypeID" = "f"."FeatureTypeID" 
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID" 
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID" 
inner join "public"."tblBuckle" AS "i" on "h"."ArtifactID" = "i"."ArtifactID" 
left join "public"."tblBuckleType" AS "j" on "i"."BuckleTypeID" = "j"."BuckleTypeID" 
left join "public"."tblBuckleCompleteness" AS "k" on "i"."BuckleCompletenessID" = "k"."BuckleCompletenessID" 
left join "public"."tblBuckleFramePlating" AS "l" on "i"."FramePlatingID" = "l"."FramePlatingID" 
left join "public"."tblBuckleForm" AS "m" on "i"."ArtifactID" = "m"."ArtifactID" 
left join "public"."tblBucklePart" AS "n" on "m"."BucklePartID" = "n"."BucklePartID" 
left join "public"."tblBuckleMaterial" AS "o" on "m"."BuckleMaterialID" = "o"."BuckleMaterialID" 
left join "public"."tblBuckleManuTech" AS "p" on "m"."BuckleManuTechID" = "p"."BuckleManuTechID" 
left join "public"."tblBuckleShape" AS "q" on "m"."BuckleShapeID" = "q"."BuckleShapeID" 
left join "public"."tblBuckleElement" AS "r" on "m"."BuckleElementID" = "r"."BuckleElementID" 
left join "public"."tblYesNo" AS "s" on "i"."PMM" = "s"."YesNoID" 
left join "public"."tblYesNo" AS "t" on "i"."Burned" = "t"."YesNoID" 
left join "public"."tblYesNo" AS "u" on "i"."Mended" = "u"."YesNoID" 
left join "public"."tblArtifactImage" as "v" on "i"."ArtifactID" = "v"."ArtifactID" 
left join "public"."tblImage" AS "w" on "v"."ImageID" = "w"."ImageID" 
left join "public"."tblBuckleDecTech" AS "x" on "i"."ArtifactID" = "x"."ArtifactID" 
left join "public"."tblBuckleDecTechType" AS "y" on "x"."BuckleDecTechTypeID" = "y"."BuckleDecTechTypeID" 
left join "public"."tblBuckleDecMotif" AS "z" on "x"."BuckleDecMotifID" = "z"."BuckleDecMotifID" 
LEFT JOIN "public"."tblObjectArtifact" AS "aa" on "i"."GenerateContextArtifactID" = "aa"."GenerateContextArtifactID" 


ORDER BY
"ProjectName" ASC,
"ArtifactID" ASC,
"BuckleType" ASC
