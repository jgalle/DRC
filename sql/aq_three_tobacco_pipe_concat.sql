--File Name: AQ3_TobaccoPipe_ConcatenatedView_DRC_Done
--Created by: Beth Bollwerk
--Last Updated: 11 March 2015 by JEG
--Artifact Query 3 Tob Pipe: This file returns concatenated data for tob pipes for the DRC Website and concatenated downloads.

--Step 1: Users select One or All Tob Pipe Attributes.  The data always returned for this query are the following, in addition to any other tob pipe Fields selected by User. 

create view aq_three_concat_tobacco_pipes as
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
"j"."TobaccoPipeCompleteness" as "Completeness",
"k"."TobaccoPipeMaterial" as "Material",
"l"."MunsellRangeAppliedColor" as "PasteColor",
"la"."PasteInclusion" as "PasteInclusion",
"m"."TobaccoPipeManuTech" as "ManuTech",
"n"."GlazeType" as "Glaze",
"na"."MunsellRangeAppliedColor" as "GlazeColor",
"gg"."YesNo" as "Decoration?",
string_agg(distinct COALESCE ("x"."TobaccoPipeDecMotif")||', '||COALESCE("y"."MotifTextLocation")||', '||
COALESCE("z"."MotifManuTech")||', '||COALESCE("w"."Notes"), '; ') as "Decoration",
"hh"."YesNo" as "TextMark?",
string_agg(distinct COALESCE("bb"."TextMarkType")||', '||COALESCE("cc"."MotifTextLocation")||', '||COALESCE("dd"."PipeTextFrameMotif")||', '
||COALESCE("aa"."FirstName")||', '||COALESCE("aa"."LastName")||', '||COALESCE("aa"."PlaceName")||', '||COALESCE("aa"."SloganOther")||', '||COALESCE("aa"."MarkNotes"), '; ') as "TextMark",
"i"."PipeMaker" as "PipeMaker",
"i"."ProductionDates" as "ProductionDates",
"i"."ManufactureLocation" as "ManufactureLocation",
"i"."CompleteMarkDescription",
"s"."YesNo" as "Post ManufacturingModification",
"o"."BowlForm" as "BowlForm",
"p"."BowlBaseType" as "BaseType",
"q"."MouthpieceForm" as "MouthpieceForm",
"i"."MaximumSherdMeasurement" as "MaximumSherdMeasurement",
"i"."StemLength",
"i"."ExteriorStemDiameter",
"i"."BoreDiameter64ths",
"i"."MetricBoreDiameter",
"i"."BowlHeight",
"i"."BowlVolume",
"i"."MaximumBowlDiameter",
"i"."BowlRimDiameter",
"i"."Weight",
"i"."Conservation",		
string_agg("ff"."ImageFileLocation", ';') AS "Images",
"ii"."ObjectID",
"i"."Notes",
a."Published"


