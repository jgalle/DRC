--File Name: AQ2_UnitType_DRC_Done
--Created by: Jillian Galle
--Last Updated: 25 March 2015 by jeg
--Artifact Query 2 Unit Type: This file returns detailed data for all artifacts by Unit Type for the DRC Website.

--Beads--
create view aq_two_unit_types as
SELECT
	"b"."ProjectName" AS "ProjectName",
	"a"."ProjectID" AS "ProjectID",
	"c"."Context" AS "Context",
	"cc"."DepositType" AS "DepositType",
	"d"."UnitType" AS "UnitType",
	"f"."FeatureType" AS "FeatureType",
	"e"."FeatureNumber" AS "FeatureNumber",
	"e"."FeatureGroup" AS "FeatureGroup",
	"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
	"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
	"c"."DAACSStratigraphicGroupInterpretation" AS "DAACSStratigraphicGroupInterpretation",
	"c"."DAACSPhase" AS "DAACSPhase",
	"i"."ArtifactID" AS "ArtifactID",
	"i"."Quantity" AS "Quantity",
	'Bead, ' || "j"."BeadShape" AS "Form",
	"k"."BeadMaterial" AS "Material",
	l."BeadManuTech" AS "ManufacturingTechnique",
	'' AS "VesselCategory",
	'' AS "CeramicDecTechAppliedColorCombination",
	'' AS "CeramicGenre",
	'Bead' AS "ArtifactType",
	a."Published"
FROM
	"public"."tblProject" AS "a"
LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
LEFT JOIN "public"."tblContextDepositType" AS "cc" ON "c"."DepositTypeID" = "cc"."DepositTypeID"
LEFT JOIN "public"."tblContextUnitType" AS "d" ON "c"."UnitTypeID" = "d"."UnitTypeID"
LEFT JOIN "public"."tblContextFeature" AS "e" ON "c"."ProjectID" = "e"."ProjectID"
AND "c"."FeatureNumber" = "e"."FeatureNumber"
LEFT JOIN "public"."tblContextFeatureType" AS "f" ON "e"."FeatureTypeID" = "f"."FeatureTypeID"
INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblBead" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBeadShape" AS "j" ON "i"."BeadShapeID" = "j"."BeadShapeID"
LEFT JOIN "public"."tblBeadMaterial" AS "k" ON i."BeadMaterialID" = "k"."BeadMaterialID"
LEFT JOIN "public"."tblBeadManuTech" AS l ON i."BeadManuTechID" = l."BeadManuTechID"

WHERE
					--Step 2: Site Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Stewart Castle Village') 
					
					--Step 1: Unit Type Selection. Users select "All Unit Types" OR one or more Unit Types for that project through a text box with wildcard search option.
						AND "d"."UnitType"  IN ('STP') 


