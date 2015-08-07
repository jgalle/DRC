--File Name: AQ3_Glass_RelatedView_DRC_Done
--Created by: Beth Bollwerk
--Last Updated: 11 March 2015 by jeg
--Artifact Query 3 Glass: This file returns related data for glass for the DRC Website and downloads.


--Step 1: Users select One or All Glass Attributes.  The data always returned for this query are the following, in addition to any other glass Fields selected by User. 
create view aq_three_related_glasses as
SELECT
"b"."ProjectName" as "ProjectName",
"c"."ProjectID" as "ProjectID",
"c"."Context" as "Context",
"c"."QuadratID" as "QuadratID",
"d"."DepositType" as "DepositType",
"f"."FeatureType" as "FeatureType",
"e"."FeatureNumber" as "FeatureNumber",
"e"."FeatureGroup" as "FeatureGroup",
"e"."FeatureGroupInterpretation" as "FeatureGroupInterpretation",
"c"."DAACSStratigraphicGroup" as "StratigraphicGroup",
"c"."DAACSPhase" as "DAACSPhase",
"i"."ArtifactID" as "ArtifactID",
"i"."Quantity" as "Count",
"j"."GlassMaterial" as "Material",
"k"."BasicColor" as "Color",
"l"."GlassVesselCategory" as "VesselCategory",
"m"."GlassForm" as "Form",
"n"."GlassCompleteness" as "Completeness",
"o"."GlassManuTech" as "ManufacturingTechnique",
"p"."MoldType" as "MoldType",
"r"."GlassBottleElement" as "BottleElement",
"pl"."GlassBottleShape" as "BottleShape",
"pm"."GlassBottleManuTech" as "BottleManutech",
"bb"."YesNo" as "Decoration",
"u"."GlassDecTechType" as "DecorativeTechniqueType",
"v"."BasicColor" as "AppliedColor",
"w"."GlassDecTechStyElem" as "StylisticElement",
"z"."Mark" as "GlassMarkDescription",
"aa"."GlassMarkLocation" as "GlassMarkLocation",
"pa"."YesNo" as "PostManufacturingModification",
"pb"."YesNo" as "Mended",
"pc"."PontilMark",
"i"."TotalContainerHeight" as "TotalContainerHeight",
"pd"."StemwareBodyShape" as "StemwareBodyShape",
"pe"."StemwareFootShape" as "StemwareFootShape",
"pf"."StemShape" as "StemShape",
"i"."StemLength" as "StemLength",
"pi"."YesNo" as "Burned",
"pj"."YesNo" as "Patination",
"pk"."YesNo" as "Solarized",
"i"."SherdSize",
"i"."SherdThickness",
"i"."SherdWeight",
"i"."MendedSherdWeight",
"i"."LengthofRim",
"i"."RimDiameter",
"i"."MendedRimDiameter",
"i"."BaseDiameter",
"i"."BaseLength",
"i"."MendedBaseDiameter",
"i"."Conservation",
"y"."ImageFileLocation" AS "Images",
"dd"."MendsToArtifactID" as "ArtifactsMendedTo",
"cc"."ObjectID",
"i"."Notes",
a."Published"

