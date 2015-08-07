--File Name: AQ3_Utensils_ConcatenatedView_DRC_Done
--Created by: Beth Bollwerk
--Last Updated: 11 March 2015 by jeg
--Artifact Query 3 Utensils: This file returns related data for utensils for the DRC Website and downloads.


--Step 1: Users select One or All Utensil Attributes.  The data always returned for this query are the following, in addition to any other utensil Fields selected by User. 
create view aq_three_related_utensils as
SELECT
"b"."ProjectName" as "ProjectName",--always return this field
"c"."ProjectID" as "ProjectID",--always return this field
"c"."Context" as "Context",--always return this field
"c"."QuadratID" as "QuadratID",
"d"."DepositType" as "DepositType",
"f"."FeatureType" as "FeatureType",
"e"."FeatureNumber" as "FeatureNumber",
"e"."FeatureGroup" as "FeatureGroup",--always return this field
"e"."FeatureGroupInterpretation" as "FeatureGroupInterpretation",--always return this field
"c"."DAACSStratigraphicGroup" as "StratigraphicGroup",--always return this field
"c"."DAACSPhase" as "DAACSPhase",--always return this field
"i"."ArtifactID" as "ArtifactID",--always return this field
"i"."Quantity" as "Count",--always return this field
"j"."Completeness",
"k"."UtensilForm" as "UtensilForm",
"l"."ForkTineCount" as "ForkTineCount",
"q"."YesNo" as "PresenceofRatTail",
"y"."UtensilPart" as "UtensilPart",
"z"."UtensilShape" as "PartShape",
"aa"."UtensilManuTech" as "PartManufacturingTechnique",
"ab"."UtensilMaterial" as "PartMaterial", 
"x"."PartLength" as "PartLength",
"x"."PartWidth" as "PartWidth",
"x"."PartHeight" as "PartHeight",
"n"."YesNo" as "Decoration",
"i"."Marks",
"o"."UtensilPlating" as "UtensilPlating",
"p"."HandleDecoration" as "HandleDecoration",
"i"."ArtifactLength" as "ArtifactLength",
"i"."ArtifactWidth" as "ArtifactWidth",
"i"."ArtifactWeight" as "ArtifactWeight",
"r"."YesNo" as "Burned",
"s"."YesNo" as "PostManufacturingModification",
"i"."Conservation",
"t"."YesNo" as "Mended",
"v"."ImageFileLocation" AS "Images",
"w"."ObjectID",
"i"."Notes",
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
inner join "public"."tblUtensil" AS "i" on "h"."ArtifactID" = "i"."ArtifactID" 
left join "public"."tblCompleteness" AS "j" on "i"."CompletenessID" = "j"."CompletenessID"
left join "public"."tblUtensilForm" AS "k" on "i"."UtensilFormID" = "k"."UtensilFormID"
left join "public"."tblUtensilForkTineCount" AS "l" on "i"."ForkTineCountID" = "l"."ForkTineCountID"
left join "public"."tblYesNo" as "n" on "i"."DecorationYN" = "n"."YesNoID"
left join "public"."tblUtensilPlating" as "o" on "i"."UtensilPlatingID" = "o"."UtensilPlatingID"
left join "public"."tblUtensilHandleDecoration" as "p" on "i"."HandleDecorationID" = "p"."HandleDecorationID"
left join "public"."tblYesNo" as "q" on "i"."SpoonRatTail" = "q"."YesNoID"
left join "public"."tblYesNo" as "r" on "i"."Burned" = "r"."YesNoID"
left join "public"."tblYesNo" as "s" on "i"."PMM" = "s"."YesNoID"
left join "public"."tblYesNo" as "t" on "i"."Mended" = "t"."YesNoID"
left join "public"."tblArtifactImage" as "u" on "i"."ArtifactID" = "u"."ArtifactID" 
left join "public"."tblImage" AS "v" on "u"."ImageID" = "v"."ImageID"
LEFT JOIN "public"."tblObjectArtifact" AS "w" on "i"."GenerateContextArtifactID" = "w"."GenerateContextArtifactID"
left join "public"."tblUtensilSpecific" as "x" on "i"."ArtifactID" = "x"."ArtifactID"
left join "public"."tblUtensilPart" as "y" on "x"."UtensilPartID" = "y"."UtensilPartID"
left join "public"."tblUtensilShape" as "z" on "x"."UtensilShapeID" = "z"."UtensilShapeID"
left join "public"."tblUtensilManuTech" as "aa" on "x"."UtensilManuTechID" = "aa"."UtensilManuTechID"
left join "public"."tblUtensilMaterial" as "ab" on "x"."UtensilMaterialID" = "ab"."UtensilMaterialID"


ORDER BY
"c"."ProjectID",
"i"."ArtifactID",
"k"."UtensilForm"
