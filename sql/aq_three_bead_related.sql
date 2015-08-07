--File Name: AQ3_Beads_RelatedView_DRC_Done
--Created by: Jillian Galle
--Last Updated: 6 March 2015 by jeg
--Artifact Query 3 Beads: This file returns related data for Beads for the DRC Website.


--Step 1: Users select One or All Bead Attributes.  The data always returned for this query are the following, in addition to any other Bead Fields selected by User. 
create view aq_three_related_beads as
SELECT
b."ProjectName" AS "ProjectName",--always return this field
"c"."ProjectID" AS "ProjectID",--always return this field
"c"."Context" AS "Context",--always return this field
d."DepositType" AS "DepositType",
"dd"."UnitType" as "UnitType",
f."FeatureType" AS "FeatureType",
e."FeatureNumber" AS "FeatureNumber",--always return this field
e."FeatureGroup" AS "FeatureGroupNumber",--always return this field
e."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",--always return this field
"c"."DAACSStratigraphicGroup" AS "StratigraphicGroup",--always return this field
"c"."DAACSStratigraphicGroupInterpretation" as "DAACSStratigraphicGroupInterpretation",--always return this field
"c"."DAACSPhase" AS "DAACS Phase",--always return this field
i."ArtifactID" AS "ArtifactID",--always return this field
i."Quantity" AS "Count",--always return this field
j."Completeness" as "Completeness",
"k"."BeadMaterial" AS "Material",
l."BeadManuTech" AS "ManufacturingTechnique",
"m"."Structure" as "Structure",
n."BeadForm" AS "Form",
o."BeadShape" AS "Shape",
"p"."EndTreatment" AS "EndTreatment",
q."YesNo" AS "Heat Treated",
r."BasicColor" AS "BeadColor", --Note that I have added two color fields the basic color and, below, the appcolowrittendescription.
"r". "AppliedColorWrittenDescription" AS "DAACS Color Description",
"r"."MunsellRangeAppliedColor" AS "Bead Munsell Color Range",
i."NumberofFacets" AS "NumberofFacets",
ae."BeadDecoration" as "BeadDecoration",
af."BasicColor" as "BeadDecBasicColor",
af."AppliedColorWrittenDescription" as "BeadDecDetailedColor",
ad."DecDescription" as "BeadDecDescription",
"ab"."CasingLayer" as "CasingLayer",
"ac"."BasicColor" as "BeadLayerBasicColor",
"ac"."AppliedColorWrittenDescription" as "BeadLayerDetailedColor",
s."Diaphaneity",
"t"."YesNo" AS "PostManufacturingModification",
u."YesNo" AS "Patination",
v."YesNo" AS "Burned",
w."YesNo" AS "WeatheredEroded",
i."Length",
i."Width",
i."Height",
i."Weight",
i."SizeofPerforationI" AS "SizeofPerforationI",
i."SizeofPerforationII" AS "SizeofPerforationII",
x."YesNo" AS "Mended",
i."Conservation",
i."Notes",
z."ImageFileLocation" AS "Images",
"ee"."ObjectID",
a."Published"

FROM
"public"."tblProject" AS "a"
LEFT JOIN "public"."tblProjectName" AS b ON "a"."ProjectNameID" = b."ProjectNameID"
LEFT JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
LEFT JOIN "public"."tblContextDepositType" AS d ON "c"."DepositTypeID" = d."DepositTypeID"
left join "public"."tblContextUnitType" AS "dd"	on "c"."UnitTypeID" = "dd"."UnitTypeID"
LEFT JOIN "public"."tblContextFeature" AS e ON "c"."ProjectID" = e."ProjectID" AND "c"."FeatureNumber" = e."FeatureNumber"
LEFT JOIN "public"."tblContextFeatureType" AS f ON e."FeatureTypeID" = f."FeatureTypeID"
INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
INNER JOIN "public"."tblGenerateContextArtifactID" AS h ON "g"."ContextSampleID" = h."ContextSampleID"
INNER JOIN "public"."tblBead" AS i ON h."ArtifactID" = i."ArtifactID"
LEFT JOIN "public"."tblCompleteness" AS j ON i."CompletenessID" = j."CompletenessID"
LEFT JOIN "public"."tblBeadMaterial" AS "k" ON i."BeadMaterialID" = "k"."BeadMaterialID"
LEFT JOIN "public"."tblBeadManuTech" AS l ON i."BeadManuTechID" = l."BeadManuTechID"
LEFT JOIN "public"."tblBeadStructure" AS "m" ON i."StructureID" = "m"."StructureID"
LEFT JOIN "public"."tblBeadForm" AS n ON i."BeadFormID" = n."BeadFormID"
LEFT JOIN "public"."tblBeadShape" AS o ON i."BeadShapeID" = o."BeadShapeID"
LEFT JOIN "public"."tblBeadEndTreatment" AS "p" ON i."EndTreatmentID" = "p"."EndTreatmentID"
LEFT JOIN "public"."tblYesNo" AS q ON i."HeatTreated" = q."YesNoID"
LEFT JOIN "public"."tblMunsellAppliedColor" AS r ON i."MunAppColorID" = r."MunAppColorID"
LEFT JOIN "public"."tblBeadDiaphaneity" AS s ON i."DiaphaneityID" = s."DiaphaneityID"
LEFT JOIN "public"."tblYesNo" AS "t" ON i."PMM" = "t"."YesNoID"
LEFT JOIN "public"."tblYesNo" AS u ON i."Patination" = u."YesNoID"
LEFT JOIN "public"."tblYesNo" AS v ON i."Burned" = v."YesNoID"
LEFT JOIN "public"."tblYesNo" AS w ON i."BeadWeatheredEroded" = w."YesNoID"
LEFT JOIN "public"."tblYesNo" AS x ON i."Mended" = x."YesNoID"
LEFT JOIN "public"."tblArtifactImage" AS y ON i."ArtifactID" = y."ArtifactID"
LEFT JOIN "public"."tblImage" AS z ON y."ImageID" = z."ImageID"
LEFT JOIN "public"."tblBeadCasing" AS aa ON y."ArtifactID" = aa."ArtifactID"
LEFT JOIN "public"."tblBeadCasingLayer" AS ab ON aa."CasingLayerID" = ab."CasingLayerID"
LEFT JOIN "public"."tblMunsellAppliedColor" AS ac ON aa."MunAppColorID" = ac."MunAppColorID"
LEFT JOIN "public"."tblBeadDecTech" AS ad on y."ArtifactID" = ad."ArtifactID"
LEFT JOIN "public"."tblBeadDecoration" AS ae ON ad."BeadDecorationID" = ae."BeadDecorationID"
LEFT JOIN "public"."tblMunsellAppliedColor" AS af ON ad."MunAppColorID" = af."MunAppColorID"
LEFT JOIN "public"."tblObjectArtifact" AS "ee" on "i"."GenerateContextArtifactID" = "ee"."GenerateContextArtifactID" 






ORDER BY
"ProjectName" ASC,
"ArtifactID" ASC,
"Form" ASC,
"ManufacturingTechnique" ASC,
"Material" ASC
