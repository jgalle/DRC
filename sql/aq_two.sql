--Beads--
create view aq_two_context_beads as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."Context" AS "Context",
"d"."UnitType" AS "UnitType",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureNumber" AS "FeatureNumber",
"e"."FeatureGroup" AS "FeatureGroup",
"c"."QuadratID" AS "QuadratID",
"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
"c"."DAACSPhase" AS "DAACSPhase",
Sum("i"."Quantity") AS "TotalCount",
'Bead, '||"j"."BeadShape" AS "Form",
l."BeadManuTech" AS "ManufacturingTechnique",
"k"."BeadMaterial" AS "Material",
'' as "VesselCategory",
'' as "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Bead' as "ArtifactType",
"a"."Published"

FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextUnitType" AS "d"	on "c"."UnitTypeID" = "d"."UnitTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblBead" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBeadShape" as "j" ON "i"."BeadShapeID" = "j"."BeadShapeID"
LEFT JOIN "public"."tblBeadMaterial" AS "k" ON i."BeadMaterialID" = "k"."BeadMaterialID"
LEFT JOIN "public"."tblBeadManuTech" AS l ON i."BeadManuTechID" = l."BeadManuTechID"

Group BY
"ProjectName",
"a"."ProjectID",
"c"."Context",
"d"."UnitType",
"f"."FeatureType",
"e"."FeatureNumber",
"e"."FeatureGroup",
"c"."QuadratID",
"c"."DAACSStratigraphicGroup",
"c"."DAACSPhase",
"j"."BeadShape",
l."BeadManuTech" ,
"k"."BeadMaterial" ,
"VesselCategory",
"CeramicDecTechAppliedColorCombination",
"CeramicGenre",
"ArtifactType"

ORDER BY
"ProjectName" ASC,
"Context" ASC,
"ArtifactType";

--Buckles--
create view aq_two_context_buckles as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."Context" AS "Context",
"d"."UnitType" AS "UnitType",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureNumber" AS "FeatureNumber",
"e"."FeatureGroup" AS "FeatureGroup",
"c"."QuadratID" AS "QuadratID",
"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
"c"."DAACSPhase" AS "DAACSPhase",
Sum("i"."Quantity") AS "TotalCount",
'Buckle, '||"j"."BuckleType" AS "Form",
"p"."BuckleManuTech" AS "ManufacturingTechnique",
"o"."BuckleMaterial" AS "Material",
'' as "VesselCategory",
'' as "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Buckle' as "ArtifactType",
"a"."Published"

FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextUnitType" AS "d"	on "c"."UnitTypeID" = "d"."UnitTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblBuckle" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBuckleType" as "j" ON "i"."BuckleTypeID" = "j"."BuckleTypeID"
left join "public"."tblBuckleForm" AS "k" on "i"."ArtifactID" = "k"."ArtifactID" 
left join "public"."tblBuckleMaterial" AS "o" on "k"."BuckleMaterialID" = "o"."BuckleMaterialID" 
left join "public"."tblBuckleManuTech" AS "p" on "k"."BuckleManuTechID" = "p"."BuckleManuTechID" 

Group BY
"ProjectName",
"a"."ProjectID",
"c"."Context",
"d"."UnitType",
"f"."FeatureType",
"e"."FeatureNumber",
"e"."FeatureGroup",
"c"."QuadratID",
"c"."DAACSStratigraphicGroup",
"c"."DAACSPhase",
"j"."BuckleType",
"p"."BuckleManuTech",
"o"."BuckleMaterial",
"VesselCategory",
"CeramicDecTechAppliedColorCombination",
"CeramicGenre",
"ArtifactType"

ORDER BY
"ProjectName" ASC,
"Context" ASC,
"ArtifactType";

--Buttons--
create view aq_two_context_buttons as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."Context" AS "Context",
"d"."UnitType" AS "UnitType",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureNumber" AS "FeatureNumber",
"e"."FeatureGroup" AS "FeatureGroup",
"c"."QuadratID" AS "QuadratID",
"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
"c"."DAACSPhase" AS "DAACSPhase",
Sum("i"."Quantity") AS "TotalCount",
'Button, '||"j"."ButtonType" AS "Form",
"k"."ButtonManuTech" AS "ManufacturingTechnique",
"q"."ButtonMaterial" AS "Material",
'' as "VesselCategory",
'' as "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Button' as "ArtifactType",
"a"."Published"

FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextUnitType" AS "d"	on "c"."UnitTypeID" = "d"."UnitTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblButton" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblButtonType"as "j" ON "i"."ButtonTypeID" = "j"."ButtonTypeID"

LEFT JOIN "public"."tblButtonManuTech" AS "k" ON "i"."ButtonManuTechID" = "k"."ButtonManuTechID"

LEFT JOIN "public"."tblButtonMaterial" AS "q" ON "i"."ButtonMaterialID" = "q"."ButtonMaterialID"

Group BY
"ProjectName",
"a"."ProjectID",
"c"."Context",
"d"."UnitType",
"f"."FeatureType",
"e"."FeatureNumber",
"e"."FeatureGroup",
"c"."QuadratID",
"c"."DAACSStratigraphicGroup",
"c"."DAACSPhase",
"j"."ButtonType",
"k"."ButtonManuTech",
"q"."ButtonMaterial",
"VesselCategory",
"CeramicDecTechAppliedColorCombination",
"CeramicGenre",
"ArtifactType"

ORDER BY
"ProjectName" ASC,
"Context" ASC,
"ArtifactType";

--Ceramics--
create view aq_two_context_ceramics as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."Context" AS "Context",
"d"."UnitType" AS "UnitType",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureNumber" AS "FeatureNumber",
"e"."FeatureGroup" AS "FeatureGroup",
"c"."QuadratID" AS "QuadratID",
"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
"c"."DAACSPhase" AS "DAACSPhase",
Sum("i"."Quantity") AS "TotalCount",
"j"."CeramicVesselCategory" as "VesselCategory",
"k"."CeramicForm" AS "Form",
"l"."CeramicManuTech" AS "ManufacturingTechnique",
"m"."Ware" AS "Material",
string_agg(distinct COALESCE("o"."CeramicDecTechType")||', '||COALESCE("p"."AppliedColorWrittenDescription"), '; ') as "CeramicDecTechAppliedColorCombination",
"q"."CeramicGenre" as "CeramicGenre",
'Ceramic' as "ArtifactType",
"a"."Published"

FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextUnitType" AS "d"	on "c"."UnitTypeID" = "d"."UnitTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblCeramic" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
left join "public"."tblCeramicVesselCategory" AS "j" on	"i"."CeramicVesselCategoryID" = "j"."CeramicVesselCategoryID"
left join "public"."tblCeramicForm" AS "k" on	"i"."CeramicFormID" = "k"."CeramicFormID"	
left join "public"."tblCeramicManuTech" AS "l" on	"i"."CeramicManuTechID" = "l"."CeramicManuTechID"
LEFT JOIN "public"."tblCeramicWare" as "m" ON "i"."WareID" = "m"."WareID"
left join "public"."tblCeramicDecTech" AS "n" on  "i"."ArtifactID" = "n"."ArtifactID"
left join "public"."tblCeramicDecTechType" AS "o" on  "n"."CeramicDecTechTypeID" = "o"."CeramicDecTechTypeID"
left join "public"."tblMunsellAppliedColor" AS "p" on	"n"."MunAppColorID" = "p"."MunAppColorID"
left join "public"."tblCeramicGenre" AS "q" on "i"."CeramicGenreID" = "q"."CeramicGenreID"

Group BY
"ProjectName",
"a"."ProjectID",
"c"."Context",
"d"."UnitType",
"f"."FeatureType",
"e"."FeatureNumber",
"e"."FeatureGroup",
"c"."QuadratID",
"c"."DAACSStratigraphicGroup",
"c"."DAACSPhase",
"j"."CeramicVesselCategory",
"k"."CeramicForm",
"l"."CeramicManuTech",
"m"."Ware",
"q"."CeramicGenre",
"ArtifactType"

ORDER BY
"ProjectName" ASC,
"Context" ASC,
"ArtifactType";

--Faunal--
create view aq_two_context_bones as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."Context" AS "Context",
"d"."UnitType" AS "UnitType",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureNumber" AS "FeatureNumber",
"e"."FeatureGroup" AS "FeatureGroup",
"c"."QuadratID" AS "QuadratID",
"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
"c"."DAACSPhase" AS "DAACSPhase",
Sum("i"."Quantity") AS "TotalCount",
"j"."English" as "Form",
'' as "VesselCategory",
'' AS "ManufacturingTechnique",
'' AS "Material",
'' AS "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Faunal' as "ArtifactType",
"a"."Published"


FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextUnitType" AS "d"	on "c"."UnitTypeID" = "d"."UnitTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblBone" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBoneTaxon" as "j" ON "i"."TaxonID" = "j"."TaxonID"



Group BY
"ProjectName",
"a"."ProjectID",
"c"."Context",
"d"."UnitType",
"f"."FeatureType",
"e"."FeatureNumber",
"e"."FeatureGroup",
"c"."QuadratID",
"c"."DAACSStratigraphicGroup",
"c"."DAACSPhase",
"j"."English",
"VesselCategory",
"ManufacturingTechnique",
"Material",
"CeramicDecTechAppliedColorCombination",
"CeramicGenre",
"ArtifactType"

ORDER BY
"ProjectName" ASC,
"Context" ASC,
"ArtifactType";

--General Artifacts--
create view aq_two_context_gen_artifacts as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."Context" AS "Context",
"d"."UnitType" AS "UnitType",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureNumber" AS "FeatureNumber",
"e"."FeatureGroup" AS "FeatureGroup",
"c"."QuadratID" AS "QuadratID",
"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
"c"."DAACSPhase" AS "DAACSPhase",
Sum("i"."Quantity") AS "TotalCount",
"j"."GenArtifactForm" AS "Form",
string_agg(distinct COALESCE("l"."GenArtifactMaterialType"), '; ') as "Material",
string_agg(distinct COALESCE("m"."GenArtifactManuTech"), '; ') as "ManufacturingTechnique",
'' as "VesselCategory",
'' as "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'General Artifacts' as "ArtifactType",
"a"."Published"



FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextUnitType" AS "d"	on "c"."UnitTypeID" = "d"."UnitTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblGenArtifact" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblGenArtifactForm" as "j" ON "i"."GenArtifactFormID" = "j"."GenArtifactFormID"
left join "public"."tblGenArtifactMaterial" as "k" on "i"."ArtifactID" = "k"."ArtifactID"
left join "public"."tblGenArtifactMaterialType" as "l" on "k"."GenArtifactMaterialTypeID" = "l"."GenArtifactMaterialTypeID"
left join "public"."tblGenArtifactManuTech" as "m" on "k"."GenArtifactManuTechID" = "m"."GenArtifactManuTechID"

Group BY
"ProjectName",
"a"."ProjectID",
"c"."Context",
"d"."UnitType",
"f"."FeatureType",
"e"."FeatureNumber",
"e"."FeatureGroup",
"c"."QuadratID",
"c"."DAACSStratigraphicGroup",
"c"."DAACSPhase",
"j"."GenArtifactForm",
"VesselCategory",
"CeramicDecTechAppliedColorCombination",
"CeramicGenre",
"ArtifactType"

ORDER BY
"ProjectName" ASC,
"Context" ASC,
"ArtifactType";

--Glass--
create view aq_two_context_glasses as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."Context" AS "Context",
"d"."UnitType" AS "UnitType",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureNumber" AS "FeatureNumber",
"e"."FeatureGroup" AS "FeatureGroup",
"c"."QuadratID" AS "QuadratID",
"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
"c"."DAACSPhase" AS "DAACSPhase",
Sum("i"."Quantity") AS "TotalCount",
"j"."GlassForm" as "Form",
"l"."GlassVesselCategory" as "VesselCategory",
"m"."GlassManuTech" AS "ManufacturingTechnique",
"k"."GlassMaterial" AS "Material",
'' AS "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Glass' AS "ArtifactType",
"a"."Published"



FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextUnitType" AS "d"	on "c"."UnitTypeID" = "d"."UnitTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblGlass" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblGlassForm" as "j" ON "i"."GlassFormID" = "j"."GlassFormID"
LEFT JOIN "public"."tblGlassMaterial" AS "k" ON "i"."GlassMaterialID" = "k"."GlassMaterialID"
LEFT join "public"."tblGlassVesselCategory" AS "l" on "i"."GlassVesselCategoryID" = "l"."GlassVesselCategoryID"
LEFT JOIN "public"."tblGlassManuTech" AS "m" ON "i"."GlassManuTechID" = "m"."GlassManuTechID"

