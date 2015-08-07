--File Name: 	IQ1_DRC_Done
--Created by: Jillian Galle
--Last Updated: 5 April 2015 by jeg

--Query Description: Query Returns all images for selected sites and include basic artiact data for image. 


--Beads--
create view query_one_images as
SELECT
a."ProjectID",
a."Published",
	"b"."ProjectName" AS "ProjectName",
	"c"."Context" AS "Context",
	"i"."ArtifactID" AS "ArtifactID",
	"i"."Quantity" AS "Quantity",
	'Bead, ' || "j"."BeadShape" AS "Form",
	'' AS "Ware",
	'' AS "CeramicGenre",
string_agg(z."ImageFileLocation", ';') AS "Images",
	'Bead' AS "ArtifactType"


FROM
	"public"."tblProject" AS "a"
LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblBead" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBeadShape" AS "j" ON "i"."BeadShapeID" = "j"."BeadShapeID"
LEFT JOIN "public"."tblArtifactImage" AS "y" ON "i"."ArtifactID" = "y"."ArtifactID"
LEFT JOIN "public"."tblImage" AS "z" ON "y"."ImageID" = "z"."ImageID"

WHERE
					--Step 1: Site Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Papine Village') 		

					AND "z"."ImageFileLocation" IS NOT NULL		
		

Group BY
	"b"."ProjectName",
	"c"."Context",
	"i"."ArtifactID",
	"i"."Quantity",
	"j"."BeadShape",
	"Ware",
	"CeramicGenre",
	"ArtifactType",
	a."ProjectID",
	a."Published"

UNION ALL

	--Buckles--
	SELECT
	a."ProjectID",
	a."Published",
		"b"."ProjectName" AS "ProjectName",
		"c"."Context" AS "Context",
		"i"."ArtifactID" AS "ArtifactID",
		"i"."Quantity" AS "Quantity",
		'Buckle, ' || "j"."BuckleType" AS "Form",
		'' AS "Ware",
		'' AS "CeramicGenre",
		string_agg(z."ImageFileLocation", ';') AS "Images",
		'Buckle' AS "ArtifactType"

	FROM
		"public"."tblProject" AS "a"
	LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
	INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
	INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
	INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
	INNER JOIN "public"."tblBuckle" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
	LEFT JOIN "public"."tblBuckleType" AS "j" ON "i"."BuckleTypeID" = "j"."BuckleTypeID"
	LEFT JOIN "public"."tblBuckleForm" AS "k" ON "i"."ArtifactID" = "k"."ArtifactID"
	LEFT JOIN "public"."tblArtifactImage" AS "y" ON "i"."ArtifactID" = "y"."ArtifactID"
	LEFT JOIN "public"."tblImage" AS "z" ON "y"."ImageID" = "z"."ImageID"
	
WHERE
					--Step 1: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Papine Village') 		

					AND "z"."ImageFileLocation" IS NOT NULL		

Group BY
		"b"."ProjectName",
		"c"."Context",
		"i"."ArtifactID",
		"i"."Quantity",
		"j"."BuckleType",
		"Ware",
		"CeramicGenre",
		"ArtifactType",
		a."ProjectID",
		a."Published"


UNION ALL

		--Buttons--
		SELECT
		a."ProjectID",
		a."Published",
			"b"."ProjectName" AS "ProjectName",
			"c"."Context" AS "Context",
			"i"."ArtifactID" AS "ArtifactID",
			"i"."Quantity" AS "Quantity",
			'Button, ' || "j"."ButtonType" AS "Form",
			'' AS "Ware",
			'' AS "CeramicGenre",
string_agg(z."ImageFileLocation", ';') AS "Images",
			'Button' AS "ArtifactType"

		FROM
			"public"."tblProject" AS "a"
		LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
		INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
		INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
		INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
		INNER JOIN "public"."tblButton" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
		LEFT JOIN "public"."tblButtonType" AS "j" ON "i"."ButtonTypeID" = "j"."ButtonTypeID"
		LEFT JOIN "public"."tblArtifactImage" AS "y" ON "i"."ArtifactID" = "y"."ArtifactID"
		LEFT JOIN "public"."tblImage" AS "z" ON "y"."ImageID" = "z"."ImageID"

WHERE
					--Step 1: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Papine Village') 		

					AND "z"."ImageFileLocation" IS NOT NULL		
		
Group BY
		"b"."ProjectName",
			"c"."Context",
			"i"."ArtifactID",
			"i"."Quantity",
			"j"."ButtonType",
			"Ware",
			"CeramicGenre",
			"ArtifactType",
			a."ProjectID",
			a."Published"


UNION ALL