UNION ALL
	--Buckles--
	SELECT
		"b"."ProjectName" AS "ProjectName",
		"a"."ProjectID" AS "ProjectID",
		"c"."Context" AS "Context",
		"cc"."DepositType" AS "DepositType",
		"d"."UnitType" AS "UnitType",
		"f"."FeatureType" AS "FeatureType",
		"e"."FeatureNumber" AS "FeatureNumber",
		"e"."FeatureGroup" AS "FeatureGroup",
		"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
		"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
		"c"."DAACSStratigraphicGroupInterpretation" AS "DAACSStratigraphicGroupInterpretation",
		"c"."DAACSPhase" AS "DAACSPhase",
		"i"."ArtifactID" AS "ArtifactID",
		"i"."Quantity" AS "Quantity",
		'Buckle, ' || "j"."BuckleType" AS "Form",
		"o"."BuckleMaterial" AS "Material",
		"p"."BuckleManuTech" AS "ManufacturingTechnique",
		'' AS "VesselCategory",
		'' AS "CeramicDecTechAppliedColorCombination",
		'' AS "CeramicGenre",
		'Buckle' AS "ArtifactType",
	a."Published"
	FROM
		"public"."tblProject" AS "a"
	LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
	INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
	LEFT JOIN "public"."tblContextDepositType" AS "cc" ON "c"."DepositTypeID" = "cc"."DepositTypeID"
	LEFT JOIN "public"."tblContextUnitType" AS "d" ON "c"."UnitTypeID" = "d"."UnitTypeID"
	LEFT JOIN "public"."tblContextFeature" AS "e" ON "c"."ProjectID" = "e"."ProjectID"
	AND "c"."FeatureNumber" = "e"."FeatureNumber"
	LEFT JOIN "public"."tblContextFeatureType" AS "f" ON "e"."FeatureTypeID" = "f"."FeatureTypeID"
	INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
	INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
	INNER JOIN "public"."tblBuckle" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
	LEFT JOIN "public"."tblBuckleType" AS "j" ON "i"."BuckleTypeID" = "j"."BuckleTypeID"
	LEFT JOIN "public"."tblBuckleForm" AS "k" ON "i"."ArtifactID" = "k"."ArtifactID"
	LEFT JOIN "public"."tblBuckleMaterial" AS "o" ON "k"."BuckleMaterialID" = "o"."BuckleMaterialID"
	LEFT JOIN "public"."tblBuckleManuTech" AS "p" ON "k"."BuckleManuTechID" = "p"."BuckleManuTechID"
	
WHERE
					--Step 2: Site Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Stewart Castle Village') 
					
					--Step 1: Unit Type Selection. Users select "All Unit Types" OR one or more Unit Types for that project through a text box with wildcard search option.
						AND "d"."UnitType"  IN ('STP') 
				
UNION ALL

		--Buttons--
		SELECT
			"b"."ProjectName" AS "ProjectName",
			"a"."ProjectID" AS "ProjectID",
			"c"."Context" AS "Context",
			"cc"."DepositType" AS "DepositType",
			"d"."UnitType" AS "UnitType",
			"f"."FeatureType" AS "FeatureType",
			"e"."FeatureNumber" AS "FeatureNumber",
			"e"."FeatureGroup" AS "FeatureGroup",
			"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
			"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
			"c"."DAACSStratigraphicGroupInterpretation" AS "DAACSStratigraphicGroupInterpretation",
			"c"."DAACSPhase" AS "DAACSPhase",
			"i"."ArtifactID" AS "ArtifactID",
			"i"."Quantity" AS "Quantity",
			'Button, ' || "j"."ButtonType" AS "Form",
			"q"."ButtonMaterial" AS "Material",
			"k"."ButtonManuTech" AS "ManufacturingTechnique",
			'' AS "VesselCategory",
			'' AS "CeramicDecTechAppliedColorCombination",
			'' AS "CeramicGenre",
			'Button' AS "ArtifactType",
	a."Published"
		FROM
			"public"."tblProject" AS "a"
		LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
		INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
		LEFT JOIN "public"."tblContextDepositType" AS "cc" ON "c"."DepositTypeID" = "cc"."DepositTypeID"
		LEFT JOIN "public"."tblContextUnitType" AS "d" ON "c"."UnitTypeID" = "d"."UnitTypeID"
		LEFT JOIN "public"."tblContextFeature" AS "e" ON "c"."ProjectID" = "e"."ProjectID"
		AND "c"."FeatureNumber" = "e"."FeatureNumber"
		LEFT JOIN "public"."tblContextFeatureType" AS "f" ON "e"."FeatureTypeID" = "f"."FeatureTypeID"
		INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
		INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
		INNER JOIN "public"."tblButton" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
		LEFT JOIN "public"."tblButtonType" AS "j" ON "i"."ButtonTypeID" = "j"."ButtonTypeID"
		LEFT JOIN "public"."tblButtonManuTech" AS "k" ON "i"."ButtonManuTechID" = "k"."ButtonManuTechID"
		LEFT JOIN "public"."tblButtonMaterial" AS "q" ON "i"."ButtonMaterialID" = "q"."ButtonMaterialID"
