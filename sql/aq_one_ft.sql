--File Name: AQ1_FeatureType_DAACS_Done
--Created by: Jillian Galle
--Last Updated: 20 Feb 2015 by jeg

--Beads--
create view aq_one_ft_beads as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"e"."FeatureNumber" AS "FeatureNumber",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureGroup" AS "FeatureGroup",
"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
Sum("i"."Quantity") AS "TotalCount",
'Bead, '||"j"."BeadShape" AS "ArtifactType",
'Bead' AS "ArtifactCategory",
"a"."Published"

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


Group BY
"b"."ProjectName",
"a"."ProjectID",
"e"."FeatureNumber",
"f"."FeatureType",
"e"."FeatureGroup",
"e"."FeatureGroupInterpretation",
"ArtifactType",
"ArtifactCategory"

ORDER BY
"ProjectName" ASC,
"FeatureNumber" ASC,
"ArtifactCategory" ASC,
"ArtifactType" ASC;

--Buckles--
create view aq_one_ft_buckles as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"e"."FeatureNumber" AS "FeatureNumber",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureGroup" AS "FeatureGroup",
"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
Sum("i"."Quantity") AS "TotalCount",
'Buckle, '||"j"."BuckleType" AS "ArtifactType",
'Buckle' AS "ArtifactCategory",
"a"."Published"

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

Group BY

"b"."ProjectName",
"a"."ProjectID",
"e"."FeatureNumber",
"f"."FeatureType",
"e"."FeatureGroup",
"e"."FeatureGroupInterpretation",
"ArtifactType",
"ArtifactCategory"

ORDER BY
"ProjectName" ASC,
"FeatureNumber" ASC,
"ArtifactCategory" ASC,
"ArtifactType" ASC;
--Buttons--
create view aq_one_ft_buttons as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"e"."FeatureNumber" AS "FeatureNumber",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureGroup" AS "FeatureGroup",
"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
Sum("i"."Quantity") AS "TotalCount",
'Button, '||"j"."ButtonType" AS "ArtifactType",
'Button' AS "ArtifactCategory",
"a"."Published"


FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblButton" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblButtonType"as "j" ON "i"."ButtonTypeID" = "j"."ButtonTypeID"


Group BY

"b"."ProjectName",
"a"."ProjectID",
"e"."FeatureNumber",
"f"."FeatureType",
"e"."FeatureGroup",
"e"."FeatureGroupInterpretation",
"ArtifactType",
"ArtifactCategory"


ORDER BY
"ProjectName" ASC,
"FeatureNumber" ASC,
"ArtifactCategory" ASC,
"ArtifactType" ASC;
--Ceramics--
create view aq_one_ft_ceramics as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"e"."FeatureNumber" AS "FeatureNumber",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureGroup" AS "FeatureGroup",
"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
Sum("i"."Quantity") AS "TotalCount",
"m"."Ware" AS "ArtifactType",
'Ceramic' AS "ArtifactCategory",
"a"."Published"

FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblCeramic" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblCeramicWare" as "m" ON "i"."WareID" = "m"."WareID"


Group BY

"b"."ProjectName",
"a"."ProjectID",
"e"."FeatureNumber",
"f"."FeatureType",
"e"."FeatureGroup",
"e"."FeatureGroupInterpretation",
"ArtifactType",
"ArtifactCategory"
ORDER BY
"ProjectName" ASC,
"FeatureNumber" ASC,
"ArtifactCategory" ASC,
"ArtifactType" ASC;
--Faunal--
create view aq_one_ft_bones as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"e"."FeatureNumber" AS "FeatureNumber",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureGroup" AS "FeatureGroup",
"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
Sum("i"."Quantity") AS "TotalCount",
"j"."English" AS "ArtifactType",
'Faunal' AS "ArtifactCategory",
"a"."Published"


FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblBone" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBoneTaxon" as "j" ON "i"."TaxonID" = "j"."TaxonID"



Group BY

"b"."ProjectName",
"a"."ProjectID",
"e"."FeatureNumber",
"f"."FeatureType",
"e"."FeatureGroup",
"e"."FeatureGroupInterpretation",
"ArtifactType",
"ArtifactCategory"

ORDER BY
"ProjectName" ASC,
"FeatureNumber" ASC,
"ArtifactCategory" ASC,
"ArtifactType" ASC;
--General Artifacts--
create view aq_one_ft_gen_artifacts as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"e"."FeatureNumber" AS "FeatureNumber",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureGroup" AS "FeatureGroup",
"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
Sum("i"."Quantity") AS "TotalCount",
"j"."GenArtifactForm" AS "ArtifactType",
'General Artifacts' AS "ArtifactCategory",
"a"."Published"


FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblGenArtifact" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblGenArtifactForm" as "j" ON "i"."GenArtifactFormID" = "j"."GenArtifactFormID"

Group BY

"b"."ProjectName",
"a"."ProjectID",
"e"."FeatureNumber",
"f"."FeatureType",
"e"."FeatureGroup",
"e"."FeatureGroupInterpretation",
"ArtifactType",
"ArtifactCategory"

ORDER BY
"ProjectName" ASC,
"FeatureNumber" ASC,
"ArtifactCategory" ASC,
"ArtifactType" ASC;

--Glass--
create view aq_one_ft_glasses as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"e"."FeatureNumber" AS "FeatureNumber",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureGroup" AS "FeatureGroup",
"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
Sum("i"."Quantity") AS "TotalCount",
"j"."GlassForm" AS "ArtifactType",
'Glass' AS "ArtifactCategory",
"a"."Published"


FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblGlass" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblGlassForm" as "j" ON "i"."GlassFormID" = "j"."GlassFormID"


Group BY

"b"."ProjectName",
"a"."ProjectID",
"e"."FeatureNumber",
"f"."FeatureType",
"e"."FeatureGroup",
"e"."FeatureGroupInterpretation",
"ArtifactType",
"ArtifactCategory"

ORDER BY
"ProjectName" ASC,
"FeatureNumber" ASC,
"ArtifactCategory" ASC,
"ArtifactType" ASC;
--Tobacco Pipes--
create view aq_one_ft_tobacco_pipes as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"e"."FeatureNumber" AS "FeatureNumber",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureGroup" AS "FeatureGroup",
"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
Sum("i"."Quantity") AS "TotalCount",
'Tobacco Pipe, '||"j"."TobaccoPipeCompleteness" AS "ArtifactType",
'Tobacco Pipe' AS "ArtifactCategory",
"a"."Published"


FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblTobaccoPipe" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblTobaccoPipeCompleteness" as "j" ON "i"."TobaccoPipeCompletenessID" = "j"."TobaccoPipeCompletenessID"

Group BY

"b"."ProjectName",
"a"."ProjectID",
"e"."FeatureNumber",
"f"."FeatureType",
"e"."FeatureGroup",
"e"."FeatureGroupInterpretation",
"ArtifactType",
"ArtifactCategory"
ORDER BY
"ProjectName" ASC,
"FeatureNumber" ASC,
"ArtifactCategory" ASC,
"ArtifactType" ASC;


--Utensils--
create view aq_one_ft_utensils as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
"e"."FeatureNumber" AS "FeatureNumber",
"f"."FeatureType" AS "FeatureType",
"e"."FeatureGroup" AS "FeatureGroup",
"e"."FeatureGroupInterpretation" AS "FeatureGroupInterpretation",
Sum("i"."Quantity") AS "TotalCount",
'Utensil, '||"j"."UtensilForm" AS "ArtifactType",
'Utensil' AS "ArtifactCategory",
"a"."Published"


FROM
"public"."tblProject" AS "a" 
left join "public"."tblProjectName" AS "b" on "a"."ProjectNameID" = "b"."ProjectNameID"
inner join "public"."tblContext" AS "c" on "a"."ProjectID" = "c"."ProjectID"	
left join "public"."tblContextFeature" AS	"e"	on "c"."ProjectID" = "e"."ProjectID" and "c"."FeatureNumber"="e"."FeatureNumber"
left join "public"."tblContextFeatureType" AS	"f"	on "e"."FeatureTypeID" = "f"."FeatureTypeID"
inner join "public"."tblContextSample" AS "g" on "c"."ContextID" = "g"."ContextID"
inner join "public"."tblGenerateContextArtifactID" AS "h" on "g"."ContextSampleID" = "h"."ContextSampleID"
INNER JOIN "public"."tblUtensil" as "i" ON "i"."GenerateContextArtifactID" = "h"."GenerateContextArtifactID"
LEFT JOIN "public"."tblUtensilForm" as "j" ON "i"."UtensilFormID" = "j"."UtensilFormID"


Group BY

"b"."ProjectName",
"a"."ProjectID",
"e"."FeatureNumber",
"f"."FeatureType",
"e"."FeatureGroup",
"e"."FeatureGroupInterpretation",
"ArtifactType",
"ArtifactCategory"

ORDER BY
"ProjectName" ASC,
"FeatureNumber" ASC,
"ArtifactCategory" ASC,
"ArtifactType" ASC;

