--File Name: AQ3_Faunal_ConcatenatedView_DRC_Done
--Created by: Jillian Galle
--Last Updated: 11 March 2015 by jeg
--Artifact Query 3 Faunal: This file returns concatenated data for bones for the DRC Website and concatenated downloads.

--Step 1: Users select One or All bone Attributes.  The data always returned for this query are the following, in addition to any other bone Fields selected by User. 
create view aq_three_concat_bones as
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
"l"."Reliability" AS "Reliability",
"j"."English" AS "TaxonEnglish",
"j"."Latin" AS "TaxonLatin",
"j"."TxnOrder" AS "TaxonOrder",
"k"."TaxonCategory" AS "TaxonCategory",
"j"."TaxonGroupCategory" AS "TaxonGroupCategory",
"m"."BodyPart" AS "BodyPart",
"m"."BoneElement" AS "Element",
"n"."SymmetryExpand" AS "Symmetry",
"i"."NISP" AS "NISP",
"i"."Weight" AS "BoneWeight",
"o"."BoneLocation" AS "BoneLocation",
"p"."Descriptor" AS "BoneDescriptor",
"t"."BoneSizeExpand" AS "BoneSize",
"q"."Fusion" AS "Fusion",
"u"."SexExpand" AS "SexExpand",
"w"."ChewTypeExpand" AS "ChewType",
"x"."ChewLocationExpand" AS "ChewLocation",
"ah"."YesNoID" AS "FreshBreak",
"r"."ToothTypeExpand" AS "ToothType",
"s"."ToothWear" AS "ToothWear",
"ae"."YesNoID" AS "DiseaseTrauma",
"af"."YesNoID" AS "Weathered?",
"ag"."YesNoID" AS "Burned?",
"v"."BoneConditionExpand" AS "BoneCondition",
"i"."NoofCutMarks" AS "NumberCutMarks",
"y"."ButcherMethodExpand" AS "ButcherMethod",
"z"."ButcherLocationExpand" AS "ButcherLocation",
"aa"."ButcherDirectionExpand" AS "ButcherDirection",
"ab"."BoneMarkType" AS "CutType",
"ac"."BoneMarkLocation" AS "CutLocation",
"ad"."MarkDirection" AS "CutDirection",
"j"."MtWtAd" AS "Meat WeightAdult",
"j"."MtWtIm" AS "Meat Weight mmature",
"i"."Comments" AS "Notes",
"i"."Identifier" AS "Identifier",
"i"."DateIdentified" AS "DateIdentified",
string_agg(distinct COALESCE("aj"."MeasuringDescription")||', '||COALESCE(("ai"."Measurement")::text, 'Not Recorded')
||', '|| COALESCE("ak"."YesNoID"), '; ') AS "MeasurementAccuracy",
a."Published"

FROM "public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextDepositType" AS "d"	on "c"."DepositTypeID" = "d"."DepositTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblBone" as "i" ON "h"."GenerateContextArtifactID" = "i"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBoneTaxon" as "j" ON "i"."TaxonID" = "j"."TaxonID"
LEFT JOIN "public"."tblBoneTaxonCategory" as "k" ON "j"."TaxonCategoryID" = "k"."TaxonCategoryID"
LEFT JOIN "public"."tblBoneReliability" as "l"  ON "i"."ReliabilityID" = "l"."ReliabilityID"
LEFT JOIN "public"."tblBoneElement" as "m" ON "i"."BoneElementID" = "m"."BoneElementID"
LEFT JOIN "public"."tblBoneSymmetry" as "n" ON "i"."SymmetryID" = "n"."SymmetryID"
LEFT JOIN "public"."tblBoneLocation" as "o" ON "i"."BoneLocationID" = "o"."BoneLocationID"
LEFT JOIN "public"."tblBoneDescriptor" as "p" ON "i"."DescriptorID" = "p"."DescriptorID"
LEFT JOIN "public"."tblBoneFusion" as "q" ON "i"."FusionID" = "q"."FusionID"
LEFT JOIN "public"."tblBoneToothType" as "r" ON "i"."ToothTypeID" = "r"."ToothTypeID" 
LEFT JOIN "public"."tblBoneToothWear" as "s" ON "i"."ToothWearID" = "s"."ToothWearID"
LEFT JOIN "public"."tblBoneSize" as "t" ON "i"."BoneSizeID" = "t"."BoneSizeID"
LEFT JOIN "public"."tblBoneSex" as "u" ON "i"."SexID" = "u"."SexID"
LEFT JOIN "public"."tblBoneCondition" as "v" ON "i"."BoneConditionID" = "v"."BoneConditionID"
LEFT JOIN "public"."tblBoneChewType" as "w" ON "i"."ChewTypeID" = "w"."ChewTypeID"
LEFT JOIN "public"."tblBoneChewLocation" as "x" ON "i"."ChewLocationID" = "x"."ChewLocationID"
LEFT JOIN "public"."tblBoneButcherMethod" as "y" ON "i"."ButcherMethodID" = "y"."ButcherMethodID"
LEFT JOIN "public"."tblBoneButcherLocation" as "z" ON "i"."ButcherLocationID" = "z"."ButcherLocationID"
LEFT JOIN "public"."tblBoneButcherDirection" as "aa" ON "i"."ButcherDirectionID" = "aa"."ButcherDirectionID"
LEFT JOIN "public"."tblBoneMarkType" as "ab" ON "i"."BoneMarkTypeID" = "ab"."BoneMarkTypeID"
LEFT JOIN "public"."tblBoneMarkLocation" as "ac" ON "i"."BoneMarkLocationID" = "ac"."BoneMarkLocationID"
LEFT JOIN "public"."tblBoneMarkDirection" as "ad" ON "i"."MarkDirectionID" = "ad"."MarkDirectionID"
LEFT JOIN "public"."tblBoneYesNoProbably" AS "ae" ON "i"."Disease" = "ae"."YesNoID"
LEFT JOIN "public"."tblBoneYesNoProbably" AS "af" ON "i"."Weathered" = "af"."YesNoID"
LEFT JOIN "public"."tblBoneYesNoProbably" AS "ag" ON "i"."Burned" = "ag"."YesNoID"
LEFT JOIN "public"."tblBoneYesNoProbably" AS "ah" ON "i"."FreshBreak" = "ah"."YesNoID"
LEFT JOIN "public"."tblBoneMeasure" as "ai" ON "ai"."GenerateContextArtifactID" = "i"."GenerateContextArtifactID" 
LEFT JOIN "public"."tblBoneMeasuringDescription" as "aj" ON "ai"."MeasuringDescriptionID" = "aj"."MeasuringDescriptionID"
LEFT JOIN "public"."tblBoneYesNoProbably" AS "ak" ON "ai"."Accurate" = "ak"."YesNoID"

