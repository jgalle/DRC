--File Name: AQ2_Phase_DRC_Done
--Created by: Jillian Galle
--Last Updated: 25 March 2015 by jeg
--Artifact Query 2 Phase: This file returns detailed data for all artifacts by Phase for the DRC Website.

--Beads--
create view aq_two_phases as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."DAACSPhase" AS "DAACSPhase",
"i"."ArtifactID" AS "ArtifactID",
"i"."Quantity" AS "Quantity",
'Bead, '||"j"."BeadShape" AS "Form",
"k"."BeadMaterial" AS "Material",
l."BeadManuTech" AS "ManufacturingTechnique",
'' as "VesselCategory",
'' as "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Bead' as "ArtifactType",
a."Published"

FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblBead" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBeadShape" as "j" ON "i"."BeadShapeID" = "j"."BeadShapeID"
LEFT JOIN "public"."tblBeadMaterial" AS "k" ON i."BeadMaterialID" = "k"."BeadMaterialID"
LEFT JOIN "public"."tblBeadManuTech" AS l ON i."BeadManuTechID" = l."BeadManuTechID"

WHERE
					--Step 2: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Building o', 'Building s') 
					
					--Step 1: Phase Users select "All SGs" OR one or more Phases for that project through a text box with wildcard search option.
					and "c"."DAACSPhase"  IN ('P01','P02')

UNION ALL

--Buckles--

SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."DAACSPhase" AS "DAACSPhase",
"i"."ArtifactID" AS "ArtifactID",
"i"."Quantity" AS "Quantity",
'Buckle, '||"j"."BuckleType" AS "Form",
"o"."BuckleMaterial" AS "Material",
"p"."BuckleManuTech" AS "ManufacturingTechnique",
'' as "VesselCategory",
'' as "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Buckle' as "ArtifactType",
a."Published"

FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblBuckle" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBuckleType" as "j" ON "i"."BuckleTypeID" = "j"."BuckleTypeID"
left join "public"."tblBuckleForm" AS "k" on "i"."ArtifactID" = "k"."ArtifactID" 
left join "public"."tblBuckleMaterial" AS "o" on "k"."BuckleMaterialID" = "o"."BuckleMaterialID" 
left join "public"."tblBuckleManuTech" AS "p" on "k"."BuckleManuTechID" = "p"."BuckleManuTechID" 

WHERE
					--Step 2: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Building o', 'Building s') 
					
					--Step 1: Phase Users select "All SGs" OR one or more Phases for that project through a text box with wildcard search option.
					and "c"."DAACSPhase"  IN ('P01','P02')


UNION ALL


--Buttons--

SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."DAACSPhase" AS "DAACSPhase",
"i"."ArtifactID" AS "ArtifactID",
"i"."Quantity" AS "Quantity",
'Button, '||"j"."ButtonType" AS "Form",
"q"."ButtonMaterial" AS "Material",
"k"."ButtonManuTech" AS "ManufacturingTechnique",
'' as "VesselCategory",
'' as "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Button' as "ArtifactType",
a."Published"

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

WHERE
					--Step 2: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Building o', 'Building s') 
					--Step 1: Phase Users select "All SGs" OR one or more Phases for that project through a text box with wildcard search option.
					and "c"."DAACSPhase"  IN ('P01','P02')


UNION ALL


--Ceramics--

SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."DAACSPhase" AS "DAACSPhase",
"i"."ArtifactID" AS "ArtifactID",
"i"."Quantity" AS "Quantity",
"k"."CeramicForm" AS "Form",
"m"."Ware" AS "Material",
"l"."CeramicManuTech" AS "ManufacturingTechnique",
"j"."CeramicVesselCategory" as "VesselCategory",
string_agg(distinct COALESCE("o"."CeramicDecTechType")||', '||COALESCE("p"."AppliedColorWrittenDescription"), '; ') as "CeramicDecTechAppliedColorCombination",
"q"."CeramicGenre" as "CeramicGenre",
'Ceramic' as "ArtifactType",
a."Published"

FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
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

WHERE
					--Step 2: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Building o', 'Building s') 
					
					--Step 1: Phase Users select "All SGs" OR one or more Phases for that project through a text box with wildcard search option.
					and "c"."DAACSPhase"  IN ('P01','P02')

Group BY
						"b"."ProjectName",
						"a"."ProjectID",
						"c"."DAACSPhase",
						"i"."ArtifactID",
						"i"."Quantity",
						"Form",
						"Material",
						"ManufacturingTechnique",
						"VesselCategory",						
						"CeramicGenre",
						"ArtifactType",
a."Published"

UNION ALL
--Faunal--

SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."DAACSPhase" AS "DAACSPhase",
"i"."ArtifactID" AS "ArtifactID",
"i"."Quantity" AS "Quantity",
"j"."English" as "Form",
'' AS "Material",
'' AS "ManufacturingTechnique",
'' as "VesselCategory",
'' AS "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Faunal' as "ArtifactType",
a."Published"

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

WHERE
					--Step 2: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Building o', 'Building s') 
					
					--Step 1: Phase Users select "All SGs" OR one or more Phases for that project through a text box with wildcard search option.
					and "c"."DAACSPhase"  IN ('P01','P02')

UNION ALL

--General Artifacts--

SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."DAACSPhase" AS "DAACSPhase",
"i"."ArtifactID" AS "ArtifactID",
"i"."Quantity" AS "Quantity",
"j"."GenArtifactForm" AS "Form",
string_agg(distinct COALESCE("l"."GenArtifactMaterialType"), '; ') as "Material",
string_agg(distinct COALESCE("m"."GenArtifactManuTech"), '; ') as "ManufacturingTechnique",
'' as "VesselCategory",
'' as "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'General Artifacts' as "ArtifactType",
a."Published"

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


WHERE
					--Step 2: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Building o', 'Building s') 
					
					--Step 1: Phase Users select "All SGs" OR one or more Phases for that project through a text box with wildcard search option.
					and "c"."DAACSPhase"  IN ('P01','P02')


Group BY
					"b"."ProjectName",
						"a"."ProjectID",
						"c"."DAACSPhase",
						"i"."ArtifactID",
						"i"."Quantity",
						"Form",
						"VesselCategory",		
						"CeramicDecTechAppliedColorCombination",
						"CeramicGenre",
						"ArtifactType",
a."Published"

UNION ALL

--Glass--

SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."DAACSPhase" AS "DAACSPhase",
"i"."ArtifactID" AS "ArtifactID",
"i"."Quantity" AS "Quantity",
"j"."GlassForm" as "Form",
"k"."GlassMaterial" AS "Material",
"m"."GlassManuTech" AS "ManufacturingTechnique",
"l"."GlassVesselCategory" as "VesselCategory",
'' AS "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Glass' AS "ArtifactType",
a."Published"


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

WHERE
					--Step 2: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Building o', 'Building s') 
					
					--Step 1: Phase Users select "All SGs" OR one or more Phases for that project through a text box with wildcard search option.
					and "c"."DAACSPhase"  IN ('P01','P02')

UNION ALL


--Tobacco Pipes--

SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."DAACSPhase" AS "DAACSPhase",
"i"."ArtifactID" AS "ArtifactID",
"i"."Quantity" AS "Quantity",
'Tobacco Pipe: '||"j"."TobaccoPipeCompleteness" AS "Form",
"k"."TobaccoPipeMaterial" AS "Material",
"l"."TobaccoPipeManuTech" AS "ManufacturingTechnique",
'' as "VesselCategory",
'' AS "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Tobacco Pipe' AS "ArtifactType",
a."Published"

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

WHERE
					--Step 2: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Building o', 'Building s') 
					
					--Step 1: Phase Users select "All SGs" OR one or more Phases for that project through a text box with wildcard search option.
					and "c"."DAACSPhase"  IN ('P01','P02')

UNION ALL

--Utensils--

SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"c"."DAACSPhase" AS "DAACSPhase",
"i"."ArtifactID" AS "ArtifactID",
"i"."Quantity" AS "Quantity",
'Utensil: '||"j"."UtensilForm" AS "Form",
string_agg(distinct COALESCE("m"."UtensilMaterial"), '; ') as "Material",
string_agg(distinct COALESCE("l"."UtensilManuTech"), '; ') as "ManufacturingTechnique",
'' as "VesselCategory",
'' AS "CeramicDecTechAppliedColorCombination",
'' as "CeramicGenre",
'Utensil' AS "ArtifactType",
a."Published"

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

WHERE
					--Step 2: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Building o', 'Building s') 
					
					--Step 1: Phase Users select "All SGs" OR one or more Phases for that project through a text box with wildcard search option.
					and "c"."DAACSPhase"  IN ('P01','P02')


Group BY
						"b"."ProjectName",
						"a"."ProjectID",
						"c"."DAACSPhase",
						"i"."ArtifactID",
						"i"."Quantity",
						"Form",
						"VesselCategory",					
						"CeramicDecTechAppliedColorCombination",
						"CeramicGenre",
						"ArtifactType",
a."Published"

ORDER BY
"ProjectName" ASC,
"DAACSPhase" ASC,
"ArtifactType"  

