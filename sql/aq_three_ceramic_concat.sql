--File Name: AQ3_Ceramics_ConcatenatedView_DRC_Done
--Created by: Beth Bollwerk
--Last Updated: 11 March 2015 by jeg
--Artifact Query 3 Ceramics: This file returns concatenated data for ceramics for the DRC Website and concatenated downloads.

--Step 1: Users select One or All ceramic Attributes.  The data always returned for this query are the following, in addition to any other ceramic Fields selected by User. 
create view aq_three_concat_ceramics as
SELECT
\"b\".\"ProjectName\" as \"ProjectName\",--always return this field
\"c\".\"ProjectID\" as \"ProjectID\",--always return this field
\"c\".\"Context\" as \"Context\",--always return this field
\"c\".\"QuadratID\" as \"QuadratID\",
\"d\".\"DepositType\" as \"DepositType\",
\"f\".\"FeatureType\" as \"FeatureType\",--always return this field
\"e\".\"FeatureNumber\" as \"FeatureNumber\",--always return this field
\"e\".\"FeatureGroup\" as \"FeatureGroup\",--always return this field
\"e\".\"FeatureGroupInterpretation\" as \"FeatureGroupInterpretation\",--always return this field
\"c\".\"DAACSStratigraphicGroup\" as \"StratigraphicGroup\",--always return this field
\"c\".\"DAACSPhase\" as \"DAACSPhase\",--always return this field
\"i\".\"ArtifactID\" as \"ArtifactID\",--always return this field
\"i\".\"Quantity\" as \"Count\",--always return this field
\"j\".\"CeramicMaterial\" as \"Material\",
\"k\".\"CeramicManuTech\" as \"ManufacturingTechnique\",
\"l\".\"Ware\" as \"Ware\",
\"t\".\"CeramicVesselCategory\" as \"VesselCategory\",
\"u\".\"CeramicForm\" as \"Form\",
\"xx\".\"YesNo\" as \"Mended?\",
\"v\".\"CeramicForm\" as \"MendedForm\",
\"w\".\"CeramicCompleteness\" as \"Completeness\",
\"x\".\"CeramicGlaze\" as \"ExteriorGlazeType\",
\"y\".\"AppliedColorWrittenDescription\" as \"ExteriorColor\",
\"yy\".\"CeramicGlazeOpacity\" as \"ExteriorGlazeOpacity\",
\"z\".\"CeramicGlaze\" as \"InteriorGlazeType\",
\"aa\".\"AppliedColorWrittenDescription\" as \"InteriorColor\",
\"zz\".\"CeramicGlazeOpacity\" as \"InteriorGlazeOpacity\",
--begin decoration section
\"ww\".\"YesNo\" as \"DecorationYN\",
\"s\".\"CeramicGenre\" as \"StylisticGenre\",
string_agg(distinct COALESCE(\"o\".\"InteriorExterior\")||', '||COALESCE(\"p\".\"CeramicDecTechLocation\")||', '||COALESCE(\"ah\".\"CeramicDecTechTypeID\")||', '||
COALESCE(\"r\".\"AppliedColorWrittenDescription\")||', '||COALESCE(\"q\".\"CeramicDecTechStyElem\")||', '||
COALESCE(\"pa\".\"CeramicDecTechMotif\"), '; ') as \"DecorativeTechnique/StylisticElements\",
\"nn\".\"PatternName\" as \"PatternName\",
\"nn\".\"PatternReferences\" AS \"PatternReference\",
--end Decoration section
\"cc\".\"EvidenceofBurning\" as \"Burned\",
\"dd\".\"YesNo\" as \"PostManufacturingModification\",
string_agg(distinct COALESCE(\"tt\".\"UseWearLocation\")||', '||COALESCE(\"sa\".\"CeramicCompleteness\")||', '||COALESCE(\"uu\".\"UseWearPattern\"), '; ') as \"Wear Location, Ceramic Completeness, Wear Pattern\",
\"oo\".\"BaseMark\" as \"BaseMark\",
\"pp\".\"BasicColor\" as \"BaseMarkColor\",
\"i\".\"BaseMarkReference\" as \"BaseMarkReference\",
--begin cew section
\"af\".\"AppliedColorWrittenDescription\" as \"PasteColor\",
\"bb\".\"OxidizedVersusReduced\" as \"OxidizedVsReduced\",
\"aaa\".\"CeramicCEWType\" as \"CoarseEarthenwareType\",
\"ab\".\"CeramicCEWDecMode\" as \"CoarseEarthenwareDecorativeMode\",
\"ii\".\"RimForm\" as \"ColonowareRimForm\",
\"jj\".\"RimAngle\" as \"ColonowareRimAngle\",
\"i\".\"MaxRimWidth\" as \"MaximumRimWidth\",
\"ac\".\"CeramicCEWBaseForm\" as \"CoarseEarthenwareBaseForm\",
\"ad\".\"CeramicCEWFootringForm\" as \"CoarseEarthenwareFootringForm\",
\"ae\". \"PasteInclusionDensity\" as \"CoarseEarthenwarePasteInclusionDensity\",
string_agg(distinct COALESCE(\"rr\".\"PasteInclusion\"), '; ') as \"PasteInclusions\",
string_agg(distinct COALESCE(\"ff\".\"CeramicCompleteness\")||', '||COALESCE((\"ee\".\"ColonoSherdThickness\")::text, ' '), '; ') as \"ColonoSherdCompletenessThickness\",
--end cew section
--begin measurements
\"i\".\"SherdThickness\" as \"SherdThickness\",
\"i\".\"MaximumSherdMeasurement\",
\"i\".\"SherdWeight\" as \"SherdWeight\",
\"i\".\"MendedSherdWeight\",
\"i\".\"RimLength\",
\"i\".\"RimDiameter\",
\"i\".\"MendedRimDiameter\",
\"i\".\"MaxRimWidth\",
\"i\".\"BaseLength\",
\"i\".\"BaseDiameter\",
\"i\".\"MendedBaseDiameter\",
--end measurements
\"i\".\"Notes\",
string_agg(COALESCE(\"mm\".\"ImageFileLocation\"),'; ') as \"Images\",
string_agg(COALESCE(\"ag\".\"MendsToArtifactID\"),'; ') as \"ArtifactsMendedTo\",
\"vv\".\"ObjectID\",
a.\"Published\"

FROM
\"public\".\"tblProject\" AS \"a\" 
left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
left join \"public\".\"tblContextDepositType\" AS \"d\"	on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\"
left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
inner join \"public\".\"tblCeramic\" AS \"i\" on \"h\".\"ArtifactID\" = \"i\".\"ArtifactID\"
left join \"public\".\"tblCeramicMaterial\" AS \"j\" on \"i\".\"CeramicMaterialID\" = \"j\".\"CeramicMaterialID\"
left join \"public\".\"tblCeramicManuTech\" AS \"k\" on	\"i\".\"CeramicManuTechID\" = \"k\".\"CeramicManuTechID\"
left join \"public\".\"tblCeramicWare\" AS \"l\" on	\"i\".\"WareID\" = \"l\".\"WareID\"
left join \"public\".\"tblCeramicDecTech\" AS \"m\" on  \"i\".\"GenerateContextArtifactID\" = \"m\".\"GenerateContextArtifactID\"
left join \"public\".\"tblCeramicDecTechInteriorExterior\" AS \"o\" on \"m\".\"InteriorExteriorID\" = \"o\".\"InteriorExteriorID\"
left join \"public\".\"tblCeramicDecTechLocation\" AS \"p\" on  \"m\".\"CeramicDecTechLocationID\" = \"p\".\"CeramicDecTechLocationID\"
left join \"public\".\"tblCeramicDecTechMotif\" AS \"pa\"	on \"m\".\"CeramicDecTechMotifID\" = \"pa\".\"CeramicDecTechMotifID\"
left join \"public\".\"tblCeramicDecTechStyElement\" AS \"q\" on \"m\".\"CeramicDecTechStyElemID\" = \"q\".\"CeramicDecTechStyElemID\"
left join \"public\".\"tblMunsellAppliedColor\" AS \"r\" on	\"m\".\"MunAppColorID\" = \"r\".\"MunAppColorID\"
left join \"public\".\"tblCeramicDecTechType\" AS \"ah\" on	\"m\".\"CeramicDecTechTypeID\" = \"ah\".\"CeramicDecTechTypeID\"
left join \"public\".\"tblCeramicGenre\" AS \"s\" on \"i\".\"CeramicGenreID\" = \"s\".\"CeramicGenreID\"
left join \"public\".\"tblCeramicVesselCategory\" AS \"t\" on	\"i\".\"CeramicVesselCategoryID\" = \"t\".\"CeramicVesselCategoryID\"
left join \"public\".\"tblCeramicForm\" AS \"u\" on	\"i\".\"CeramicFormID\" = \"u\".\"CeramicFormID\"	
left join \"public\".\"tblCeramicForm\" AS \"v\" on \"i\".\"MendedFormID\" = \"v\".\"CeramicFormID\"
left join \"public\".\"tblCeramicCompleteness\" AS \"w\" on \"i\".\"CeramicCompletenessID\" = \"w\".\"CeramicCompletenessID\"
left join \"public\".\"tblCeramicGlaze\" AS \"x\" on \"i\".\"ExteriorGlazeID\" = \"x\".\"CeramicGlazeID\"
left join \"public\".\"tblMunsellAppliedColor\" AS \"y\" on \"i\".\"ExteriorMunAppColorID\" = \"y\".\"MunAppColorID\"
left JOIN \"public\".\"tblCeramicGlazeOpacity\" AS \"yy\" on \"i\".\"ExteriorGlazeOpacityID\" = \"yy\".\"CeramicGlazeOpacityID\"
left join \"public\".\"tblCeramicGlaze\" AS \"z\" on \"i\".\"InteriorGlazeID\" = \"z\".\"CeramicGlazeID\"
left join \"public\".\"tblMunsellAppliedColor\" AS \"aa\" on \"i\".\"InteriorMunAppColorID\" = \"aa\".\"MunAppColorID\"
left JOIN \"public\".\"tblCeramicGlazeOpacity\" AS \"zz\" on \"i\".\"InteriorGlazeOpacityID\" = \"zz\".\"CeramicGlazeOpacityID\"
left join \"public\".\"tblCeramicOxidized\" AS \"bb\" on \"i\".\"OxidizedVersusReducedID\" = \"bb\".\"OxidizedVersusReducedID\"
left join \"public\".\"tblCeramicBurning\" AS \"cc\" on \"i\".\"EvidenceofBurningID\" = \"cc\".\"EvidenceofBurningID\"
left join \"public\".\"tblYesNo\" AS \"dd\" on \"i\".\"PMM\" = \"dd\".\"YesNoID\"
left join \"public\".\"tblCeramicColonoThickness\" AS \"ee\" on \"i\".\"ArtifactID\" = \"ee\".\"ArtifactID\"
left join \"public\".\"tblCeramicCompleteness\" AS \"ff\" on \"ee\".\"CeramicCompletenessID\" = \"ff\".\"CeramicCompletenessID\" 
left join \"public\".\"tblCeramicRimForm\" AS \"ii\" on \"i\".\"RimFormID\" = \"ii\".\"RimFormID\"
left join \"public\".\"tblCeramicRimAngle\" AS \"jj\" on \"i\".\"RimAngleID\" = \"jj\".\"RimAngleID\"
left join \"public\".\"tblCeramicPasteInclusionDensity\" AS \"kk\" on \"i\".\"PasteInclusionDensityID\" = \"kk\".\"PasteInclusionDensityID\"
left join \"public\".\"tblArtifactImage\" as \"ll\" on	\"i\".\"ArtifactID\" = \"ll\".\"ArtifactID\" 
left join \"public\".\"tblImage\" AS \"mm\" on \"ll\".\"ImageID\" = \"mm\".\"ImageID\"
left join \"public\".\"tblCeramicPatternName\" AS \"nn\" on \"i\".\"PatternNameID\" = \"nn\".\"PatternNameID\"
left join \"public\".\"tblYesNo\" AS \"ww\" on \"i\".\"DecorationYN\" = \"ww\".\"YesNoID\" 
left join \"public\".\"tblCeramicBaseMark\" as \"oo\" on \"i\".\"BaseMarkID\" = \"oo\".\"BaseMarkID\"
left join \"public\".\"tblBasicColor\" as \"pp\" on \"i\".\"BaseMarkBasicColorID\" = \"pp\".\"BasicColorID\"
left join \"public\".\"tblCeramicPasteInclusion\" as \"qq\" on \"i\".\"ArtifactID\" = \"qq\".\"ArtifactID\"
left join \"public\".\"tblPasteInclusion\" as \"rr\" on \"qq\".\"PasteInclusionID\" = \"rr\".\"PasteInclusionID\"
left join \"public\".\"tblCeramicUseWear\" as \"ss\" on \"i\".\"ArtifactID\" = \"ss\".\"ArtifactID\"
left join \"public\".\"tblCeramicCompleteness\" as \"sa\" on \"ss\".\"CeramicCompletenessID\" = \"sa\".\"CeramicCompletenessID\"
left join \"public\".\"tblCeramicUseWearLocation\" as \"tt\" on \"ss\".\"UseWearLocationID\" = \"tt\".\"UseWearLocationID\"
left join \"public\".\"tblCeramicUseWearPattern\" as \"uu\" on \"ss\".\"UseWearPatternID\" = \"uu\".\"UseWearPatternID\"
LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"vv\" on \"i\".\"GenerateContextArtifactID\" = \"vv\".\"GenerateContextArtifactID\" 
left join \"public\".\"tblYesNo\" AS \"xx\" on \"i\".\"Mended\" = \"xx\".\"YesNoID\" 
LEFT JOIN \"public\".\"tblCeramicCEWType\" AS \"aaa\" on \"i\".\"CeramicCEWTypeID\" = \"aaa\".\"CeramicCEWTypeID\"
LEFT JOIN \"public\".\"tblCeramicCEWDecMode\" AS \"ab\" ON \"i\".\"CeramicCEWDecModeID\" = \"ab\".\"CeramicCEWDecModeID\"
LEFT JOIN \"public\".\"tblCeramicCEWBaseForm\" AS \"ac\" ON \"i\".\"CeramicCEWBaseFormID\" = \"ac\".\"CeramicCEWBaseFormID\"
LEFT JOIN \"public\".\"tblCeramicCEWFootringForm\" AS \"ad\" on \"i\".\"CeramicCEWFootringFormID\"= \"ad\".\"CeramicCEWFootringFormID\"
LEFT JOIN \"public\".\"tblCeramicPasteInclusionDensity\" AS \"ae\" on \"i\".\"PasteInclusionDensityID\" = \"ae\".\"PasteInclusionDensityID\"
left join \"public\".\"tblMunsellAppliedColor\" AS \"af\" on \"i\".\"PasteSedimentColorID\" = \"af\".\"MunAppColorID\"
left join \"public\".\"tblCeramicMends\" AS \"ag\" on \"i\".\"GenerateContextArtifactID\" = \"ag\".\"GenerateContextArtifactID\"


GROUP BY
\"ProjectName\",
\"c\".\"ProjectID\",
\"Context\",
\"c\".\"QuadratID\",
\"DepositType\",
\"FeatureType\",
\"e\".\"FeatureNumber\",
\"FeatureGroupInterpretation\",
\"FeatureGroup\",
\"StratigraphicGroup\",
\"DAACSPhase\",
i.\"ArtifactID\",
\"Count\",
\"Material\",
\"ManufacturingTechnique\",
\"l\".\"Ware\",
\"VesselCategory\",
\"Form\",
\"MendedForm\",
\"xx\".\"YesNo\", --Mended?
\"ww\".\"YesNo\", --Decoration?
\"Completeness\",
\"x\".\"CeramicGlaze\", -- Exterior Glaze
\"y\".\"AppliedColorWrittenDescription\", -- Exterior color
\"yy\".\"CeramicGlazeOpacity\", --Exterior Glaze Opacity
\"z\".\"CeramicGlaze\", -- Interior Glaze
\"aa\".\"AppliedColorWrittenDescription\", -- Interior color
\"zz\".\"CeramicGlazeOpacity\", --InteriorGlazeOpacity
\"Burned\",
\"OxidizedVsReduced\",
\"dd\".\"YesNo\",  -- PPM
\"PatternName\",
\"nn\".\"PatternReferences\",
\"StylisticGenre\",
\"BaseMark\",
\"BaseMarkReference\",
\"BaseMarkColor\",
\"SherdThickness\",
\"MaximumSherdMeasurement\",
\"SherdWeight\",
\"i\".\"MendedSherdWeight\",
\"ColonowareRimForm\",
\"ColonowareRimAngle\",
\"i\".\"RimLength\",
\"i\".\"RimDiameter\",
\"i\".\"MendedRimDiameter\",
\"i\".\"MaxRimWidth\",
\"i\".\"Notes\",
\"af\".\"MunAppColorID\",--PasteColor
\"CoarseEarthenwareType\",
\"CoarseEarthenwareDecorativeMode\",
\"i\".\"MaxRimWidth\",
\"CoarseEarthenwareBaseForm\",
\"CoarseEarthenwareFootringForm\",
\"CoarseEarthenwarePasteInclusionDensity\",
\"vv\".\"ObjectID\",
\"i\".\"BaseLength\",
\"i\".\"BaseDiameter\",
\"i\".\"MendedBaseDiameter\",
a.\"Published\"


ORDER BY
\"b\".\"ProjectName\",
\"l\".\"Ware\",
\"u\".\"CeramicForm\",
\"s\".\"CeramicGenre\"