WHERE
					--Step 2: Site Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Stewart Castle Village') 
					
					--Step 1: Unit Type Selection. Users select "All Unit Types" OR one or more Unit Types for that project through a text box with wildcard search option.
						AND "d"."UnitType"  IN ('STP') 


UNION ALL

--Ceramics--
			SELECT
				"b"."ProjectName" AS "ProjectName",
				"a"."ProjectID" AS "ProjectID",
				"c"."Context" AS "Context",
				"cc"."DepositType" AS "DepositType",
				"d"."UnitType" AS "UnitType",
				"f"."FeatureType" AS "FeatureType",
				"e"."FeatureNumber" AS "FeatureNumber",
				"e"."FeatureGroup" AS "FeatureGroup",
				"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
				"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
				"c"."DAACSStratigraphicGroupInterpretation" AS "DAACSStratigraphicGroupInterpretation",
				"c"."DAACSPhase" AS "DAACSPhase",
				"i"."ArtifactID" AS "ArtifactID",
				"i"."Quantity" AS "Quantity",
				"k"."CeramicForm" AS "Form",
				"m"."Ware" AS "Material",
				"l"."CeramicManuTech" AS "ManufacturingTechnique",
				"j"."CeramicVesselCategory" AS "VesselCategory",
				string_agg (
					DISTINCT COALESCE ("o"."CeramicDecTechType") || ', ' || COALESCE (
						"p"."AppliedColorWrittenDescription"
					),
					'; '
				) AS "CeramicDecTechAppliedColorCombination",
				"q"."CeramicGenre" AS "CeramicGenre",
				'Ceramic' AS "ArtifactType",
	a."Published"

			FROM
				"public"."tblProject" AS "a"
			LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
			INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
			LEFT JOIN "public"."tblContextDepositType" AS "cc" ON "c"."DepositTypeID" = "cc"."DepositTypeID"
			LEFT JOIN "public"."tblContextUnitType" AS "d" ON "c"."UnitTypeID" = "d"."UnitTypeID"
			LEFT JOIN "public"."tblContextFeature" AS "e" ON "c"."ProjectID" = "e"."ProjectID"
			AND "c"."FeatureNumber" = "e"."FeatureNumber"
			LEFT JOIN "public"."tblContextFeatureType" AS "f" ON "e"."FeatureTypeID" = "f"."FeatureTypeID"
			INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
			INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
			INNER JOIN "public"."tblCeramic" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
			LEFT JOIN "public"."tblCeramicVesselCategory" AS "j" ON "i"."CeramicVesselCategoryID" = "j"."CeramicVesselCategoryID"
			LEFT JOIN "public"."tblCeramicForm" AS "k" ON "i"."CeramicFormID" = "k"."CeramicFormID"
			LEFT JOIN "public"."tblCeramicManuTech" AS "l" ON "i"."CeramicManuTechID" = "l"."CeramicManuTechID"
			LEFT JOIN "public"."tblCeramicWare" AS "m" ON "i"."WareID" = "m"."WareID"
			LEFT JOIN "public"."tblCeramicDecTech" AS "n" ON "i"."ArtifactID" = "n"."ArtifactID"
			LEFT JOIN "public"."tblCeramicDecTechType" AS "o" ON "n"."CeramicDecTechTypeID" = "o"."CeramicDecTechTypeID"
			LEFT JOIN "public"."tblMunsellAppliedColor" AS "p" ON "n"."MunAppColorID" = "p"."MunAppColorID"
			LEFT JOIN "public"."tblCeramicGenre" AS "q" ON "i"."CeramicGenreID" = "q"."CeramicGenreID"
			
WHERE
					--Step 2: Site Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Stewart Castle Village') 
					
					--Step 1: Unit Type Selection. Users select "All Unit Types" OR one or more Unit Types for that project through a text box with wildcard search option.
						AND "d"."UnitType"  IN ('STP') 



