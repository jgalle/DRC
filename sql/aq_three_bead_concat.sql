create view aq_three_concat_beads as
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
string_agg (distinct COALESCE(ae."BeadDecoration") || ', ' || COALESCE(af."BasicColor") || ', '||  COALESCE(af."AppliedColorWrittenDescription") || ', '|| COALESCE(ad."DecDescription"),'; ') AS "BeadDecoration",
--This strings together, then  aggregates all fields from "tblBeadDecTech". Note that I have included two different colors from tblMunsellAppliedColor, Basic Color and Applied Color Written Dexcription.
--Coalesce function replaces null values with another character or number
string_agg(distinct COALESCE(ab."CasingLayer") || ', ' || COALESCE(ac."BasicColor") || ',' || COALESCE(ac."AppliedColorWrittenDescription"), '; ')  as "CasingInformation",
--This strings together, then  aggregates all fields from "tblBeadCasing". Note that I have included two different colors from tblMunsellAppliedColor, Basic Color and Applied Color Written Dexcription
--Coalesce function replaces null values with another character or number
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
string_agg(COALESCE(z."ImageFileLocation"),'; ') AS "Images",
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



GROUP BY --Group by all field names not in the string_agg functions
b."ProjectName",
"c"."ProjectID",
"c"."Context",
d."DepositType",
"dd"."UnitType",
f."FeatureType",
e."FeatureNumber",
e."FeatureGroup",
e."FeatureGroupInterpretation",
"c"."DAACSStratigraphicGroup",
"c"."DAACSStratigraphicGroupInterpretation",
"c"."DAACSPhase",
i."ArtifactID",
i."Quantity",
j."Completeness",
"k"."BeadMaterial",
l."BeadManuTech",
"m"."Structure",
n."BeadForm",
o."BeadShape",
"p"."EndTreatment",
q."YesNo",
r."BasicColor", 
"r". "AppliedColorWrittenDescription",
"r"."MunsellRangeAppliedColor",
i."NumberofFacets",
s."Diaphaneity",
"t"."YesNo",--Note that this is the Post Manufacturing Modification field. The sql needs the group by to be the alias and the YesNo field, not "PMM"
u."YesNo",--Note that this is the patination field. The sql needs the group by to be the alias and the YesNo field, not "Patination"
v."YesNo", --Note that this is the Burned field. The sql needs the group by to be the alias and the YesNo field, not "Burned"
w."YesNo",--Note that this is the WeateredEroded field. The sql needs the group by to be the alias and the YesNo field, not "WeatheredEroded"
i."Length",
i."Width",
i."Height",
i."Weight",
i."SizeofPerforationI",
i."SizeofPerforationII",
x."YesNo", --Note that this is the mended field. The sql needs the group by to be the alias and the YesNo field, not "Mended"
i."Conservation",
i."Notes",
"ee"."ObjectID",
a."Published"



ORDER BY 
"ProjectName" ASC,
"ArtifactID" ASC,
"Form" ASC,
"ManufacturingTechnique" ASC,
"Material" ASC
