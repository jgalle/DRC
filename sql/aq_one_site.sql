create view aq_one_site_beads as
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