--Ceramics--
			SELECT
			a."ProjectID",
			a."Published",
				"b"."ProjectName" AS "ProjectName",
				"c"."Context" AS "Context",
				"i"."ArtifactID" AS "ArtifactID",
				"i"."Quantity" AS "Quantity",
				"k"."CeramicForm" AS "Form",
				"m"."Ware" AS "Ware",
				"q"."CeramicGenre" AS "CeramicGenre",
				string_agg(z."ImageFileLocation", ';') AS "Images",
				'Ceramic' AS "ArtifactType"

			FROM
				"public"."tblProject" AS "a"
			LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
			INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
			INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
			INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
			INNER JOIN "public"."tblCeramic" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
			LEFT JOIN "public"."tblCeramicForm" AS "k" ON "i"."CeramicFormID" = "k"."CeramicFormID"
			LEFT JOIN "public"."tblCeramicWare" AS "m" ON "i"."WareID" = "m"."WareID"
			LEFT JOIN "public"."tblCeramicGenre" AS "q" ON "i"."CeramicGenreID" = "q"."CeramicGenreID"
			LEFT JOIN "public"."tblArtifactImage" AS "y" ON "i"."ArtifactID" = "y"."ArtifactID"
			LEFT JOIN "public"."tblImage" AS "z" ON "y"."ImageID" = "z"."ImageID"

WHERE
					--Step 1: Site Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Papine Village') 				

					AND "z"."ImageFileLocation" IS NOT NULL		
		

GROUP BY
				"b"."ProjectName",
				"c"."Context",
				"i"."ArtifactID",
				"i"."Quantity",
				"k"."CeramicForm",
				"m"."Ware",
				"q"."CeramicGenre",
				"ArtifactType",
				a."ProjectID",
				a."Published"

			UNION ALL

				--Faunal--
				SELECT
				a."ProjectID",
				a."Published",
					"b"."ProjectName" AS "ProjectName",
					"c"."Context" AS "Context",
					"i"."ArtifactID" AS "ArtifactID",
					"i"."Quantity" AS "Quantity",
					"j"."English" AS "Form",
					'' AS "Ware",
					'' AS "CeramicGenre",
					string_agg(z."ImageFileLocation", ';') AS "Images",
					'Faunal' AS "ArtifactType"

				FROM
					"public"."tblProject" AS "a"
				LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
				INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
				INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
				INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
				INNER JOIN "public"."tblBone" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
				LEFT JOIN "public"."tblBoneTaxon" AS "j" ON "i"."TaxonID" = "j"."TaxonID"
				LEFT JOIN "public"."tblArtifactImage" AS "y" ON "i"."ArtifactID" = "y"."ArtifactID"
				LEFT JOIN "public"."tblImage" AS "z" ON "y"."ImageID" = "z"."ImageID"

WHERE
					--Step 1: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Papine Village') 			


					AND "z"."ImageFileLocation" IS NOT NULL			
		
Group BY

					"b"."ProjectName",
					"c"."Context",
					"i"."ArtifactID",
					"i"."Quantity",
					"j"."English",
					"Ware",
					"CeramicGenre",
					"ArtifactType",
					a."ProjectID",
					a."Published"

UNION ALL

--General Artifacts--
					SELECT
					a."ProjectID",
					a."Published",
						"b"."ProjectName" AS "ProjectName",
						"c"."Context" AS "Context",
						"i"."ArtifactID" AS "ArtifactID",
						"i"."Quantity" AS "Quantity",
						"j"."GenArtifactForm" AS "Form",
						'' AS "Ware",
						'' AS "CeramicGenre",
string_agg(z."ImageFileLocation", ';') AS "Images",
						'General Artifacts' AS "ArtifactType"
					FROM
						"public"."tblProject" AS "a"
					LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
					INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
					INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
					INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
					INNER JOIN "public"."tblGenArtifact" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
					LEFT JOIN "public"."tblGenArtifactForm" AS "j" ON "i"."GenArtifactFormID" = "j"."GenArtifactFormID"
					LEFT JOIN "public"."tblArtifactImage" AS "y" ON "i"."ArtifactID" = "y"."ArtifactID"
					LEFT JOIN "public"."tblImage" AS "z" ON "y"."ImageID" = "z"."ImageID"

WHERE
					--Step 1: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Papine Village') 				
		
					AND "z"."ImageFileLocation" IS NOT NULL	

GROUP BY
						"b"."ProjectName",
						"c"."Context",
						"i"."ArtifactID",
						"i"."Quantity",
						"Ware",
						"Form",
						"CeramicGenre",
						"ArtifactType",
						a."ProjectID",
						a."Published"


UNION ALL

