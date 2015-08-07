--File Name: AQ3_GenArts_ConcatenatedView_DRC_Done
--Created by: Beth Bollwerk
--Last Updated: 11 March 2015 by jeg
--Artifact Query 3 General Artifacts: This file returns concatenated data for GenArts for the DRC Website and concatenated downloads.

--Step 1: Users select One or All GenArts Attributes.  The data always returned for this query are the following, in addition to any other ceramic Fields selected by User. 
create view aq_three_concat_gen_artifacts as
SELECT
"b"."ProjectName" as "ProjectName",--always return this field
"c"."ProjectID" as "ProjectID",--always return this field
"c"."Context" as "Context",--always return this field
"c"."QuadratID" as "QuadratID",
"d"."DepositType" as "DepositType",
"f"."FeatureType" as "FeatureType",--always return this field
"e"."FeatureNumber" as "FeatureNumber",--always return this field
"e"."FeatureGroup" as "FeatureGroup",--always return this field
"e"."FeatureGroupInterpretation" as "FeatureGroupInterpretation",--always return this field
"c"."DAACSStratigraphicGroup" as "StratigraphicGroup",--always return this field
"c"."DAACSPhase" as "DAACSPhase",--always return this field
"i"."ArtifactID" as "ArtifactID",--always return this field
"i"."Quantity" as "Count",--always return this field
"j"."GenArtifactCategory" as "Category",
"k"."GenArtifactForm" as "Form",
"l"."GenArtifactCompleteness" as "Completeness",
string_agg(distinct COALESCE("ma"."GenArtifactMaterialType")||', '||COALESCE("n"."GenArtifactManuTech"), '; ') as "MaterialandManufacturingTechnique",
"o"."NailHeadType" as "NailHeadType",
"x"."YesNo" as "DecorationYN?",
string_agg(distinct COALESCE("aa"."GenArtifactDecTechType")||', '||COALESCE("bb"."BasicColor")||', '|| COALESCE("z"."DecorationNotes"), '; ') as "DecorationType,Color,andNotes",
"p"."NailEndType" as "NailEndType",
"q"."NailModification" as "NailModification",
"i"."NailLength" as "NailLength",
"i"."CoinDate" as "CoinDate",
"r"."BrickSize" as "BrickSize",
"s"."YesNo" as "Mended",
"t"."YesNo" as "PostManufacturingModification",
"u"."YesNo" as "Burned",
"i"."Length", 
"i"."Width",
"i"."Height",
"i"."Weight",
"i"."Marks",
"i"."Notes",
"i"."Conservation",
string_agg(COALESCE("w"."ImageFileLocation"), ';') AS "Images",
"y"."ObjectID",
"a"."Published"

FROM
"public"."tblProject" AS "a"
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"
left join "public"."tblContextDepositType" AS "d"	on "c"."DepositTypeID" = "d"."DepositTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" ="g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
inner join "public"."tblGenArtifact" AS "i" on "h"."ArtifactID" = "i"."ArtifactID"
left join "public"."tblGenArtifactCategory" as "j" on "i"."GenArtifactCategoryID" = "j"."GenArtifactCategoryID"
left join "public"."tblGenArtifactForm" as "k" on "i"."GenArtifactFormID" = "k"."GenArtifactFormID"
left join "public"."tblGenArtifactCompleteness" as "l" on "i"."GenArtifactCompletenessID" = "l"."GenArtifactCompletenessID"
left join "public"."tblGenArtifactMaterial" as "m" on "i"."ArtifactID" = "m"."ArtifactID"
left join "public"."tblGenArtifactMaterialType" as "ma" on "m"."GenArtifactMaterialTypeID" = "ma"."GenArtifactMaterialTypeID"
left join "public"."tblGenArtifactManuTech" as "n" on "m"."GenArtifactManuTechID" = "n"."GenArtifactManuTechID"
left join "public"."tblGenArtifactNailHead" as "o" on "i"."NailHeadTypeID" = "o"."NailHeadTypeID"
left join "public"."tblGenArtifactNailEnd" as "p" on "i"."NailEndTypeID" = "p"."NailEndTypeID"
left join "public"."tblGenArtifactNailModification" as "q" on "i"."NailModificationID" = "q"."NailModificationID"
left join "public"."tblGenArtifactBrickSize" as "r" on "i"."BrickSizeID" = "r"."BrickSizeID"
left join "public"."tblYesNo" as "s" on "i"."Mended" = "s"."YesNoID"
left join "public"."tblYesNo" as "t" on "i"."PMM" = "t"."YesNoID"
left join "public"."tblYesNo" as "u" on "i"."Burned" = "u"."YesNoID"
left join "public"."tblArtifactImage" as "v" on	"i"."ArtifactID" = "v"."ArtifactID" 
left join "public"."tblImage" as "w" on "v"."ImageID" = "w"."ImageID"
left join "public"."tblYesNo" as "x" on "i"."DecorationYN" = "x"."YesNoID"
LEFT JOIN "public"."tblObjectArtifact" AS "y" on "i"."GenerateContextArtifactID" = "y"."GenerateContextArtifactID" 
LEFT JOIN "public"."tblGenArtifactDecTech" AS "z" on "i"."GenerateContextArtifactID" = "z"."GenerateContextArtifactID"
LEFT JOIN "public"."tblGenArtifactDecTechType" AS "aa" on "z"."GenArtifactDecTechTypeID" = "aa". "GenArtifactDecTechTypeID"
LEFT JOIN "public"."tblBasicColor" AS "bb" ON "z"."GenArtDecTechBasicColorID" = "bb"."BasicColorID"




GROUP BY

"b"."ProjectName",
"c"."ProjectID",
"c"."Context",
"c"."QuadratID",
"d"."DepositType",
"f"."FeatureType",
"e"."FeatureNumber",
"e"."FeatureGroup",
"e"."FeatureGroupInterpretation",
"c"."DAACSStratigraphicGroup",
"c"."DAACSPhase",
"i"."ArtifactID",
"i"."Quantity",
"j"."GenArtifactCategory",
"k"."GenArtifactForm",
"l"."GenArtifactCompleteness",
"o"."NailHeadType",
"x"."YesNo", --DecorationY/N?
"p"."NailEndType",
"q"."NailModification",
"i"."NailLength",
"i"."CoinDate",
"r"."BrickSize",
"s"."YesNo",--Mended
"t"."YesNo", --PMM
"u"."YesNo", --Burned
"i"."Length", 
"i"."Width",
"i"."Height",
"i"."Weight",
"i"."Marks",
"i"."Notes",
"i"."Conservation",
"y"."ObjectID",
a."Published"


ORDER BY
"i"."ArtifactID",
"Form"