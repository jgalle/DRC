create view aq_one_beads as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
Sum("f"."Quantity") AS "Total Count",
'Bead, '||"g"."BeadShape" AS "Artifact Type",
'Bead' AS "Artifact Category",
"a"."Published"


FROM
"public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
LEFT JOIN "public"."tblContext" as "c" ON "c"."ProjectID" = "a"."ProjectID"
LEFT JOIN "public"."tblContextSample" as "d" ON "d"."ContextAutoID" = "c"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" as "e" ON "d"."ContextSampleID" = "e"."ContextSampleID"
INNER JOIN "public"."tblBead" as "f" ON "f"."GenerateContextArtifactID" = "e"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBeadShape" as "g" ON "f"."BeadShapeID" = "g"."BeadShapeID"

Group BY
"b"."ProjectName",
"a"."ProjectID",
"Artifact Type"

ORDER BY
"ProjectName" ASC,
"Artifact Category" ASC,
"Artifact Type" ASC;

create view aq_one_buckles as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
Sum("f"."Quantity") AS "Total Count",
'Buckle, '||"g"."BuckleType" AS "Artifact Type",
'Buckle' AS "Artifact Category",
"a"."Published"

FROM
"public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
LEFT JOIN "public"."tblContext" as "c" ON "c"."ProjectID" = "a"."ProjectID"
LEFT JOIN "public"."tblContextSample" as "d" ON "d"."ContextAutoID" = "c"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" as "e" ON "d"."ContextSampleID" = "e"."ContextSampleID"
INNER JOIN "public"."tblBuckle" as "f" ON "f"."GenerateContextArtifactID" = "e"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBuckleType" as "g" ON "g"."BuckleTypeID" = "f"."BuckleTypeID"

Group BY
"b"."ProjectName",
"a"."ProjectID",
"Artifact Type"

ORDER BY
"ProjectName" ASC,
"Artifact Category" ASC,
"Artifact Type" ASC;

--Buttons--
create view aq_one_buttons as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
Sum("f"."Quantity") AS "Total Count",
'Button, '||"g"."ButtonType" AS "Artifact Type",
'Button' AS "Artifact Category",
"a"."Published"

FROM
"public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
LEFT JOIN "public"."tblContext" as "c" ON "c"."ProjectID" = "a"."ProjectID"
LEFT JOIN "public"."tblContextSample" as "d" ON "d"."ContextAutoID" = "c"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" as "e" ON "d"."ContextSampleID" = "e"."ContextSampleID"
INNER JOIN "public"."tblButton" as "f" ON "f"."GenerateContextArtifactID" = "e"."GenerateContextArtifactID"
LEFT JOIN "public"."tblButtonType" as "g" ON "f"."ButtonTypeID" = "g"."ButtonTypeID"

Group BY
"b"."ProjectName",
"a"."ProjectID",
"Artifact Type"

ORDER BY
"ProjectName" ASC,
"Artifact Category" ASC,
"Artifact Type" ASC;


--Ceramics--
create view aq_one_ceramics as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
Sum("f"."Quantity") AS "Total Count",
"g"."Ware" AS "Artifact Type",
'Ceramic' AS "Artifact Category",
"a"."Published"

FROM
"public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
LEFT JOIN "public"."tblContext" as "c" ON "c"."ProjectID" = "a"."ProjectID"
LEFT JOIN "public"."tblContextSample" as "d" ON "d"."ContextAutoID" = "c"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" as "e" ON "d"."ContextSampleID" = "e"."ContextSampleID"
INNER JOIN "public"."tblCeramic" as "f" ON "f"."GenerateContextArtifactID" = "e"."GenerateContextArtifactID"
LEFT JOIN "public"."tblCeramicWare" as "g" ON "f"."WareID" = "g"."WareID"

Group BY
"b"."ProjectName",
"a"."ProjectID",
"Artifact Type"

ORDER BY
"ProjectName" ASC,
"Artifact Category" ASC,
"Artifact Type" ASC;

--Faunal--
create view aq_one_bones as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
Sum("f"."Quantity") AS "Total Count",
"g"."English" AS "Artifact Type",
'Faunal' AS "Artifact Category",
"a"."Published"

FROM
"public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
LEFT JOIN "public"."tblContext" as "c" ON "c"."ProjectID" = "a"."ProjectID"
LEFT JOIN "public"."tblContextSample" as "d" ON "d"."ContextAutoID" = "c"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" as "e" ON "d"."ContextSampleID" = "e"."ContextSampleID"
INNER JOIN "public"."tblBone" as "f" ON "f"."GenerateContextArtifactID" = "e"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBoneTaxon" as "g" ON "f"."TaxonID" = "g"."TaxonID"