FROM
"public"."tblProject" AS "a"
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"
left join "public"."tblContextDepositType" AS "d"	on "c"."DepositTypeID" = "d"."DepositTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" ="g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
inner join "public"."tblGlass" AS "i" on "h"."ArtifactID" = "i"."ArtifactID"
LEFT JOIN "public"."tblGlassMaterial" AS "j" ON "i"."GlassMaterialID" = "j"."GlassMaterialID"
LEFT JOIN "public"."tblBasicColor" AS "k" ON "i"."GlassBasicColorID" = "k"."BasicColorID"
LEFT join "public"."tblGlassVesselCategory" AS "l" on "i"."GlassVesselCategoryID" = "l"."GlassVesselCategoryID"
LEFT JOIN "public"."tblGlassForm" AS "m" ON "i"."GlassFormID" = "m"."GlassFormID"
LEFT join "public"."tblGlassCompleteness" AS "n" ON "i"."GlassCompletenessID" = "n"."GlassCompletenessID"
LEFT JOIN "public"."tblGlassManuTech" AS "o" ON "i"."GlassManuTechID" = "o"."GlassManuTechID"
LEFT JOIN "public"."tblGlassMoldType" AS "p" ON "i"."MoldTypeID" = "p"."MoldTypeID"
LEFT JOIN "public"."tblYesNo" AS "pa" on "i"."PMM" = "pa"."YesNoID"
LEFT JOIN "public"."tblYesNo" AS "pb" on "i"."Mended" = "pb"."YesNoID"
LEFT JOIN "public"."tblGlassPontilMark" AS "pc" on "i"."PontilMarkID" = "pc"."PontilMarkID"
LEFT JOIN "public"."tblGlassStemwareBodyShape" as "pd" on "i"."StemwareBodyShapeID" = "pd"."StemwareBodyShapeID"
LEFT JOIN "public"."tblGlassStemwareFootShape" as "pe" on "i"."StemwareFootShapeID" = "pe"."StemwareFootShapeID"
LEFT JOIN "public"."tblGlassStemShape" as "pf" on "i"."StemShapeID" = "pf"."StemShapeID"
LEFT JOIN "public"."tblYesNo" as "pi" on "i"."Burned" = "pi"."YesNoID"
LEFT JOIN "public"."tblYesNo" as "pj" on "i"."Patination" = "pj"."YesNoID"
LEFT JOIN "public"."tblYesNo" as "pk" on "i"."Solarized" = "pk"."YesNoID"
LEFT JOIN "public"."tblGlassBottle" AS "q" ON "i"."ArtifactID" = "q"."ArtifactID"
LEFT JOIN "public"."tblGlassBottleElement" as "r" ON "q"."GlassBottleElementID" = "r"."GlassBottleElementID"
LEFT JOIN "public"."tblGlassBottleShape" as "pl" on "q"."GlassBottleShapeID" = "pl"."GlassBottleShapeID"
LEFT JOIN "public"."tblGlassBottleManuTech" as "pm" on "q"."GlassBottleManuTechID" = "pm"."GlassBottleManuTechID"
LEFT JOIN "public"."tblYesNo" AS "s" ON "i"."DecorationYN" = "s"."YesNoID"
LEFT JOIN "public"."tblGlassDecTech" AS "t" ON "i"."ArtifactID" = "t"."ArtifactID"
LEFT JOIN "public"."tblGlassDecTechType" AS "u" ON "t"."GlassDecTechTypeID" = "u"."GlassDecTypeTypeID"
LEFT JOIN "public"."tblBasicColor" as "v" ON "t"."GlassDecTechBasicColorID" = "v"."BasicColorID"
LEFT JOIN "public"."tblGlassDecTechStyElement" as "w" on "t"."GlassDecTechStyElemID" = "w"."GlassDecTechStyElemID"
left join "public"."tblArtifactImage" as "x" on	"i"."ArtifactID" = "x"."ArtifactID" 
left join "public"."tblImage" as "y" on "x"."ImageID" = "y"."ImageID"
LEFT JOIN "public"."tblGlassMark" as "z" on "i"."ArtifactID" = "z"."ArtifactID"
LEFT JOIN "public"."tblGlassMarkLocation" as "aa" on "z"."GlassMarkLocationID" = "aa"."GlassMarkLocationID"
LEFT JOIN "public"."tblYesNo" as "bb" on "i"."DecorationYN" = "bb"."YesNoID"
LEFT JOIN "public"."tblObjectArtifact" AS "cc" on "i"."GenerateContextArtifactID" = "cc"."GenerateContextArtifactID" 
left join "public"."tblCeramicMends" AS "dd" on "i"."GenerateContextArtifactID" = "dd"."GenerateContextArtifactID"



ORDER BY 
"b"."ProjectName",
"i"."ArtifactID",
"m"."GlassForm",
"o"."GlassManuTech",
"j"."GlassMaterial",
"k"."BasicColor"
