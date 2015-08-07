--File Name: AQ3_Buttons_RelatedView_DRC_Done
--Created by: Jillian Galle
--Last Updated: 6 March 2015 by jeg
--Artifact Query 3 Buttons: This file returns related data for buttons for the DAACS Website.


--Step 1: Users select One or All Button Attributes.  The data always returned for this query are the following, in addition to any other Button Fields selected by User. 
create view aq_three_related_buttons as
SELECT
"b"."ProjectName" as "ProjectName",--always return this field
"c"."ProjectID" as "ProjectID",--always return this field
"c"."Context" as "Context",--always return this field
"c"."QuadratID" as "QuadratID",
"d"."DepositType" as "DepositType",
"f"."FeatureType" as "FeatureType",
"e"."FeatureNumber" as "FeatureNumber",--always return this field
"e"."FeatureGroup" as "FeatureGroup",--always return this field
"c"."DAACSStratigraphicGroup" as "DAACSStratigraphicGroup",--always return this field
"c"."DAACSPhase" as "DAACSPhase",--always return this field
"i"."ArtifactID" as "ArtifactID",--always return this field
"i"."Quantity" as "Count",--always return this field
"j"."Completeness",
"q"."ButtonMaterial" AS "Material",
"k"."ButtonManuTech" AS "ManufacturingTechnique",
"n"."ButtonType" AS "ButtonType",
"o"."ButtonShape" AS "ButtonShape",
"ab"."BasicColor" AS "NonMetalButtonColor",
"aa"."ButtonMetalColor" AS "MetalButtonColor",
"x"."Eye" as "ButtonEye",
"y"."ShankMaterial" AS "ShankMaterial",
"r"."ShankStyle" AS "ShankStyle",
"z"."ShankCondition" AS "ShankCondition",
"p"."ButtonMaterial" AS "2PieceButton:FaceMaterial",
"l"."ButtonManuTech" AS "2PieceButton:FaceManufacturingTechnique",
"m"."ButtonJoinMethod" AS "2PieceButton:JoinMethod",
"w"."YesNoID" AS "Decoration?",
"ae"."ButtonDecoration" as "DecTechType", 
"ag"."BasicColor" as "AppliedColor",
"af"."JewelInlayMaterial" as "JewelInlayMaterial",
"ad". "DecorativeMotif" AS "DecorativeMotif",
"i"."BackStamp" AS "Back Stamp",
"i"."Length",
"i"."Width",
"i"."Diameter",
"i"."Height",
"i"."Weight",
"u"."YesNoID" AS "Post-Manufacturing Modification",
"v"."YesNoID" AS "Burned",
"i"."Conservation",
"i"."Notes",
"t"."ImageFileLocation" AS "Images",
"ac"."ObjectID",
a."Published"

FROM
"public"."tblProject" AS "a"
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
left join	"public"."tblContext" AS "c" on	"a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextDepositType" AS "d" on "c"."DepositTypeID" = "d"."DepositTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber" = "e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS "f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
inner join "public"."tblButton" AS "i" on "h"."ArtifactID" = "i"."ArtifactID"
LEFT JOIN "public"."tblCompleteness" AS "j" ON "i"."CompletenessID" = "j"."CompletenessID"
LEFT JOIN "public"."tblButtonManuTech" AS "k" ON "i"."ButtonManuTechID" = "k"."ButtonManuTechID"
LEFT JOIN "public"."tblButtonManuTech" AS "l" ON "i"."ButtonFaceManuTechID" = "l"."ButtonManuTechID"
LEFT JOIN "public"."tblButtonJoinMethod" AS "m" ON "i"."ButtonJoinMethodID" = "m"."ButtonJoinMethodID"
LEFT JOIN "public"."tblButtonType" AS "n" ON "i"."ButtonTypeID" = "n"."ButtonTypeID"
LEFT JOIN "public"."tblButtonShape" AS "o" ON "i"."ButtonShapeID" = "o"."ButtonShapeID"
LEFT JOIN "public"."tblButtonMaterial" AS "p" ON "i"."ButtonFaceMaterialID" = "p"."ButtonMaterialID"
LEFT JOIN "public"."tblButtonMaterial" AS "q" ON "i"."ButtonMaterialID" = "q"."ButtonMaterialID"
LEFT JOIN "public"."tblButtonShankStyle" AS "r" ON "i"."ShankStyleID" = "r"."ShankStyleID"
left join "public"."tblArtifactImage"	AS "s" on	"i"."ArtifactID" = "s"."ArtifactID" 
left join "public"."tblImage" AS "t" on "s"."ImageID" = "t"."ImageID"
LEFT JOIN "public"."tblYesNo" AS "u" ON "i"."PMM" = "u"."YesNoID"
LEFT JOIN "public"."tblYesNo" AS "v" ON "i"."Burned" = "v"."YesNoID"
LEFT JOIN "public"."tblYesNo" AS "w" ON "i"."DecorationYN" = "w"."YesNoID"
LEFT JOIN "public"."tblButtonEye" AS "x" ON "i"."EyeID" = "x"."EyeID"
LEFT JOIN "public"."tblButtonShankMaterial" AS "y" ON "i"."ShankMaterialID" = "y"."ShankMaterialID"
LEFT JOIN "public"."tblButtonShankCondition" AS "z" ON "i"."ShankConditionID" = "z"."ShankConditionID"
LEFT JOIN "public"."tblButtonMetalColor" AS "aa" ON "i"."ButtonMetalColorID" = "aa"."ButtonMetalColorID"
LEFT JOIN "public"."tblBasicColor" AS "ab" ON "i"."ButtonBasicColorID" = "ab"."BasicColorID"
LEFT JOIN "public"."tblObjectArtifact" AS "ac" on "i"."GenerateContextArtifactID" = "ac"."GenerateContextArtifactID" 
LEFT JOIN "public"."tblButtonDecTech" AS "ad" on "i"."GenerateContextArtifactID" = "ad"."GenerateContextArtifactID" 
LEFT JOIN "public"."tblButtonDecoration" AS "ae" on "ad"."ButtonDecorationID" = "ae"."ButtonDecorationID" 
LEFT JOIN "public"."tblButtonJewelInlayMaterial" AS "af" on "ad"."JewelInlayMaterialID" = "af"."JewelInlayMaterialID" 
LEFT JOIN "public"."tblBasicColor" AS "ag" on "ad"."ButtonDecTechBasicColorID" = "ag"."BasicColorID" 


Order by 	
"b"."ProjectName",
"q"."ButtonMaterial",
"n"."ButtonType", 
"o"."ButtonShape",
"k"."ButtonManuTech" 
