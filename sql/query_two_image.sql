--File Name: 	IQ2_DRC_Done
--Created by: Jillian Galle
--Last Updated: 9 April 2015 by jeg
--For DRC Website

--Query Description: Query Returns images for selected sites subsetted by either Image Type, Image SubType, or Image Form.
create view query_two_images as
SELECT
string_agg(distinct COALESCE("p"."ProjectID"), '; ') as "ProjectID",
string_agg(distinct COALESCE("c"."ProjectName"), '; ') as "ProjectName",
"a"."ImageID",
"d"."ImageType",
"e"."ImageSubtype",
"f"."ImageMaterial" as "ImageMaterial",
"g"."ImageForm" as "ArtifactForm",
"a"."ImageDescription",
"a"."CatalogueNumber",
"a"."DocumentID",
"h"."ImageFileFormat",
"a"."ImageCitation",
"a"."photo_file_name",
"a"."ImageFileLocation",
p."Published"


FROM	
		"public"."tblImage" as "a"
	left join "images_projects" as "ip" on "ip"."image_id" = "a"."ImageID"
	left join  "tblProject" as "p" on "ip"."project_id" = "p"."ProjectID"
	 LEFT JOIN "public"."tblProjectName" AS "c" ON p."ProjectNameID" = "c"."ProjectNameID"
	 LEFT JOIN "public"."tblImageType" as "d"	on "a"."ImageTypeID" = "d"."ImageTypeID"
	 LEFT JOIN "public"."tblImageSubtype" as "e" on "a"."ImageSubtypeID" = "e"."ImageSubtypeID"
	 LEFT JOIN "public"."tblImageMaterial" as "f" on "a"."ImageMaterialID" = "f"."ImageMaterialID"
	 LEFT JOIN "public"."tblImageForm" as "g" on "a"."ImageFormID" = "g"."ImageFormID"
	 LEFT JOIN "public"."tblImageFileFormat" as "h" on "a"."ImageFileFormatID" = "h"."ImageFileFormatID"

-- WHERE
--
-- --Step 1: Choose one or more from ONE Of the Follow Subset Groups: Image Type, Image Subtype, or Image Form. Example
-- --is for Image Form  below.
--
-- -- "d"."ImageType" IN ('Artifact', 'Field')--Chose one or more or all Image Types
-- -- OR
-- -- "e"."ImageSubtype" IN (' ') --Chose one or more or all Image Subtypes
-- --OR
-- "g"."ImageForm" IN ('Lock, plate') --Chose one or more or all Image Forms
--
-- --Step 2
-- AND
-- "c"."ProjectName" IN ('Stewart Castle Village', 'East Cabin') --Chose one or more or ALL projects

GROUP BY
"a"."ImageID",
"d"."ImageType",
"e"."ImageSubtype",
"f"."ImageMaterial",
"g"."ImageForm",
"a"."ImageDescription",
"a"."CatalogueNumber",
"a"."DocumentID",
"h"."ImageFileFormat",
"a"."ImageCitation",
"a"."photo_file_name",
"a"."ImageFileLocation",
p."Published"

Order BY
"ProjectName",
"e"."ImageSubtype",
"g"."ImageForm"