Group BY
"b"."ProjectName",
"a"."ProjectID",
"Artifact Type"

ORDER BY
"ProjectName" ASC,
"Artifact Category" ASC,
"Artifact Type" ASC;

--General Artifacts--
create view aq_one_gen_atifacts as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
Sum("f"."Quantity") AS "Total Count",
"g"."GenArtifactForm" AS "Artifact Type",
'General Artifacts' AS "Artifact Category",
"a"."Published"

FROM
"public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
LEFT JOIN "public"."tblContext" as "c" ON "c"."ProjectID" = "a"."ProjectID"
LEFT JOIN "public"."tblContextSample" as "d" ON "d"."ContextAutoID" = "c"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" as "e" ON "d"."ContextSampleID" = "e"."ContextSampleID"
INNER JOIN "public"."tblGenArtifact" as "f" ON "f"."GenerateContextArtifactID" = "e"."GenerateContextArtifactID"
LEFT JOIN "public"."tblGenArtifactForm" as "g" ON "f"."GenArtifactFormID" = "g"."GenArtifactFormID"

Group BY
"b"."ProjectName",
"a"."ProjectID",
"Artifact Type"

ORDER BY
"ProjectName" ASC,
"Artifact Category" ASC,
"Artifact Type" ASC;

--Glass--
create view aq_one_glasses as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
Sum("f"."Quantity") AS "Total Count",
"g"."GlassForm" AS "Artifact Type",
'Glass' AS "Artifact Category",
"a"."Published"

FROM
"public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
LEFT JOIN "public"."tblContext" as "c" ON "c"."ProjectID" = "a"."ProjectID"
LEFT JOIN "public"."tblContextSample" as "d" ON "d"."ContextAutoID" = "c"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" as "e" ON "d"."ContextSampleID" = "e"."ContextSampleID"
INNER JOIN "public"."tblGlass" as "f" ON "f"."GenerateContextArtifactID" = "e"."GenerateContextArtifactID"
LEFT JOIN "public"."tblGlassForm" as "g"  ON "f"."GlassFormID" = "g"."GlassFormID"

Group BY
"b"."ProjectName",
"a"."ProjectID",
"Artifact Type"

ORDER BY
"ProjectName" ASC,
"Artifact Category" ASC,
"Artifact Type" ASC;

--Tobacco Pipes--
create view aq_one_tobacco_pipes as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
Sum("f"."Quantity") AS "Total Count",
'Tobacco Pipe, '||"g"."TobaccoPipeCompleteness" AS "Artifact Type",
'Tobacco Pipe' AS "Artifact Category",
"a"."Published"

FROM
"public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
LEFT JOIN "public"."tblContext" as "c" ON "c"."ProjectID" = "a"."ProjectID"
LEFT JOIN "public"."tblContextSample" as "d" ON "d"."ContextAutoID" = "c"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" as "e" ON "d"."ContextSampleID" = "e"."ContextSampleID"
INNER JOIN "public"."tblTobaccoPipe" as "f" ON "f"."GenerateContextArtifactID" = "e"."GenerateContextArtifactID"
LEFT JOIN "public"."tblTobaccoPipeCompleteness" as "g" ON "f"."TobaccoPipeCompletenessID" = "g"."TobaccoPipeCompletenessID"

Group BY
"b"."ProjectName",
"a"."ProjectID",
"Artifact Type"

ORDER BY
"ProjectName" ASC,
"Artifact Category" ASC,
"Artifact Type" ASC;

--Utensils--
create view aq_one_utensils as
SELECT
"b"."ProjectName" AS "ProjectName",
"a"."ProjectID" AS "ProjectID",
Sum("f"."Quantity") AS "Total Count",
'Utensil, '||"g"."UtensilForm" AS "Artifact Type",
'Utensil' AS "Artifact Category",
"a"."Published"

FROM
"public"."tblProject" as "a"
LEFT JOIN "public"."tblProjectName" as "b" ON "a"."ProjectNameID" = "b"."ProjectNameID"
LEFT JOIN "public"."tblContext" as "c" ON "c"."ProjectID" = "a"."ProjectID"
LEFT JOIN "public"."tblContextSample" as "d" ON "d"."ContextAutoID" = "c"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" as "e" ON "d"."ContextSampleID" = "e"."ContextSampleID"
INNER JOIN "public"."tblUtensil" as "f" ON "f"."GenerateContextArtifactID" = "e"."GenerateContextArtifactID"
LEFT JOIN "public"."tblUtensilForm" as "g" ON "f"."UtensilFormID" = "g"."UtensilFormID"

Group BY
"b"."ProjectName",
"a"."ProjectID",
"Artifact Type"

ORDER BY
"ProjectName" ASC,
"Artifact Category" ASC,
"Artifact Type" ASC;