GROUP BY
					"b"."ProjectName",
						"a"."ProjectID",
						"c"."Context",
						"cc"."DepositType",
						"d"."UnitType",
						"f"."FeatureType",
						"e"."FeatureNumber",
						"e"."FeatureGroup",
						"e"."FeatureGroupInterpretation",
						"c"."DAACSStratigraphicGroup",
						"c"."DAACSStratigraphicGroupInterpretation",
						"c"."DAACSPhase",
						"i"."ArtifactID",
						"i"."Quantity",
						"Form",
						"Material",
						"ManufacturingTechnique",
						"VesselCategory",						
						"CeramicGenre",
						"ArtifactType",
						"Published"

			UNION ALL

				--Faunal--
				SELECT
					"b"."ProjectName" AS "ProjectName",
					"a"."ProjectID" AS "ProjectID",
					"c"."Context" AS "Context",
					"cc"."DepositType" AS "DepositType",
					"d"."UnitType" AS "UnitType",
					"f"."FeatureType" AS "FeatureType",
					"e"."FeatureNumber" AS "FeatureNumber",
					"e"."FeatureGroup" AS "FeatureGroup",
					"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
					"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
					"c"."DAACSStratigraphicGroupInterpretation" AS "DAACSStratigraphicGroupInterpretation",
					"c"."DAACSPhase" AS "DAACSPhase",
					"i"."ArtifactID" AS "ArtifactID",
					"i"."Quantity" AS "Quantity",
					"j"."English" AS "Form",
					'' AS "VesselCategory",
					'' AS "Material",
					'' AS "ManufacturingTechnique",
					'' AS "CeramicDecTechAppliedColorCombination",
					'' AS "CeramicGenre",
					'Faunal' AS "ArtifactType",
	a."Published"
				FROM
					"public"."tblProject" AS "a"
				LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
				INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
				LEFT JOIN "public"."tblContextDepositType" AS "cc" ON "c"."DepositTypeID" = "cc"."DepositTypeID"
				LEFT JOIN "public"."tblContextUnitType" AS "d" ON "c"."UnitTypeID" = "d"."UnitTypeID"
				LEFT JOIN "public"."tblContextFeature" AS "e" ON "c"."ProjectID" = "e"."ProjectID"
				AND "c"."FeatureNumber" = "e"."FeatureNumber"
				LEFT JOIN "public"."tblContextFeatureType" AS "f" ON "e"."FeatureTypeID" = "f"."FeatureTypeID"
				INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
				INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
				INNER JOIN "public"."tblBone" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
				LEFT JOIN "public"."tblBoneTaxon" AS "j" ON "i"."TaxonID" = "j"."TaxonID"
				
WHERE
					--Step 2: Site Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Stewart Castle Village') 
					
					--Step 1: Unit Type Selection. Users select "All Unit Types" OR one or more Unit Types for that project through a text box with wildcard search option.
						AND "d"."UnitType"  IN ('STP') 
				

UNION ALL