Group BY
"ProjectName",
"a"."ProjectID",
"c"."Context",
"d"."UnitType",
"f"."FeatureType",
"e"."FeatureNumber",
"e"."FeatureGroup",
"c"."QuadratID",
"c"."DAACSStratigraphicGroup",
"c"."DAACSPhase",
"j"."GlassForm",
"l"."GlassVesselCategory" ,
"m"."GlassManuTech",
"k"."GlassMaterial",
"CeramicDecTechAppliedColorCombination",
"CeramicGenre",
"ArtifactType"

ORDER BY
"ProjectName" ASC,
"Context" ASC,
"ArtifactType";

--Tobacco Pipes--
create view aq_two_context_tobacco_pipes as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."Context" AS "Context",
"d"."UnitType" AS "UnitType",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureNumber" AS "FeatureNumber",
"e"."FeatureGroup" AS "FeatureGroup",
"c"."QuadratID" AS "QuadratID",
"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
"c"."DAACSPhase" AS "DAACSPhase",
Sum("i"."Quantity") AS "TotalCount",
'Tobacco Pipe: '||"j"."TobaccoPipeCompleteness" AS "Form",
'' as "VesselCategory",
"l"."TobaccoPipeManuTech" AS "ManufacturingTechnique",
"k"."TobaccoPipeMaterial" AS "Material",
'' AS "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Tobacco Pipe' AS "ArtifactType",
"a"."Published"

FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextUnitType" AS "d"	on "c"."UnitTypeID" = "d"."UnitTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblTobaccoPipe" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblTobaccoPipeCompleteness" as "j" ON "i"."TobaccoPipeCompletenessID" = "j"."TobaccoPipeCompletenessID"
left join "public"."tblTobaccoPipeMaterial" AS "k" on	"i"."TobaccoPipeMaterialID" = "k"."TobaccoPipeMaterialID"
left join "public"."tblTobaccoPipeManuTech" AS "l" on	"i"."TobaccoPipeManuTechID" = "l"."TobaccoPipeManuTechID"

Group BY
"ProjectName",
"a"."ProjectID",
"c"."Context",
"d"."UnitType",
"f"."FeatureType",
"e"."FeatureNumber",
"e"."FeatureGroup",
"c"."QuadratID",
"c"."DAACSStratigraphicGroup",
"c"."DAACSPhase",
"Form",
"VesselCategory",
"l"."TobaccoPipeManuTech",
"k"."TobaccoPipeMaterial",
"CeramicDecTechAppliedColorCombination",
"CeramicGenre",
"ArtifactType"

ORDER BY
"ProjectName" ASC,
"Context" ASC,
"ArtifactType";



--Utensils--
create view aq_two_context_utensils as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."Context" AS "Context",
"d"."UnitType" AS "UnitType",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureNumber" AS "FeatureNumber",
"e"."FeatureGroup" AS "FeatureGroup",
"c"."QuadratID" AS "QuadratID",
"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
"c"."DAACSPhase" AS "DAACSPhase",
Sum("i"."Quantity") AS "TotalCount",
'Utensil: '||"j"."UtensilForm" AS "Form",
'' as "VesselCategory",
string_agg(distinct COALESCE("m"."UtensilMaterial"), '; ') as "Material",
string_agg(distinct COALESCE("l"."UtensilManuTech"), '; ') as "ManufacturingTechnique",
'' AS "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Utensil' AS "ArtifactType",
"a"."Published"

FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextUnitType" AS "d"	on "c"."UnitTypeID" = "d"."UnitTypeID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblUtensil" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblUtensilForm" as "j" ON "i"."UtensilFormID" = "j"."UtensilFormID"
left join "public"."tblUtensilSpecific" as "k" on "i"."ArtifactID" = "k"."ArtifactID"
left join "public"."tblUtensilManuTech" as "l" on "k"."UtensilManuTechID" = "l"."UtensilManuTechID"
left join "public"."tblUtensilMaterial" as "m" on "k"."UtensilMaterialID" = "m"."UtensilMaterialID"

Group BY
"ProjectName",
"a"."ProjectID",
"c"."Context",
"d"."UnitType",
"f"."FeatureType",
"e"."FeatureNumber",
"e"."FeatureGroup",
"c"."QuadratID",
"c"."DAACSStratigraphicGroup",
"c"."DAACSPhase",
"Form",
"VesselCategory",
"CeramicDecTechAppliedColorCombination",
"CeramicGenre",
"ArtifactType"

ORDER BY
"ProjectName" ASC,
"Context" ASC,
"ArtifactType";