WHERE "b"."ProjectName" IN ('Building o') --STEP 5 of AQ3 on the Query Form. Users can choose one, multiple, or all sites.

--STEP 2 of AQ3 on the Query Form. Users can also select by (but not summarize) one of the following context attributes

--And "c"."Context" IN **Users select "All Contexts" OR one or more Contexts for that project through a text box with wildcard search option.
--AND "f"."FeatureType" IN **Users select "All Feature Types" OR one or more Feature Types for that project through a text box with wildcard search option.
--AND "e"."FeatureNumber" IN **Users select "All Feature Numbers" OR one or more Feature Numbers for that project through a text box with wildcard search option.
--AND "e"."FeatureGroup" **Users select "All feature Groups" OR one or more Feature Groups for that project through a text box with wildcard search option.
--AND "c"."DAACSStratigraphicGroup"  **Users select "All SGs" OR one or more SGs for that project through a text box with wildcard search option.
--AND "c"."DAACSPhase" **Users select "All Phases" OR one or more Phases for that project through a text box with wildcard search option.

GROUP BY 
"c"."ProjectID",
"b"."ProjectName",
"c"."Context",
"c"."QuadratID",
"d"."DepositType",
"f"."FeatureType",
"e"."FeatureNumber",
"e"."FeatureGroup" ,
"e"."FeatureGroupInterpretation",
"c"."DAACSStratigraphicGroup",
"c"."DAACSPhase",
"i"."ArtifactID",
"i"."Quantity",
"l"."Reliability",
"j"."English",
"j"."Latin",
"j"."TxnOrder",
"k"."TaxonCategory",
"j"."TaxonGroupCategory",
"m"."BodyPart",
"m"."BoneElement",
"n"."SymmetryExpand",
"i"."NISP",
"i"."Weight",
"o"."BoneLocation",
"p"."Descriptor",
"t"."BoneSizeExpand",
"q"."Fusion",
"u"."SexExpand",
"w"."ChewTypeExpand",
"x"."ChewLocationExpand",
"ah"."YesNoID",
"r"."ToothTypeExpand",
"s"."ToothWear",
"ae"."YesNoID",
"af"."YesNoID",
"ag"."YesNoID",
"v"."BoneConditionExpand",
"i"."NoofCutMarks",
"y"."ButcherMethodExpand",
"z"."ButcherLocationExpand",
"aa"."ButcherDirectionExpand",
"ab"."BoneMarkType",
"ac"."BoneMarkLocation",
"ad"."MarkDirection",
"j"."MtWtAd",
"j"."MtWtIm",
"i"."Comments",
"i"."Identifier",
"i"."DateIdentified",
"a"."Published"


ORDER BY
"b"."ProjectName" ASC,
"i"."ArtifactID" ASC,
"j"."English" ASC