--General Artifacts--
					SELECT
						"b"."ProjectName" AS "ProjectName",
						"a"."ProjectID" AS "ProjectID",
						"c"."Context" AS "Context",
						"cc"."DepositType" AS "DepositType",
						"d"."UnitType" AS "UnitType",
						"f"."FeatureType" AS "FeatureType",
						"e"."FeatureNumber" AS "FeatureNumber",
						"e"."FeatureGroup" AS "FeatureGroup",
						"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
						"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
						"c"."DAACSStratigraphicGroupInterpretation" AS "DAACSStratigraphicGroupInterpretation",
						"c"."DAACSPhase" AS "DAACSPhase",
						"i"."ArtifactID" AS "ArtifactID",
						"i"."Quantity" AS "Quantity",
						"j"."GenArtifactForm" AS "Form",
						string_agg (
							DISTINCT COALESCE (
								"l"."GenArtifactMaterialType"
							),
							'; '
						) AS "Material",
						string_agg (
							DISTINCT COALESCE ("m"."GenArtifactManuTech"),
							'; '
						) AS "ManufacturingTechnique",
						'' AS "VesselCategory",
						'' AS "CeramicDecTechAppliedColorCombination",
						'' AS "CeramicGenre",
						'General Artifacts' AS "ArtifactType",
	a."Published"
					FROM
						"public"."tblProject" AS "a"
					LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
					INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
					LEFT JOIN "public"."tblContextDepositType" AS "cc" ON "c"."DepositTypeID" = "cc"."DepositTypeID"
					LEFT JOIN "public"."tblContextUnitType" AS "d" ON "c"."UnitTypeID" = "d"."UnitTypeID"
					LEFT JOIN "public"."tblContextFeature" AS "e" ON "c"."ProjectID" = "e"."ProjectID"
					AND "c"."FeatureNumber" = "e"."FeatureNumber"
					LEFT JOIN "public"."tblContextFeatureType" AS "f" ON "e"."FeatureTypeID" = "f"."FeatureTypeID"
					INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
					INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
					INNER JOIN "public"."tblGenArtifact" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
					LEFT JOIN "public"."tblGenArtifactForm" AS "j" ON "i"."GenArtifactFormID" = "j"."GenArtifactFormID"
					LEFT JOIN "public"."tblGenArtifactMaterial" AS "k" ON "i"."ArtifactID" = "k"."ArtifactID"
					LEFT JOIN "public"."tblGenArtifactMaterialType" AS "l" ON "k"."GenArtifactMaterialTypeID" = "l"."GenArtifactMaterialTypeID"
					LEFT JOIN "public"."tblGenArtifactManuTech" AS "m" ON "k"."GenArtifactManuTechID" = "m"."GenArtifactManuTechID"
					
WHERE
					--Step 2: Site Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Stewart Castle Village') 
					
					--Step 1: Unit Type Selection. Users select "All Unit Types" OR one or more Unit Types for that project through a text box with wildcard search option.
						AND "d"."UnitType"  IN ('STP') 

				
GROUP BY
						"b"."ProjectName",
						"a"."ProjectID",
						"c"."Context",
						"cc"."DepositType",
						"d"."UnitType",
						"f"."FeatureType",
						"e"."FeatureNumber",
						"e"."FeatureGroup",
						"e"."FeatureGroupInterpretation",
						"c"."DAACSStratigraphicGroup",
						"c"."DAACSStratigraphicGroupInterpretation",
						"c"."DAACSPhase",
						"i"."ArtifactID",
						"i"."Quantity",
						"Form",
						"VesselCategory",
						"CeramicDecTechAppliedColorCombination",
						"CeramicGenre",
						"ArtifactType",
						"Published"


UNION ALL

--Glass--
						SELECT
							"b"."ProjectName" AS "ProjectName",
							"a"."ProjectID" AS "ProjectID",
							"c"."Context" AS "Context",
							"cc"."DepositType" AS "DepositType",
							"d"."UnitType" AS "UnitType",
							"f"."FeatureType" AS "FeatureType",
							"e"."FeatureNumber" AS "FeatureNumber",
							"e"."FeatureGroup" AS "FeatureGroup",
							"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
							"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
							"c"."DAACSStratigraphicGroupInterpretation" AS "DAACSStratigraphicGroupInterpretation",
							"c"."DAACSPhase" AS "DAACSPhase",
							"i"."ArtifactID" AS "ArtifactID",
							"i"."Quantity" AS "Quantity",
							"j"."GlassForm" AS "Form",
							"k"."GlassMaterial" AS "Material",
							"m"."GlassManuTech" AS "ManufacturingTechnique",
							"l"."GlassVesselCategory" AS "VesselCategory",				
							
							'' AS "CeramicDecTechAppliedColorCombination",
							'' AS "CeramicGenre",
							'Glass' AS "ArtifactType",
	a."Published"
						FROM
							"public"."tblProject" AS "a"
						LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
						INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
						LEFT JOIN "public"."tblContextDepositType" AS "cc" ON "c"."DepositTypeID" = "cc"."DepositTypeID"
						LEFT JOIN "public"."tblContextUnitType" AS "d" ON "c"."UnitTypeID" = "d"."UnitTypeID"
						LEFT JOIN "public"."tblContextFeature" AS "e" ON "c"."ProjectID" = "e"."ProjectID"
						AND "c"."FeatureNumber" = "e"."FeatureNumber"
						LEFT JOIN "public"."tblContextFeatureType" AS "f" ON "e"."FeatureTypeID" = "f"."FeatureTypeID"
						INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
						INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
						INNER JOIN "public"."tblGlass" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
						LEFT JOIN "public"."tblGlassForm" AS "j" ON "i"."GlassFormID" = "j"."GlassFormID"
						LEFT JOIN "public"."tblGlassMaterial" AS "k" ON "i"."GlassMaterialID" = "k"."GlassMaterialID"
						LEFT JOIN "public"."tblGlassVesselCategory" AS "l" ON "i"."GlassVesselCategoryID" = "l"."GlassVesselCategoryID"
						LEFT JOIN "public"."tblGlassManuTech" AS "m" ON "i"."GlassManuTechID" = "m"."GlassManuTechID"
					