FROM 
"public"."tblProject" AS "a"
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join	"public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextDepositType" AS "d"	on "c"."DepositTypeID" = "d"."DepositTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" ="g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
inner join "public"."tblTobaccoPipe" AS "i" on "h"."ArtifactID" = "i"."ArtifactID"
left join "public"."tblTobaccoPipeCompleteness" AS "j" on	"i"."TobaccoPipeCompletenessID" = "j"."TobaccoPipeCompletenessID"
left join "public"."tblTobaccoPipeMaterial" AS "k" on	"i"."TobaccoPipeMaterialID" = "k"."TobaccoPipeMaterialID"
left join "public"."tblMunsellAppliedColor" AS "l" on	"i"."PasteMunAppColorID" = "l"."MunAppColorID"
left join "public"."tblPasteInclusion" as "la" on "i"."PasteInclusionID" = "la"."PasteInclusionID"
left join "public"."tblTobaccoPipeManuTech" AS "m" on	"i"."TobaccoPipeManuTechID" = "m"."TobaccoPipeManuTechID"
left join "public"."tblTobaccoPipeGlazeType" AS "n" on "i"."GlazeTypeID" = "n"."GlazeTypeID"
left join "public"."tblMunsellAppliedColor" AS "na" on	"i"."PasteMunAppColorID" = "na"."MunAppColorID"
left join "public"."tblTobaccoPipeBowlForm" AS "o" on  "i"."BowlFormID" = "o"."BowlFormID"
left join "public"."tblTobaccoPipeBowlBaseType" AS "p" on "i"."BowlBaseTypeID" = "p"."BowlBaseTypeID"
left join "public"."tblTobaccoPipeMouthpieceForm" AS "q" on "i"."MouthpieceFormID" = "q"."MouthpieceFormID" 
left join "public"."tblYesNo"	AS "s" on "i"."PMM" = "s"."YesNoID"
left join "public"."tblArtifactImage" as "ee" on	"i"."ArtifactID" = "ee"."ArtifactID" 
left join "public"."tblImage" as "ff" on "ee"."ImageID" = "ff"."ImageID"
left join "public"."tblTobaccoPipeDecoration"	AS "w"	on "i"."ArtifactID" = "w"."ArtifactID"
left join "public"."tblTobaccoPipeDecMotif"	AS "x" on	"w"."TobaccoPipeDecMotifID" = "x"."TobaccoPipeDecMotifID"
left join "public"."tblTobaccoPipeMotifTextLocation" AS	"y" on "w"."MotifTextLocationID" = "y"."MotifTextLocationID"
left join "public"."tblTobaccoPipeMotifManuTech" AS	"z"	on "w"."TobaccoPipeMotifManuTechID" = "z"."MotifManuTechID"
left join "public"."tblTobaccoPipeTextMark" AS "aa" on "i"."ArtifactID" = "aa"."ArtifactID"
left join "public"."tblTobaccoPipeTextMarkType" AS "bb" on "aa"."TextMarkTypeID" = "bb"."TextMarkTypeID"
left join "public"."tblTobaccoPipeMotifTextLocation" AS	"cc" on "aa"."MotifTextLocationID" = "cc"."MotifTextLocationID"
left join "public"."tblTobaccoPipeTextFrameMotif"	AS "dd"	on "aa"."PipeTextFrameMotifID" = "dd"."PipeTextFrameMotifID"
left join "public"."tblYesNo"	AS "gg" on "i"."DecorationYN" = "gg"."YesNoID"
left join "public"."tblYesNo"	AS "hh" on "i"."TextMarkYN" = "hh"."YesNoID"
LEFT JOIN "public"."tblObjectArtifact" AS "ii" on "i"."GenerateContextArtifactID" = "ii"."GenerateContextArtifactID" 



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
"j"."TobaccoPipeCompleteness",
"k"."TobaccoPipeMaterial",
"l"."MunsellRangeAppliedColor",
"la"."PasteInclusion",
"m"."TobaccoPipeManuTech",
"n"."GlazeType",
"na"."MunsellRangeAppliedColor",
"gg"."YesNo", --Decoration?
"hh"."YesNo",--Text Mark
"i"."PipeMaker",
"i"."ProductionDates",
"i"."ManufactureLocation",
"i"."CompleteMarkDescription",
"s"."YesNo", --PMM
"o"."BowlForm",
"p"."BowlBaseType",
"q"."MouthpieceForm",
"i"."MaximumSherdMeasurement",
"i"."StemLength",
"i"."ExteriorStemDiameter",
"i"."BoreDiameter64ths",
"i"."MetricBoreDiameter",
"i"."BowlHeight",
"i"."BowlVolume",
"i"."MaximumBowlDiameter",
"i"."BowlRimDiameter",
"i"."Weight",
"i"."Conservation",		
"ii"."ObjectID",
"i"."Notes",
a."Published"

order by 
"b"."ProjectName",
"i"."ArtifactID",
"k"."TobaccoPipeMaterial",
"l"."MunsellRangeAppliedColor",
"m"."TobaccoPipeManuTech",
"j"."TobaccoPipeCompleteness"
