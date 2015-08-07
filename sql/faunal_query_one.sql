create view faunal_query_one as SELECT
"public"."tblProjectName"."ProjectName" AS "ProjectName",
Sum("public"."tblBone"."Quantity") AS "Count",
"public"."tblBoneTaxon"."English" AS "TaxonEnglish",
"public"."tblBoneTaxon"."Latin" AS "TaxonLatin",
"public"."tblBoneTaxonCategory"."TaxonCategory" AS "TaxonCategory",
"tblProject"."ProjectID"
FROM
"public"."tblProject"
LEFT JOIN "public"."tblProjectName" ON "public"."tblProject"."ProjectNameID" = "public"."tblProjectName"."ProjectNameID"
LEFT JOIN "public"."tblContext" ON "public"."tblContext"."ProjectID" = "public"."tblProject"."ProjectID"
LEFT JOIN "public"."tblContextSample" ON "public"."tblContextSample"."ContextAutoID" = "public"."tblContext"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" ON "public"."tblContextSample"."ContextSampleID" = "public"."tblGenerateContextArtifactID"."ContextSampleID"
INNER JOIN "public"."tblBone" ON "public"."tblBone"."GenerateContextArtifactID" = "public"."tblGenerateContextArtifactID"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBoneTaxon" ON "public"."tblBone"."TaxonID" = "public"."tblBoneTaxon"."TaxonID"
LEFT JOIN "public"."tblBoneTaxonCategory" ON "public"."tblBoneTaxon"."TaxonCategoryID" = "public"."tblBoneTaxonCategory"."TaxonCategoryID"

GROUP BY
"public"."tblProject"."ProjectID",
"public"."tblProjectName"."ProjectName",
"public"."tblBoneTaxon"."Latin",
"public"."tblBoneTaxon"."English",
"public"."tblBoneTaxonCategory"."TaxonCategory"

ORDER BY
"ProjectName" ASC,
"TaxonEnglish" ASC