WHERE
					--Step 2: Site Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Stewart Castle Village') 
					
					--Step 1: Unit Type Selection. Users select "All Unit Types" OR one or more Unit Types for that project through a text box with wildcard search option.
						AND "d"."UnitType"  IN ('STP') 


UNION ALL
							
--Tobacco Pipes--
							SELECT
								"b"."ProjectName" AS "ProjectName",
								"a"."ProjectID" AS "ProjectID",
								"c"."Context" AS "Context",
								"cc"."DepositType" AS "DepositType",
								"d"."UnitType" AS "UnitType",
								"f"."FeatureType" AS "FeatureType",
								"e"."FeatureNumber" AS "FeatureNumber",
								"e"."FeatureGroup" AS "FeatureGroup",
								"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
								"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
								"c"."DAACSStratigraphicGroupInterpretation" AS "DAACSStratigraphicGroupInterpretation",
								"c"."DAACSPhase" AS "DAACSPhase",
								"i"."ArtifactID" AS "ArtifactID",
								"i"."Quantity" AS "Quantity",
								'Tobacco Pipe: ' || "j"."TobaccoPipeCompleteness" AS "Form",
								"k"."TobaccoPipeMaterial" AS "Material",
								"l"."TobaccoPipeManuTech" AS "ManufacturingTechnique",
								'' AS "VesselCategory",					
								
								'' AS "CeramicDecTechAppliedColorCombination",
								'' AS "CeramicGenre",
								'Tobacco Pipe' AS "ArtifactType",
	a."Published"

							FROM
								"public"."tblProject" AS "a"
							LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
							INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
							LEFT JOIN "public"."tblContextDepositType" AS "cc" ON "c"."DepositTypeID" = "cc"."DepositTypeID"
							LEFT JOIN "public"."tblContextUnitType" AS "d" ON "c"."UnitTypeID" = "d"."UnitTypeID"
							LEFT JOIN "public"."tblContextFeature" AS "e" ON "c"."ProjectID" = "e"."ProjectID"
							AND "c"."FeatureNumber" = "e"."FeatureNumber"
							LEFT JOIN "public"."tblContextFeatureType" AS "f" ON "e"."FeatureTypeID" = "f"."FeatureTypeID"
							INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
							INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
							INNER JOIN "public"."tblTobaccoPipe" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
							LEFT JOIN "public"."tblTobaccoPipeCompleteness" AS "j" ON "i"."TobaccoPipeCompletenessID" = "j"."TobaccoPipeCompletenessID"
							LEFT JOIN "public"."tblTobaccoPipeMaterial" AS "k" ON "i"."TobaccoPipeMaterialID" = "k"."TobaccoPipeMaterialID"
							LEFT JOIN "public"."tblTobaccoPipeManuTech" AS "l" ON "i"."TobaccoPipeManuTechID" = "l"."TobaccoPipeManuTechID"

