--File Name: SiteQuery__DRC_Done
--Created by: Jillian Galle
--Last Updated: 5 April 2015 by JEG
--Site Query: Returns all data from "tblProject" for the DRC website.  Select site or sites.
create view query_sites as
SELECT
						
						"a"."ProjectID",
						"aa"."ProjectName",
						"b"."Institution",
						"c"."PlaceName",
						"d"."Region",
						"e"."County",
					--	"l"."ProjectState" as "State",
						"n"."ProjectCountry" as "Country",	
						"m"."PlantationName",
						"a"."BeginDate",
						"a"."PrincipalInvestigators",
						"a"."EndDate",
						"a"."OccupationRange",
						"a"."StateSiteNumber",
						"g"."UnitofMeasurement",
						"h"."GeoDatum",
						"i"."GeoCoordinateSystem",
						"a"."NorthingGeoCoordinateofLocalDatum",
						"a"."EastingGeoCoordinateofLocalDatum",
						"a"."VerticalGeoCoordinateofLocalDatum",
						"j"."Drainage",
						"a"."SiteSoils",
						"a"."NearestWaterSource",
						"a"."DistancefromWaterSource",
						"k"."ElevationType",
						"a"."AzimuthOrientation",
						"a"."TotalAreaExcavated",
						"a"."TotalConvexHull",
						"a"."DatesExcavated",
						"a"."ArtifactRepository",
						"a"."SiteAbstract",
						a."Published"

				from "public"."tblProject" as "a"				
					left join "public"."tblProjectName" as "aa" on "a"."ProjectNameID" = "aa"."ProjectNameID"
					left join "public"."tblProjectInstitution" as "b"	on "a"."InstitutionID" = "b"."InstitutionID"		
					left join "public"."tblProjectPlaceName" as "c" on "a"."PlaceNameID" = "c"."PlaceNameID"
					left join "public"."tblProjectRegion" as "d" on "a"."RegionID" = "d"."RegionID"
					left join "public"."tblProjectCounty" as "e" on "a"."CountyID" = "e"."CountyID"
					left join "public"."tblProjectPlaceName" as "f" on "a"."PlaceNameID" = "f"."PlaceNameID"
					left join "public"."tblProjectUnitofMeasure" as "g" on "a"."UnitofMeasureID" = "g"."UnitofMeasureID"
					left join "public"."tblProjectGeoDatum" as "h" on "a"."GeoDatumID" = "h"."GeoDatumID"
					left join "public"."tblProjectGeoCoordinateSystem" as "i" on "a"."GeoCoordinateSystemID" = "i"."GeoCoordinateSystemID"
					left join "public"."tblProjectDrainage" as "j"on "a"."DrainageID" = "j"."DrainageID"
					left join "public"."tblProjectElevationType" as "k" on "a"."ElevationTypeID" = "k"."ElevationTypeID"
					--left join "public"."tblProjectState" as "l" on "a"."ProjectStateID" = "l"."ProjectStateID"	
					left join "public"."tblPlantation" as "m" on "a"."PlantationID" = "m"."PlantationID"			
					left join "public"."tblProjectCountry" as "n" on "a"."ProjectCountryID" = "n"."ProjectCountryID"
				

				Order by "aa"."ProjectName"
				
				