--Glass--
						SELECT
						a."ProjectID",
						a."Published",
							"b"."ProjectName" AS "ProjectName",
							"c"."Context" AS "Context",
							"i"."ArtifactID" AS "ArtifactID",
							"i"."Quantity" AS "Quantity",
							"j"."GlassForm" AS "Form",
							'' AS "Ware",
							'' AS "CeramicGenre",
							string_agg(z."ImageFileLocation", ';') AS "Images",
							'Glass' AS "ArtifactType"
						FROM
							"public"."tblProject" AS "a"
						LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
						INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
						INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
						INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
						INNER JOIN "public"."tblGlass" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
						LEFT JOIN "public"."tblGlassForm" AS "j" ON "i"."GlassFormID" = "j"."GlassFormID"
						LEFT JOIN "public"."tblArtifactImage" AS "y" ON "i"."ArtifactID" = "y"."ArtifactID"
						LEFT JOIN "public"."tblImage" AS "z" ON "y"."ImageID" = "z"."ImageID"	

WHERE
					--Step 1: Site Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Papine Village') 				
		
					AND "z"."ImageFileLocation" IS NOT NULL	

Group BY
							"b"."ProjectName",
							"c"."Context",
							"i"."ArtifactID",
							"i"."Quantity",
							"j"."GlassForm",
							"Ware",
							"CeramicGenre",
							"ArtifactType",
							a."ProjectID",
							a."Published"



UNION ALL
							
--Tobacco Pipes--
							SELECT
							a."ProjectID",
							a."Published",
								"b"."ProjectName" AS "ProjectName",
								"c"."Context" AS "Context",
								"i"."ArtifactID" AS "ArtifactID",
								"i"."Quantity" AS "Quantity",
								'Tobacco Pipe: ' || "j"."TobaccoPipeCompleteness" AS "Form",
								'' AS "Ware",
								'' AS "CeramicGenre",
								string_agg(z."ImageFileLocation", ';') AS "Images",
								'Tobacco Pipe' AS "ArtifactType"

							FROM
								"public"."tblProject" AS "a"
							LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
							INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
							INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
							INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
							INNER JOIN "public"."tblTobaccoPipe" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
							LEFT JOIN "public"."tblTobaccoPipeCompleteness" AS "j" ON "i"."TobaccoPipeCompletenessID" = "j"."TobaccoPipeCompletenessID"
										LEFT JOIN "public"."tblArtifactImage" AS "y" ON "i"."ArtifactID" = "y"."ArtifactID"
							LEFT JOIN "public"."tblImage" AS "z" ON "y"."ImageID" = "z"."ImageID"

WHERE
					--Step 1: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Papine Village') 				
		
					AND "z"."ImageFileLocation" IS NOT NULL	


Group BY
								"b"."ProjectName",
								"c"."Context",
								"i"."ArtifactID",
								"i"."Quantity",
								"j"."TobaccoPipeCompleteness" ,
								"Ware",
								"CeramicGenre",
								"ArtifactType",
								a."ProjectID",
								a."Published"


UNION ALL
							

	--Utensils--
								SELECT
								a."ProjectID",
								a."Published",
									"b"."ProjectName" AS "ProjectName",
									"c"."Context" AS "Context",
									"i"."ArtifactID" AS "ArtifactID",
									"i"."Quantity" AS "Quantity",
									'Utensil: ' || "j"."UtensilForm" AS "Form",
									'' AS "Ware",
									'' AS "CeramicGenre",
								string_agg(z."ImageFileLocation", ';') AS "Images",
									'Utensil' AS "ArtifactType"

								FROM
									"public"."tblProject" AS "a"
								LEFT JOIN "public"."tblProjectName" AS "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
								INNER JOIN "public"."tblContext" AS "c" ON "a"."ProjectID" = "c"."ProjectID"
								INNER JOIN "public"."tblContextSample" AS "g" ON "c"."ContextID" = "g"."ContextID"
								INNER JOIN "public"."tblGenerateContextArtifactID" AS "h" ON "g"."ContextSampleID" = "h"."ContextSampleID"
								INNER JOIN "public"."tblUtensil" AS "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
								LEFT JOIN "public"."tblUtensilForm" AS "j" ON "i"."UtensilFormID" = "j"."UtensilFormID"
								LEFT JOIN "public"."tblUtensilSpecific" AS "k" ON "i"."ArtifactID" = "k"."ArtifactID"
								LEFT JOIN "public"."tblArtifactImage" AS "y" ON "i"."ArtifactID" = "y"."ArtifactID"
								LEFT JOIN "public"."tblImage" AS "z" ON "y"."ImageID" = "z"."ImageID"


WHERE
					--Step 1: ite Selection: Select 1 or more sites 
						"b"."ProjectName" IN ('Papine Village') 	


					AND "z"."ImageFileLocation" IS NOT NULL	
			
		
GROUP BY
									"b"."ProjectName",
									"c"."Context",
									"i"."ArtifactID",
									"i"."Quantity",
									"j"."UtensilForm",
									"Ware",
									"CeramicGenre",
									"ArtifactType",
									a."ProjectID",
									a."Published"
									
ORDER BY
"ProjectName" ASC,
"ArtifactType"