UNION ALL
							

	--Utensils--
								SELECT
									"b"."ProjectName" AS "ProjectName",
									"a"."ProjectID" AS "ProjectID",
									"c"."Context" AS "Context",
									"cc"."DepositType" AS "DepositType",
									"d"."UnitType" AS "UnitType",
									"f"."FeatureType" AS "FeatureType",
									"e"."FeatureNumber" AS "FeatureNumber",
									"e"."FeatureGroup" AS "FeatureGroup",
									"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
									"c"."DAACSStratigraphicGroup" AS "DAACSStratigraphicGroup",
									"c"."DAACSStratigraphicGroupInterpretation" AS "DAACSStratigraphicGroupInterpretation",
									"c"."DAACSPhase" AS "DAACSPhase",
									"i"."ArtifactID" AS "ArtifactID",
									"i"."Quantity" AS "Quantity",
									'Utensil: ' || "j"."UtensilForm" AS "Form",
									string_agg (
										DISTINCT COALESCE ("m"."UtensilMaterial"),
										'; '
									) AS "Material",
									string_agg (
										DISTINCT COALESCE ("l"."UtensilManuTech"),
										'; '
									) AS "ManufacturingTechnique",
									'' AS "VesselCategory",
									'' AS "CeramicDecTechAppliedColorCombination",
									'' AS "CeramicGenre",
									'Utensil' AS "ArtifactType",
	a."Published"
								FROM
									"public"."tblProject" AS "a"
								LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
								INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
								LEFT JOIN "public"."tblContextDepositType" AS "cc" ON "c"."DepositTypeID" = "cc"."DepositTypeID"
								LEFT JOIN "public"."tblContextUnitType" AS "d" ON "c"."UnitTypeID" = "d"."UnitTypeID"
								LEFT JOIN "public"."tblContextFeature" AS "e" ON "c"."ProjectID" = "e"."ProjectID"
								AND "c"."FeatureNumber" = "e"."FeatureNumber"
								LEFT JOIN "public"."tblContextFeatureType" AS "f" ON "e"."FeatureTypeID" = "f"."FeatureTypeID"
								INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
								INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
								INNER JOIN "public"."tblUtensil" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
								LEFT JOIN "public"."tblUtensilForm" AS "j" ON "i"."UtensilFormID" = "j"."UtensilFormID"
								LEFT JOIN "public"."tblUtensilSpecific" AS "k" ON "i"."ArtifactID" = "k"."ArtifactID"
								LEFT JOIN "public"."tblUtensilManuTech" AS "l" ON "k"."UtensilManuTechID" = "l"."UtensilManuTechID"
								LEFT JOIN "public"."tblUtensilMaterial" AS "m" ON "k"."UtensilMaterialID" = "m"."UtensilMaterialID"
WHERE
					--Step 2: Site Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Stewart Castle Village') 
					
					--Step 1: Unit Type Selection. Users select "All Unit Types" OR one or more Unit Types for that project through a text box with wildcard search option.
						AND "d"."UnitType"  IN ('STP') 
				

GROUP BY
									"b"."ProjectName",
						"a"."ProjectID",
						"c"."Context",
						"cc"."DepositType",
						"d"."UnitType",
						"f"."FeatureType",
						"e"."FeatureNumber",
						"e"."FeatureGroup",
						"e"."FeatureGroupInterpretation",
						"c"."DAACSStratigraphicGroup",
						"c"."DAACSStratigraphicGroupInterpretation",
						"c"."DAACSPhase",
						"i"."ArtifactID",
						"i"."Quantity",
						"Form",
						"VesselCategory",
						"CeramicDecTechAppliedColorCombination",
						"CeramicGenre",
						"ArtifactType",
	"Published"

ORDER BY
"ProjectName" ASC,
"UnitType" ASC,
"ArtifactType"