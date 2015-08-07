module Queries
  def aq_one_context(query)
    "--File Name: AQ1_Context_DAACS_Done
    --Created by: Jillian Galle
    --Last Updated: 20 Feb 2015 by jeg

    --Beads--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"Context\" AS \"Context\",
    \"cc\".\"DepositType\" as \"DepositType\",
    \"d\".\"UnitType\" AS \"UnitType\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Bead, '||\"j\".\"BeadShape\" AS \"ArtifactType\",
    'Bead' AS \"ArtifactCategory\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextDepositType\" AS \"cc\"	on \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBeadShape\" as \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"

    #{query}

    Group BY
    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"Context\",
    \"cc\".\"DepositType\",
    \"d\".\"UnitType\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL

    --Buckles--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"Context\" AS \"Context\",
    \"cc\".\"DepositType\" as \"DepositType\",
    \"d\".\"UnitType\" AS \"UnitType\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Buckle, '||\"j\".\"BuckleType\" AS \"ArtifactType\",
    'Buckle' AS \"ArtifactCategory\"

    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    left join \"public\".\"tblContextDepositType\" AS \"cc\"  on \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    left join \"public\".\"tblContextUnitType\" AS \"d\"  on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS  \"e\"  on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS  \"f\"  on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBuckle\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBuckleType\" as \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"

    #{query}

    Group BY
    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"Context\",
    \"cc\".\"DepositType\",
    \"d\".\"UnitType\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL
    --Buttons--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"Context\" AS \"Context\",
    \"cc\".\"DepositType\" as \"DepositType\",
    \"d\".\"UnitType\" AS \"UnitType\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Button, '||\"j\".\"ButtonType\" AS \"ArtifactType\",
    'Button' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    left join \"public\".\"tblContextDepositType\" AS \"cc\"  on \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    left join \"public\".\"tblContextUnitType\" AS \"d\"  on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS  \"e\"  on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS  \"f\"  on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblButton\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblButtonType\"as \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"

    #{query}

    Group BY
    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"Context\",
    \"cc\".\"DepositType\",
    \"d\".\"UnitType\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"


    UNION ALL
    --Ceramics--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"Context\" AS \"Context\",
    \"cc\".\"DepositType\" as \"DepositType\",
    \"d\".\"UnitType\" AS \"UnitType\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    \"m\".\"Ware\" AS \"ArtifactType\",
    'Ceramic' AS \"ArtifactCategory\"

    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    left join \"public\".\"tblContextDepositType\" AS \"cc\"  on \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    left join \"public\".\"tblContextUnitType\" AS \"d\"  on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS  \"e\"  on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS  \"f\"  on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblCeramic\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblCeramicWare\" as \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"

    #{query}

    Group BY
    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"Context\",
    \"cc\".\"DepositType\",
    \"d\".\"UnitType\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL
    --Faunal--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"Context\" AS \"Context\",
    \"cc\".\"DepositType\" as \"DepositType\",
    \"d\".\"UnitType\" AS \"UnitType\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    \"j\".\"English\" AS \"ArtifactType\",
    'Faunal' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    left join \"public\".\"tblContextDepositType\" AS \"cc\"  on \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    left join \"public\".\"tblContextUnitType\" AS \"d\"  on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS  \"e\"  on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS  \"f\"  on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBone\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBoneTaxon\" as \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"


    #{query}

    Group BY
    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"Context\",
    \"cc\".\"DepositType\",
    \"d\".\"UnitType\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL
    --General Artifacts--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"Context\" AS \"Context\",
    \"cc\".\"DepositType\" as \"DepositType\",
    \"d\".\"UnitType\" AS \"UnitType\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    \"j\".\"GenArtifactForm\" AS \"ArtifactType\",
    'General Artifacts' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    left join \"public\".\"tblContextDepositType\" AS \"cc\"  on \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    left join \"public\".\"tblContextUnitType\" AS \"d\"  on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS  \"e\"  on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS  \"f\"  on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGenArtifact\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGenArtifactForm\" as \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"

    #{query}

    Group BY
    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"Context\",
    \"cc\".\"DepositType\",
    \"d\".\"UnitType\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL

    --Glass--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"Context\" AS \"Context\",
    \"cc\".\"DepositType\" as \"DepositType\",
    \"d\".\"UnitType\" AS \"UnitType\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    \"j\".\"GlassForm\" AS \"ArtifactType\",
    'Glass' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    left join \"public\".\"tblContextDepositType\" AS \"cc\"  on \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    left join \"public\".\"tblContextUnitType\" AS \"d\"  on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS  \"e\"  on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS  \"f\"  on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGlass\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGlassForm\" as \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"


    #{query}

    Group BY
    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"Context\",
    \"cc\".\"DepositType\",
    \"d\".\"UnitType\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL
    --Tobacco Pipes--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"Context\" AS \"Context\",
    \"cc\".\"DepositType\" as \"DepositType\",
    \"d\".\"UnitType\" AS \"UnitType\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Tobacco Pipe, '||\"j\".\"TobaccoPipeCompleteness\" AS \"ArtifactType\",
    'Tobacco Pipe' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    left join \"public\".\"tblContextDepositType\" AS \"cc\"  on \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    left join \"public\".\"tblContextUnitType\" AS \"d\"  on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS  \"e\"  on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS  \"f\"  on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblTobaccoPipe\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" as \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"

    #{query}

    Group BY
    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"Context\",
    \"cc\".\"DepositType\",
    \"d\".\"UnitType\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL


    --Utensils--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"Context\" AS \"Context\",
    \"cc\".\"DepositType\" as \"DepositType\",
    \"d\".\"UnitType\" AS \"UnitType\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Utensil, '||\"j\".\"UtensilForm\" AS \"ArtifactType\",
    'Utensil' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    left join \"public\".\"tblContextDepositType\" AS \"cc\"  on \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    left join \"public\".\"tblContextUnitType\" AS \"d\"  on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS  \"e\"  on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS  \"f\"  on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblUtensil\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblUtensilForm\" as \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"


    #{query}

    Group BY
    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"Context\",
    \"cc\".\"DepositType\",
    \"d\".\"UnitType\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    ORDER BY
    \"ProjectName\" ASC,
    \"Context\" ASC,
    \"ArtifactCategory\" ASC,
    \"ArtifactType\" ASC

    "
  end
  def aq_one_feature_number(query)
    "--File Name: AQ1_FeatureNumber_DAACS_Done
    --Created by: Jillian Galle
    --Last Updated: 20 Feb 2015 by jeg

    --Beads--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Bead, '||\"j\".\"BeadShape\" AS \"ArtifactType\",
    'Bead' AS \"ArtifactCategory\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBeadShape\" as \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"

    #{query}

    Group BY
    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL

    --Buckles--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Buckle, '||\"j\".\"BuckleType\" AS \"ArtifactType\",
    'Buckle' AS \"ArtifactCategory\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBuckle\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBuckleType\" as \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"

    #{query}

    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL
    --Buttons--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Button, '||\"j\".\"ButtonType\" AS \"ArtifactType\",
    'Button' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblButton\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblButtonType\"as \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"

    #{query}

    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"ArtifactType\",
    \"ArtifactCategory\"


    UNION ALL
    --Ceramics--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    \"m\".\"Ware\" AS \"ArtifactType\",
    'Ceramic' AS \"ArtifactCategory\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblCeramic\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblCeramicWare\" as \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"

    #{query}

    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"ArtifactType\",
    \"ArtifactCategory\"
    UNION ALL
    --Faunal--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    \"j\".\"English\" AS \"ArtifactType\",
    'Faunal' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBone\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBoneTaxon\" as \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"

    #{query}


    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL
    --General Artifacts--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    \"j\".\"GenArtifactForm\" AS \"ArtifactType\",
    'General Artifacts' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGenArtifact\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGenArtifactForm\" as \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"

    #{query}


    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL

    --Glass--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    \"j\".\"GlassForm\" AS \"ArtifactType\",
    'Glass' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGlass\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGlassForm\" as \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"

    #{query}


    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL
    --Tobacco Pipes--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Tobacco Pipe, '||\"j\".\"TobaccoPipeCompleteness\" AS \"ArtifactType\",
    'Tobacco Pipe' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblTobaccoPipe\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" as \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"

    #{query}

    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"ArtifactType\",
    \"ArtifactCategory\"
    UNION ALL


    --Utensils--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Utensil, '||\"j\".\"UtensilForm\" AS \"ArtifactType\",
    'Utensil' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblUtensil\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblUtensilForm\" as \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"


    #{query}

    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"e\".\"FeatureNumber\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    ORDER BY
    \"ProjectName\" ASC,
    \"FeatureNumber\" ASC,
    \"ArtifactCategory\" ASC,
    \"ArtifactType\" ASC

     "
      
  end
  def aq_one_phase(query)
    "where #{query}" if query != ''
      
          query_str = "--File Name: AQ1_Phase_DAACS_Done
    --Created by: Jillian Galle
    --Last Updated: 20 Feb 2015 by jeg

    --Beads--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Bead, '||\"j\".\"BeadShape\" AS \"ArtifactType\",
    'Bead' AS \"ArtifactCategory\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBeadShape\" as \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"

    #{query}

    Group BY
    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL

    --Buckles--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Buckle, '||\"j\".\"BuckleType\" AS \"ArtifactType\",
    'Buckle' AS \"ArtifactCategory\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBuckle\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBuckleType\" as \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"

    #{query}

    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL
    --Buttons--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Button, '||\"j\".\"ButtonType\" AS \"ArtifactType\",
    'Button' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblButton\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblButtonType\"as \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"

    #{query}

    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"


    UNION ALL
    --Ceramics--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    \"m\".\"Ware\" AS \"ArtifactType\",
    'Ceramic' AS \"ArtifactCategory\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblCeramic\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblCeramicWare\" as \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"

    #{query}

    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"
    UNION ALL
    --Faunal--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    \"j\".\"English\" AS \"ArtifactType\",
    'Faunal' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBone\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBoneTaxon\" as \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"


    #{query}

    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL
    --General Artifacts--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    \"j\".\"GenArtifactForm\" AS \"ArtifactType\",
    'General Artifacts' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGenArtifact\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGenArtifactForm\" as \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"

    #{query}

    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL

    --Glass--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    \"j\".\"GlassForm\" AS \"ArtifactType\",
    'Glass' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGlass\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGlassForm\" as \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"


    #{query}

    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    UNION ALL
    --Tobacco Pipes--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Tobacco Pipe, '||\"j\".\"TobaccoPipeCompleteness\" AS \"ArtifactType\",
    'Tobacco Pipe' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblTobaccoPipe\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" as \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"

    #{query}

    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"
    UNION ALL


    --Utensils--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    Sum(\"i\".\"Quantity\") AS \"TotalCount\",
    'Utensil, '||\"j\".\"UtensilForm\" AS \"ArtifactType\",
    'Utensil' AS \"ArtifactCategory\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblUtensil\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblUtensilForm\" as \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"


    #{query}

    Group BY

    \"b\".\"ProjectName\",
    \"a\".\"ProjectID\",
    \"c\".\"DAACSPhase\",
    \"ArtifactType\",
    \"ArtifactCategory\"

    ORDER BY
    \"ProjectName\" ASC,
    \"DAACSPhase\" ASC,
    \"ArtifactCategory\" ASC,
    \"ArtifactType\" ASC

    "
  end
  def aq_one_strat_group(query)
    "--File Name: AQ1_SG_DAACS_Done
          --Created by: Jillian Galle
          --Last Updated: 20 Feb 2015 by jeg

          --Beads--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Bead, '||\"j\".\"BeadShape\" AS \"ArtifactType\",
          'Bead' AS \"ArtifactCategory\"

          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblBead\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblBeadShape\" as \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL

          --Buckles--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Buckle, '||\"j\".\"BuckleType\" AS \"ArtifactType\",
          'Buckle' AS \"ArtifactCategory\"

          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblBuckle\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblBuckleType\" as \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL
          --Buttons--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Button, '||\"j\".\"ButtonType\" AS \"ArtifactType\",
          'Button' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblButton\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblButtonType\"as \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"


          UNION ALL
          --Ceramics--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          \"m\".\"Ware\" AS \"ArtifactType\",
          'Ceramic' AS \"ArtifactCategory\"

          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblCeramic\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblCeramicWare\" as \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL
          --Faunal--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          \"j\".\"English\" AS \"ArtifactType\",
          'Faunal' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblBone\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblBoneTaxon\" as \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"


          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL
          --General Artifacts--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          \"j\".\"GenArtifactForm\" AS \"ArtifactType\",
          'General Artifacts' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblGenArtifact\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblGenArtifactForm\" as \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL

          --Glass--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          \"j\".\"GlassForm\" AS \"ArtifactType\",
          'Glass' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblGlass\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblGlassForm\" as \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL
          --Tobacco Pipes--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Tobacco Pipe, '||\"j\".\"TobaccoPipeCompleteness\" AS \"ArtifactType\",
          'Tobacco Pipe' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblTobaccoPipe\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" as \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL


          --Utensils--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Utensil, '||\"j\".\"UtensilForm\" AS \"ArtifactType\",
          'Utensil' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblUtensil\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblUtensilForm\" as \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"


          #{query}
      
          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"c\".\"DAACSStratigraphicGroup\",
          \"c\".\"DAACSStratigraphicGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          ORDER BY
          \"ProjectName\" ASC,
          \"DAACSStratigraphicGroup\" ASC,
          \"ArtifactCategory\" ASC,
          \"ArtifactType\" ASC"
  end
  def aq_one_feature_group(query)
    "--File Name: AQ1_FeatureGroup_DAACS_Done
          --Created by: Jillian Galle
          --Last Updated: 20 Feb 2015 by jeg

          --Beads--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          string_agg(distinct COALESCE (\"e\".\"FeatureNumber\"), ', ')  \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Bead, '||\"j\".\"BeadShape\" AS \"ArtifactType\",
          'Bead' AS \"ArtifactCategory\"

          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblBead\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblBeadShape\" as \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL

          --Buckles--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          string_agg(distinct COALESCE (\"e\".\"FeatureNumber\"), ', ')  \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Buckle, '||\"j\".\"BuckleType\" AS \"ArtifactType\",
          'Buckle' AS \"ArtifactCategory\"

          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblBuckle\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblBuckleType\" as \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"

          #{query}

          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL
          --Buttons--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          string_agg(distinct COALESCE (\"e\".\"FeatureNumber\"), ', ')  \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Button, '||\"j\".\"ButtonType\" AS \"ArtifactType\",
          'Button' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblButton\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblButtonType\"as \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"

          #{query}

          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"


          UNION ALL
          --Ceramics--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          string_agg(distinct COALESCE (\"e\".\"FeatureNumber\"), ', ')  \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          \"m\".\"Ware\" AS \"ArtifactType\",
          'Ceramic' AS \"ArtifactCategory\"

          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblCeramic\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblCeramicWare\" as \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"

          #{query}

          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"
          UNION ALL
          --Faunal--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          string_agg(distinct COALESCE (\"e\".\"FeatureNumber\"), ', ')  \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          \"j\".\"English\" AS \"ArtifactType\",
          'Faunal' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblBone\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblBoneTaxon\" as \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"


          #{query}

          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL
          --General Artifacts--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          string_agg(distinct COALESCE (\"e\".\"FeatureNumber\"), ', ')  \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          \"j\".\"GenArtifactForm\" AS \"ArtifactType\",
          'General Artifacts' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblGenArtifact\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblGenArtifactForm\" as \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"

          #{query}

          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL

          --Glass--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          string_agg(distinct COALESCE (\"e\".\"FeatureNumber\"), ', ')  \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          \"j\".\"GlassForm\" AS \"ArtifactType\",
          'Glass' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblGlass\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblGlassForm\" as \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"


          #{query}

          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL
          --Tobacco Pipes--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          string_agg(distinct COALESCE (\"e\".\"FeatureNumber\"), ', ')  \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Tobacco Pipe, '||\"j\".\"TobaccoPipeCompleteness\" AS \"ArtifactType\",
          'Tobacco Pipe' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblTobaccoPipe\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" as \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"

          #{query}

          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"
          UNION ALL


          --Utensils--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          string_agg(distinct COALESCE (\"e\".\"FeatureNumber\"), ', ')  \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Utensil, '||\"j\".\"UtensilForm\" AS \"ArtifactType\",
          'Utensil' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblUtensil\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblUtensilForm\" as \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"


          #{query}
      
          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          ORDER BY
          \"ProjectName\" ASC,
          \"FeatureNumber\" ASC,
          \"ArtifactCategory\" ASC,
          \"ArtifactType\" ASC"
  end
  def aq_one_feature_type(query)
    "--File Name: AQ1_FeatureType_DRC_Done
          --Created by: Jillian Galle
          --Last Updated: 20 Feb 2015 by jeg

          --Beads--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Bead, '||\"j\".\"BeadShape\" AS \"ArtifactType\",
          'Bead' AS \"ArtifactCategory\"

          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblBead\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblBeadShape\" as \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"

          #{query}


          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"e\".\"FeatureNumber\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL

          --Buckles--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Buckle, '||\"j\".\"BuckleType\" AS \"ArtifactType\",
          'Buckle' AS \"ArtifactCategory\"

          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblBuckle\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblBuckleType\" as \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"

          #{query}

          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"e\".\"FeatureNumber\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL
          --Buttons--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Button, '||\"j\".\"ButtonType\" AS \"ArtifactType\",
          'Button' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblButton\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblButtonType\"as \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"

          #{query}


          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"e\".\"FeatureNumber\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"


          UNION ALL
          --Ceramics--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          \"m\".\"Ware\" AS \"ArtifactType\",
          'Ceramic' AS \"ArtifactCategory\"

          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblCeramic\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblCeramicWare\" as \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"

          #{query}


          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"e\".\"FeatureNumber\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"
          UNION ALL
          --Faunal--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          \"j\".\"English\" AS \"ArtifactType\",
          'Faunal' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblBone\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblBoneTaxon\" as \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"


          #{query}


          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"e\".\"FeatureNumber\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL
          --General Artifacts--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          \"j\".\"GenArtifactForm\" AS \"ArtifactType\",
          'General Artifacts' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblGenArtifact\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblGenArtifactForm\" as \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"

          #{query}


          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"e\".\"FeatureNumber\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL

          --Glass--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          \"j\".\"GlassForm\" AS \"ArtifactType\",
          'Glass' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblGlass\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblGlassForm\" as \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"


          #{query}

          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"e\".\"FeatureNumber\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          UNION ALL
          --Tobacco Pipes--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Tobacco Pipe, '||\"j\".\"TobaccoPipeCompleteness\" AS \"ArtifactType\",
          'Tobacco Pipe' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblTobaccoPipe\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" as \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"

          #{query}


          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"e\".\"FeatureNumber\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"
          UNION ALL


          --Utensils--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjectID\",
          \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
          \"f\".\"FeatureType\" AS \"FeatureType\",
          \"e\".\"FeatureGroup\" AS \"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
          Sum(\"i\".\"Quantity\") AS \"TotalCount\",
          'Utensil, '||\"j\".\"UtensilForm\" AS \"ArtifactType\",
          'Utensil' AS \"ArtifactCategory\"


          FROM
          \"public\".\"tblProject\" AS \"a\" 
          left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
          left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
          left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
          inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
          inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblUtensil\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblUtensilForm\" as \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"


          #{query}

          Group BY

          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"e\".\"FeatureNumber\",
          \"f\".\"FeatureType\",
          \"e\".\"FeatureGroup\",
          \"e\".\"FeatureGroupInterpretation\",
          \"ArtifactType\",
          \"ArtifactCategory\"

          ORDER BY
          \"ProjectName\" ASC,
          \"FeatureNumber\" ASC,
          \"ArtifactCategory\" ASC,
          \"ArtifactType\" ASC"
  end
  def aq_one_site(query)
    "--File Name: AQ1_Site_DRC_Done
          --Created by: Jillian Galle
          --Last Updated: 20 Feb 2015 by jeg

          --Beads--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjecID\",
          Sum(\"f\".\"Quantity\") AS \"Total Count\",
          'Bead, '||\"g\".\"BeadShape\" AS \"Artifact Type\",
          'Bead' AS \"Artifact Category\"


          FROM
          \"public\".\"tblProject\" as \"a\"
          LEFT JOIN \"public\".\"tblProjectName\" as \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          LEFT JOIN \"public\".\"tblContext\" as \"c\" ON \"c\".\"ProjectID\" = \"a\".\"ProjectID\"
          LEFT JOIN \"public\".\"tblContextSample\" as \"d\" ON \"d\".\"ContextAutoID\" = \"c\".\"ContextAutoID\"
          INNER JOIN \"public\".\"tblGenerateContextArtifactID\" as \"e\" ON \"d\".\"ContextSampleID\" = \"e\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblBead\" as \"f\" ON \"f\".\"GenerateContextArtifactID\" = \"e\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblBeadShape\" as \"g\" ON \"f\".\"BeadShapeID\" = \"g\".\"BeadShapeID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"Artifact Type\"

          UNION ALL

          --Buckles--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjecID\",
          Sum(\"f\".\"Quantity\") AS \"Total Count\",
          'Buckle, '||\"g\".\"BuckleType\" AS \"Artifact Type\",
          'Buckle' AS \"Artifact Category\"

          FROM
          \"public\".\"tblProject\" as \"a\"
          LEFT JOIN \"public\".\"tblProjectName\" as \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          LEFT JOIN \"public\".\"tblContext\" as \"c\" ON \"c\".\"ProjectID\" = \"a\".\"ProjectID\"
          LEFT JOIN \"public\".\"tblContextSample\" as \"d\" ON \"d\".\"ContextAutoID\" = \"c\".\"ContextAutoID\"
          INNER JOIN \"public\".\"tblGenerateContextArtifactID\" as \"e\" ON \"d\".\"ContextSampleID\" = \"e\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblBuckle\" as \"f\" ON \"f\".\"GenerateContextArtifactID\" = \"e\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblBuckleType\" as \"g\" ON \"g\".\"BuckleTypeID\" = \"f\".\"BuckleTypeID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"Artifact Type\"

          UNION ALL

          --Buttons--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjecID\",
          Sum(\"f\".\"Quantity\") AS \"Total Count\",
          'Button, '||\"g\".\"ButtonType\" AS \"Artifact Type\",
          'Button' AS \"Artifact Category\"

          FROM
          \"public\".\"tblProject\" as \"a\"
          LEFT JOIN \"public\".\"tblProjectName\" as \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          LEFT JOIN \"public\".\"tblContext\" as \"c\" ON \"c\".\"ProjectID\" = \"a\".\"ProjectID\"
          LEFT JOIN \"public\".\"tblContextSample\" as \"d\" ON \"d\".\"ContextAutoID\" = \"c\".\"ContextAutoID\"
          INNER JOIN \"public\".\"tblGenerateContextArtifactID\" as \"e\" ON \"d\".\"ContextSampleID\" = \"e\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblButton\" as \"f\" ON \"f\".\"GenerateContextArtifactID\" = \"e\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblButtonType\" as \"g\" ON \"f\".\"ButtonTypeID\" = \"g\".\"ButtonTypeID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"Artifact Type\"

          UNION ALL

          --Ceramics--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjecID\",
          Sum(\"f\".\"Quantity\") AS \"Total Count\",
          \"g\".\"Ware\" AS \"Artifact Type\",
          'Ceramic' AS \"Artifact Category\"

          FROM
          \"public\".\"tblProject\" as \"a\"
          LEFT JOIN \"public\".\"tblProjectName\" as \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          LEFT JOIN \"public\".\"tblContext\" as \"c\" ON \"c\".\"ProjectID\" = \"a\".\"ProjectID\"
          LEFT JOIN \"public\".\"tblContextSample\" as \"d\" ON \"d\".\"ContextAutoID\" = \"c\".\"ContextAutoID\"
          INNER JOIN \"public\".\"tblGenerateContextArtifactID\" as \"e\" ON \"d\".\"ContextSampleID\" = \"e\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblCeramic\" as \"f\" ON \"f\".\"GenerateContextArtifactID\" = \"e\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblCeramicWare\" as \"g\" ON \"f\".\"WareID\" = \"g\".\"WareID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"Artifact Type\"

          UNION ALL

          --Faunal--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjecID\",
          Sum(\"f\".\"Quantity\") AS \"Total Count\",
          \"g\".\"English\" AS \"Artifact Type\",
          'Faunal' AS \"Artifact Category\"

          FROM
          \"public\".\"tblProject\" as \"a\"
          LEFT JOIN \"public\".\"tblProjectName\" as \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          LEFT JOIN \"public\".\"tblContext\" as \"c\" ON \"c\".\"ProjectID\" = \"a\".\"ProjectID\"
          LEFT JOIN \"public\".\"tblContextSample\" as \"d\" ON \"d\".\"ContextAutoID\" = \"c\".\"ContextAutoID\"
          INNER JOIN \"public\".\"tblGenerateContextArtifactID\" as \"e\" ON \"d\".\"ContextSampleID\" = \"e\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblBone\" as \"f\" ON \"f\".\"GenerateContextArtifactID\" = \"e\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblBoneTaxon\" as \"g\" ON \"f\".\"TaxonID\" = \"g\".\"TaxonID\"


          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"Artifact Type\"

          UNION ALL

          --General Artifacts--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjecID\",
          Sum(\"f\".\"Quantity\") AS \"Total Count\",
          \"g\".\"GenArtifactForm\" AS \"Artifact Type\",
          'General Artifacts' AS \"Artifact Category\"

          FROM
          \"public\".\"tblProject\" as \"a\"
          LEFT JOIN \"public\".\"tblProjectName\" as \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          LEFT JOIN \"public\".\"tblContext\" as \"c\" ON \"c\".\"ProjectID\" = \"a\".\"ProjectID\"
          LEFT JOIN \"public\".\"tblContextSample\" as \"d\" ON \"d\".\"ContextAutoID\" = \"c\".\"ContextAutoID\"
          INNER JOIN \"public\".\"tblGenerateContextArtifactID\" as \"e\" ON \"d\".\"ContextSampleID\" = \"e\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblGenArtifact\" as \"f\" ON \"f\".\"GenerateContextArtifactID\" = \"e\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblGenArtifactForm\" as \"g\" ON \"f\".\"GenArtifactFormID\" = \"g\".\"GenArtifactFormID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"Artifact Type\"

          UNION ALL

          --Glass--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjecID\",
          Sum(\"f\".\"Quantity\") AS \"Total Count\",
          \"g\".\"GlassForm\" AS \"Artifact Type\",
          'Glass' AS \"Artifact Category\"

          FROM
          \"public\".\"tblProject\" as \"a\"
          LEFT JOIN \"public\".\"tblProjectName\" as \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          LEFT JOIN \"public\".\"tblContext\" as \"c\" ON \"c\".\"ProjectID\" = \"a\".\"ProjectID\"
          LEFT JOIN \"public\".\"tblContextSample\" as \"d\" ON \"d\".\"ContextAutoID\" = \"c\".\"ContextAutoID\"
          INNER JOIN \"public\".\"tblGenerateContextArtifactID\" as \"e\" ON \"d\".\"ContextSampleID\" = \"e\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblGlass\" as \"f\" ON \"f\".\"GenerateContextArtifactID\" = \"e\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblGlassForm\" as \"g\"  ON \"f\".\"GlassFormID\" = \"g\".\"GlassFormID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"Artifact Type\"

          UNION ALL


          --Tobacco Pipes--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjecID\",
          Sum(\"f\".\"Quantity\") AS \"Total Count\",
          'Tobacco Pipe, '||\"g\".\"TobaccoPipeCompleteness\" AS \"Artifact Type\",
          'Tobacco Pipe' AS \"Artifact Category\"

          FROM
          \"public\".\"tblProject\" as \"a\"
          LEFT JOIN \"public\".\"tblProjectName\" as \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          LEFT JOIN \"public\".\"tblContext\" as \"c\" ON \"c\".\"ProjectID\" = \"a\".\"ProjectID\"
          LEFT JOIN \"public\".\"tblContextSample\" as \"d\" ON \"d\".\"ContextAutoID\" = \"c\".\"ContextAutoID\"
          INNER JOIN \"public\".\"tblGenerateContextArtifactID\" as \"e\" ON \"d\".\"ContextSampleID\" = \"e\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblTobaccoPipe\" as \"f\" ON \"f\".\"GenerateContextArtifactID\" = \"e\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" as \"g\" ON \"f\".\"TobaccoPipeCompletenessID\" = \"g\".\"TobaccoPipeCompletenessID\"

          #{query}

          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"Artifact Type\"

          UNION ALL

          --Utensils--

          SELECT
          \"b\".\"ProjectName\" AS \"ProjectName\",
          \"a\".\"ProjectID\" AS \"ProjecID\",
          Sum(\"f\".\"Quantity\") AS \"Total Count\",
          'Utensil, '||\"g\".\"UtensilForm\" AS \"Artifact Type\",
          'Utensil' AS \"Artifact Category\"

          FROM
          \"public\".\"tblProject\" as \"a\"
          LEFT JOIN \"public\".\"tblProjectName\" as \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
          LEFT JOIN \"public\".\"tblContext\" as \"c\" ON \"c\".\"ProjectID\" = \"a\".\"ProjectID\"
          LEFT JOIN \"public\".\"tblContextSample\" as \"d\" ON \"d\".\"ContextAutoID\" = \"c\".\"ContextAutoID\"
          INNER JOIN \"public\".\"tblGenerateContextArtifactID\" as \"e\" ON \"d\".\"ContextSampleID\" = \"e\".\"ContextSampleID\"
          INNER JOIN \"public\".\"tblUtensil\" as \"f\" ON \"f\".\"GenerateContextArtifactID\" = \"e\".\"GenerateContextArtifactID\"
          LEFT JOIN \"public\".\"tblUtensilForm\" as \"g\" ON \"f\".\"UtensilFormID\" = \"g\".\"UtensilFormID\"

          #{query}
      
          Group BY
          \"b\".\"ProjectName\",
          \"a\".\"ProjectID\",
          \"Artifact Type\"

          ORDER BY
          \"ProjectName\" ASC,
          \"Artifact Category\" ASC,
          \"Artifact Type\" ASC"
  end
  
  def aq_three_bead_concat(query)
    "--File Name: AQ3_Beads_ConcatenatedView_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 9 March 2015 by jeg
    --Artifact Query 3 Beads: This file returns concatenated data for Beads for the DRC Website.


    --Step 1: Users select One or All Bead Attributes.  The data always returned for this query are the following, in addition to any other Bead Fields selected by User. 

    SELECT
    b.\"ProjectName\" AS \"ProjectName\",--always return this field
    \"c\".\"ProjectID\" AS \"ProjectID\",--always return this field
    \"c\".\"Context\" AS \"Context\",--always return this field
    d.\"DepositType\" AS \"DepositType\",
    \"dd\".\"UnitType\" as \"UnitType\",
    f.\"FeatureType\" AS \"FeatureType\",
    e.\"FeatureNumber\" AS \"FeatureNumber\",--always return this field
    e.\"FeatureGroup\" AS \"FeatureGroupNumber\",--always return this field
    e.\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",--always return this field
    \"c\".\"DAACSStratigraphicGroup\" AS \"StratigraphicGroup\",--always return this field
    \"c\".\"DAACSStratigraphicGroupInterpretation\" as \"DAACSStratigraphicGroupInterpretation\",--always return this field
    \"c\".\"DAACSPhase\" AS \"DAACS Phase\",--always return this field
    i.\"ArtifactID\" AS \"ArtifactID\",--always return this field
    i.\"Quantity\" AS \"Count\",--always return this field
    j.\"Completeness\" as \"Completeness\",
    \"k\".\"BeadMaterial\" AS \"Material\",
    l.\"BeadManuTech\" AS \"ManufacturingTechnique\",
    \"m\".\"Structure\" as \"Structure\",
    n.\"BeadForm\" AS \"Form\",
    o.\"BeadShape\" AS \"Shape\",
    \"p\".\"EndTreatment\" AS \"EndTreatment\",
    q.\"YesNo\" AS \"Heat Treated\",
    r.\"BasicColor\" AS \"BeadColor\", --Note that I have added two color fields the basic color and, below, the appcolowrittendescription.
    \"r\". \"AppliedColorWrittenDescription\" AS \"DAACS Color Description\",
    \"r\".\"MunsellRangeAppliedColor\" AS \"Bead Munsell Color Range\",
    i.\"NumberofFacets\" AS \"NumberofFacets\",
    string_agg (distinct COALESCE(ae.\"BeadDecoration\") || ', ' || COALESCE(af.\"BasicColor\") || ', '||  COALESCE(af.\"AppliedColorWrittenDescription\") || ', '|| COALESCE(ad.\"DecDescription\"),'; ') AS \"BeadDecoration\",
    --This strings together, then  aggregates all fields from \"tblBeadDecTech\". Note that I have included two different colors from tblMunsellAppliedColor, Basic Color and Applied Color Written Dexcription.
    --Coalesce function replaces null values with another character or number
    string_agg(distinct COALESCE(ab.\"CasingLayer\") || ', ' || COALESCE(ac.\"BasicColor\") || ',' || COALESCE(ac.\"AppliedColorWrittenDescription\"), '; ')  as \"CasingInformation\",
    --This strings together, then  aggregates all fields from \"tblBeadCasing\". Note that I have included two different colors from tblMunsellAppliedColor, Basic Color and Applied Color Written Dexcription
    --Coalesce function replaces null values with another character or number
    s.\"Diaphaneity\",
    \"t\".\"YesNo\" AS \"PostManufacturingModification\",
    u.\"YesNo\" AS \"Patination\",
    v.\"YesNo\" AS \"Burned\",
    w.\"YesNo\" AS \"WeatheredEroded\",
    i.\"Length\",
    i.\"Width\",
    i.\"Height\",
    i.\"Weight\",
    i.\"SizeofPerforationI\" AS \"SizeofPerforationI\",
    i.\"SizeofPerforationII\" AS \"SizeofPerforationII\",
    x.\"YesNo\" AS \"Mended\",
    i.\"Conservation\",
    i.\"Notes\",
    string_agg(COALESCE(z.\"ImageFileLocation\"),'; ') AS \"Images\",
    \"ee\".\"ObjectID\"

    FROM
    \"public\".\"tblProject\" AS \"a\"
    LEFT JOIN \"public\".\"tblProjectName\" AS b ON \"a\".\"ProjectNameID\" = b.\"ProjectNameID\"
    LEFT JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    LEFT JOIN \"public\".\"tblContextDepositType\" AS d ON \"c\".\"DepositTypeID\" = d.\"DepositTypeID\"
    left join \"public\".\"tblContextUnitType\" AS \"dd\"	on \"c\".\"UnitTypeID\" = \"dd\".\"UnitTypeID\"
    LEFT JOIN \"public\".\"tblContextFeature\" AS e ON \"c\".\"ProjectID\" = e.\"ProjectID\" AND \"c\".\"FeatureNumber\" = e.\"FeatureNumber\"
    LEFT JOIN \"public\".\"tblContextFeatureType\" AS f ON e.\"FeatureTypeID\" = f.\"FeatureTypeID\"
    INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS h ON \"g\".\"ContextSampleID\" = h.\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" AS i ON h.\"ArtifactID\" = i.\"ArtifactID\"
    LEFT JOIN \"public\".\"tblCompleteness\" AS j ON i.\"CompletenessID\" = j.\"CompletenessID\"
    LEFT JOIN \"public\".\"tblBeadMaterial\" AS \"k\" ON i.\"BeadMaterialID\" = \"k\".\"BeadMaterialID\"
    LEFT JOIN \"public\".\"tblBeadManuTech\" AS l ON i.\"BeadManuTechID\" = l.\"BeadManuTechID\"
    LEFT JOIN \"public\".\"tblBeadStructure\" AS \"m\" ON i.\"StructureID\" = \"m\".\"StructureID\"
    LEFT JOIN \"public\".\"tblBeadForm\" AS n ON i.\"BeadFormID\" = n.\"BeadFormID\"
    LEFT JOIN \"public\".\"tblBeadShape\" AS o ON i.\"BeadShapeID\" = o.\"BeadShapeID\"
    LEFT JOIN \"public\".\"tblBeadEndTreatment\" AS \"p\" ON i.\"EndTreatmentID\" = \"p\".\"EndTreatmentID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS q ON i.\"HeatTreated\" = q.\"YesNoID\"
    LEFT JOIN \"public\".\"tblMunsellAppliedColor\" AS r ON i.\"MunAppColorID\" = r.\"MunAppColorID\"
    LEFT JOIN \"public\".\"tblBeadDiaphaneity\" AS s ON i.\"DiaphaneityID\" = s.\"DiaphaneityID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"t\" ON i.\"PMM\" = \"t\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS u ON i.\"Patination\" = u.\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS v ON i.\"Burned\" = v.\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS w ON i.\"BeadWeatheredEroded\" = w.\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS x ON i.\"Mended\" = x.\"YesNoID\"
    LEFT JOIN \"public\".\"tblArtifactImage\" AS y ON i.\"ArtifactID\" = y.\"ArtifactID\"
    LEFT JOIN \"public\".\"tblImage\" AS z ON y.\"ImageID\" = z.\"ImageID\"
    LEFT JOIN \"public\".\"tblBeadCasing\" AS aa ON y.\"ArtifactID\" = aa.\"ArtifactID\"
    LEFT JOIN \"public\".\"tblBeadCasingLayer\" AS ab ON aa.\"CasingLayerID\" = ab.\"CasingLayerID\"
    LEFT JOIN \"public\".\"tblMunsellAppliedColor\" AS ac ON aa.\"MunAppColorID\" = ac.\"MunAppColorID\"
    LEFT JOIN \"public\".\"tblBeadDecTech\" AS ad on y.\"ArtifactID\" = ad.\"ArtifactID\"
    LEFT JOIN \"public\".\"tblBeadDecoration\" AS ae ON ad.\"BeadDecorationID\" = ae.\"BeadDecorationID\"
    LEFT JOIN \"public\".\"tblMunsellAppliedColor\" AS af ON ad.\"MunAppColorID\" = af.\"MunAppColorID\"
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"ee\" on \"i\".\"GenerateContextArtifactID\" = \"ee\".\"GenerateContextArtifactID\" 

    #{query}

    GROUP BY --Group by all field names not in the string_agg functions
    b.\"ProjectName\",
    \"c\".\"ProjectID\",
    \"c\".\"Context\",
    d.\"DepositType\",
    \"dd\".\"UnitType\",
    f.\"FeatureType\",
    e.\"FeatureNumber\",
    e.\"FeatureGroup\",
    e.\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\",
    i.\"ArtifactID\",
    i.\"Quantity\",
    j.\"Completeness\",
    \"k\".\"BeadMaterial\",
    l.\"BeadManuTech\",
    \"m\".\"Structure\",
    n.\"BeadForm\",
    o.\"BeadShape\",
    \"p\".\"EndTreatment\",
    q.\"YesNo\",
    r.\"BasicColor\", 
    \"r\". \"AppliedColorWrittenDescription\",
    \"r\".\"MunsellRangeAppliedColor\",
    i.\"NumberofFacets\",
    s.\"Diaphaneity\",
    \"t\".\"YesNo\",--Note that this is the Post Manufacturing Modification field. The sql needs the group by to be the alias and the YesNo field, not \"PMM\"
    u.\"YesNo\",--Note that this is the patination field. The sql needs the group by to be the alias and the YesNo field, not \"Patination\"
    v.\"YesNo\", --Note that this is the Burned field. The sql needs the group by to be the alias and the YesNo field, not \"Burned\"
    w.\"YesNo\",--Note that this is the WeateredEroded field. The sql needs the group by to be the alias and the YesNo field, not \"WeatheredEroded\"
    i.\"Length\",
    i.\"Width\",
    i.\"Height\",
    i.\"Weight\",
    i.\"SizeofPerforationI\",
    i.\"SizeofPerforationII\",
    x.\"YesNo\", --Note that this is the mended field. The sql needs the group by to be the alias and the YesNo field, not \"Mended\"
    i.\"Conservation\",
    i.\"Notes\",
    \"ee\".\"ObjectID\"



    ORDER BY 
    \"ProjectName\" ASC,
    \"ArtifactID\" ASC,
    \"Form\" ASC,
    \"ManufacturingTechnique\" ASC,
    \"Material\" ASC"
    
  end
  def aq_three_bead_related(query)
    "--File Name: AQ3_Beads_RelatedView_DAACS_Done
    --Created by: Jillian Galle
    --Last Updated: 6 March 2015 by jeg
    --Artifact Query 3 Beads: This file returns related data for Beads for the DAACS Website.


    --Step 1: Users select One or All Bead Attributes.  The data always returned for this query are the following, in addition to any other Bead Fields selected by User. 

    SELECT
    b.\"ProjectName\" AS \"ProjectName\",--always return this field
    \"c\".\"ProjectID\" AS \"ProjectID\",--always return this field
    \"c\".\"Context\" AS \"Context\",--always return this field
    d.\"DepositType\" AS \"DepositType\",
    \"dd\".\"UnitType\" as \"UnitType\",
    f.\"FeatureType\" AS \"FeatureType\",
    e.\"FeatureNumber\" AS \"FeatureNumber\",--always return this field
    e.\"FeatureGroup\" AS \"FeatureGroupNumber\",--always return this field
    e.\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",--always return this field
    \"c\".\"DAACSStratigraphicGroup\" AS \"StratigraphicGroup\",--always return this field
    \"c\".\"DAACSStratigraphicGroupInterpretation\" as \"DAACSStratigraphicGroupInterpretation\",--always return this field
    \"c\".\"DAACSPhase\" AS \"DAACS Phase\",--always return this field
    i.\"ArtifactID\" AS \"ArtifactID\",--always return this field
    i.\"Quantity\" AS \"Count\",--always return this field
    j.\"Completeness\" as \"Completeness\",
    \"k\".\"BeadMaterial\" AS \"Material\",
    l.\"BeadManuTech\" AS \"ManufacturingTechnique\",
    \"m\".\"Structure\" as \"Structure\",
    n.\"BeadForm\" AS \"Form\",
    o.\"BeadShape\" AS \"Shape\",
    \"p\".\"EndTreatment\" AS \"EndTreatment\",
    q.\"YesNo\" AS \"Heat Treated\",
    r.\"BasicColor\" AS \"BeadColor\", --Note that I have added two color fields the basic color and, below, the appcolowrittendescription.
    \"r\". \"AppliedColorWrittenDescription\" AS \"DAACS Color Description\",
    \"r\".\"MunsellRangeAppliedColor\" AS \"Bead Munsell Color Range\",
    i.\"NumberofFacets\" AS \"NumberofFacets\",
    ae.\"BeadDecoration\" as \"BeadDecoration\",
    af.\"BasicColor\" as \"BeadDecBasicColor\",
    af.\"AppliedColorWrittenDescription\" as \"BeadDecDetailedColor\",
    ad.\"DecDescription\" as \"BeadDecDescription\",
    \"ab\".\"CasingLayer\" as \"CasingLayer\",
    \"ac\".\"BasicColor\" as \"BeadLayerBasicColor\",
    \"ac\".\"AppliedColorWrittenDescription\" as \"BeadLayerDetailedColor\",
    s.\"Diaphaneity\",
    \"t\".\"YesNo\" AS \"PostManufacturingModification\",
    u.\"YesNo\" AS \"Patination\",
    v.\"YesNo\" AS \"Burned\",
    w.\"YesNo\" AS \"WeatheredEroded\",
    i.\"Length\",
    i.\"Width\",
    i.\"Height\",
    i.\"Weight\",
    i.\"SizeofPerforationI\" AS \"SizeofPerforationI\",
    i.\"SizeofPerforationII\" AS \"SizeofPerforationII\",
    x.\"YesNo\" AS \"Mended\",
    i.\"Conservation\",
    i.\"Notes\",
    z.\"ImageFileLocation\" AS \"Images\",
    \"ee\".\"ObjectID\"

    FROM
    \"public\".\"tblProject\" AS \"a\"
    LEFT JOIN \"public\".\"tblProjectName\" AS b ON \"a\".\"ProjectNameID\" = b.\"ProjectNameID\"
    LEFT JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    LEFT JOIN \"public\".\"tblContextDepositType\" AS d ON \"c\".\"DepositTypeID\" = d.\"DepositTypeID\"
    left join \"public\".\"tblContextUnitType\" AS \"dd\"	on \"c\".\"UnitTypeID\" = \"dd\".\"UnitTypeID\"
    LEFT JOIN \"public\".\"tblContextFeature\" AS e ON \"c\".\"ProjectID\" = e.\"ProjectID\" AND \"c\".\"FeatureNumber\" = e.\"FeatureNumber\"
    LEFT JOIN \"public\".\"tblContextFeatureType\" AS f ON e.\"FeatureTypeID\" = f.\"FeatureTypeID\"
    INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS h ON \"g\".\"ContextSampleID\" = h.\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" AS i ON h.\"ArtifactID\" = i.\"ArtifactID\"
    LEFT JOIN \"public\".\"tblCompleteness\" AS j ON i.\"CompletenessID\" = j.\"CompletenessID\"
    LEFT JOIN \"public\".\"tblBeadMaterial\" AS \"k\" ON i.\"BeadMaterialID\" = \"k\".\"BeadMaterialID\"
    LEFT JOIN \"public\".\"tblBeadManuTech\" AS l ON i.\"BeadManuTechID\" = l.\"BeadManuTechID\"
    LEFT JOIN \"public\".\"tblBeadStructure\" AS \"m\" ON i.\"StructureID\" = \"m\".\"StructureID\"
    LEFT JOIN \"public\".\"tblBeadForm\" AS n ON i.\"BeadFormID\" = n.\"BeadFormID\"
    LEFT JOIN \"public\".\"tblBeadShape\" AS o ON i.\"BeadShapeID\" = o.\"BeadShapeID\"
    LEFT JOIN \"public\".\"tblBeadEndTreatment\" AS \"p\" ON i.\"EndTreatmentID\" = \"p\".\"EndTreatmentID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS q ON i.\"HeatTreated\" = q.\"YesNoID\"
    LEFT JOIN \"public\".\"tblMunsellAppliedColor\" AS r ON i.\"MunAppColorID\" = r.\"MunAppColorID\"
    LEFT JOIN \"public\".\"tblBeadDiaphaneity\" AS s ON i.\"DiaphaneityID\" = s.\"DiaphaneityID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"t\" ON i.\"PMM\" = \"t\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS u ON i.\"Patination\" = u.\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS v ON i.\"Burned\" = v.\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS w ON i.\"BeadWeatheredEroded\" = w.\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS x ON i.\"Mended\" = x.\"YesNoID\"
    LEFT JOIN \"public\".\"tblArtifactImage\" AS y ON i.\"ArtifactID\" = y.\"ArtifactID\"
    LEFT JOIN \"public\".\"tblImage\" AS z ON y.\"ImageID\" = z.\"ImageID\"
    LEFT JOIN \"public\".\"tblBeadCasing\" AS aa ON y.\"ArtifactID\" = aa.\"ArtifactID\"
    LEFT JOIN \"public\".\"tblBeadCasingLayer\" AS ab ON aa.\"CasingLayerID\" = ab.\"CasingLayerID\"
    LEFT JOIN \"public\".\"tblMunsellAppliedColor\" AS ac ON aa.\"MunAppColorID\" = ac.\"MunAppColorID\"
    LEFT JOIN \"public\".\"tblBeadDecTech\" AS ad on y.\"ArtifactID\" = ad.\"ArtifactID\"
    LEFT JOIN \"public\".\"tblBeadDecoration\" AS ae ON ad.\"BeadDecorationID\" = ae.\"BeadDecorationID\"
    LEFT JOIN \"public\".\"tblMunsellAppliedColor\" AS af ON ad.\"MunAppColorID\" = af.\"MunAppColorID\"
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"ee\" on \"i\".\"GenerateContextArtifactID\" = \"ee\".\"GenerateContextArtifactID\" 


    #{query}


    ORDER BY 
    \"ProjectName\" ASC,
    \"ArtifactID\" ASC,
    \"Form\" ASC,
    \"ManufacturingTechnique\" ASC,
    \"Material\" ASC"
    
  end
  
  def aq_three_buckle_related(query)
    "--File Name: AQ3_Buckles_RelatedView_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 6 March by jeg
    --Artifact Query 3 Buckles: This file returns related data for Buckles for the DRC Website.


    --Step 1: Users select One or All Buckle Attributes.  The data always returned for this query are the following, in addition to any other Buckle Fields selected by User. 
    SELECT
    \"b\".\"ProjectName\" as \"ProjectName\",--always return this field
    \"c\".\"ProjectID\" as \"ProjectID\",--always return this field
    \"c\".\"Context\" as \"Context\",--always return this field
    \"c\".\"QuadratID\" as \"QuadratID\",
    \"d\".\"DepositType\" as \"DepositType\",
    \"f\".\"FeatureType\" as \"FeatureType\",
    \"e\".\"FeatureNumber\" as \"FeatureNumber\",--always return this field
    \"e\".\"FeatureGroupInterpretation\" as \"FeatureGroupInterpretation\",--always return this field
    \"e\".\"FeatureGroup\" as \"FeatureGroup\",--always return this field
    \"c\".\"DAACSStratigraphicGroup\" as \"StratigraphicGroup\",--always return this field
    \"c\".\"DAACSPhase\" as \"DAACSPhase\",--always return this field
    \"i\".\"ArtifactID\" as \"ArtifactID\",--always return this field
    \"i\".\"Quantity\" as \"Quantity\",--always return this field
    \"j\".\"BuckleType\" as \"BuckleType\",
    \"k\".\"BuckleCompleteness\" as \"Completeness\",
    \"l\".\"FramePlating\" as \"FramePlating\",
    \"n\".\"BucklePart\" as \"BucklePart\", 
    \"o\".\"BuckleMaterial\" as \"BuckleMaterial\", 
    \"p\".\"BuckleManuTech\" as \"BuckleManuTech\", 
    \"q\".\"BuckleShape\" as \"BuckleShape\", 
    \"r\".\"BuckleElement\" as \"BuckleElement\",
    \"m\".\"Length\" as \"Length\", 
    \"m\".\"Width\" as \"Width\", 
    \"i\".\"Weight\" as \"Weight\",
    \"m\".\"PinCenterpointMeasure\" as \"PinCenterpointMeasure\", 
    \"y\".\"BuckleDecTechType\" as \"BuckleDecTechType\", 
    \"z\".\"BuckleDecMotif\" as \"BuckleDecMotif\", 
    \"i\".\"Marks\",
    \"t\".\"YesNo\" as \"Burned\",
    \"i\".\"Conservation\",
    \"u\".\"YesNo\" as \"Mended\",
    \"s\".\"YesNo\" as \"Post Manufacturing Modification\",
    \"i\".\"Notes\",
    \"w\".\"ImageFileLocation\" AS \"Images\",
    \"aa\".\"ObjectID\",
    a.\"Published\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\" 
    left join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\" 
    left join \"public\".\"tblContextDepositType\" AS \"d\" on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\" 
    left join \"public\".\"tblContextFeature\" AS \"e\" on \"c\".\"ProjectID\"=\"e\".\"ProjectID\" and \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\" 
    left join \"public\".\"tblContextFeatureType\" AS \"f\" on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\" 
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\" 
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\" 
    inner join \"public\".\"tblBuckle\" AS \"i\" on \"h\".\"ArtifactID\" = \"i\".\"ArtifactID\" 
    left join \"public\".\"tblBuckleType\" AS \"j\" on \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\" 
    left join \"public\".\"tblBuckleCompleteness\" AS \"k\" on \"i\".\"BuckleCompletenessID\" = \"k\".\"BuckleCompletenessID\" 
    left join \"public\".\"tblBuckleFramePlating\" AS \"l\" on \"i\".\"FramePlatingID\" = \"l\".\"FramePlatingID\" 
    left join \"public\".\"tblBuckleForm\" AS \"m\" on \"i\".\"ArtifactID\" = \"m\".\"ArtifactID\" 
    left join \"public\".\"tblBucklePart\" AS \"n\" on \"m\".\"BucklePartID\" = \"n\".\"BucklePartID\" 
    left join \"public\".\"tblBuckleMaterial\" AS \"o\" on \"m\".\"BuckleMaterialID\" = \"o\".\"BuckleMaterialID\" 
    left join \"public\".\"tblBuckleManuTech\" AS \"p\" on \"m\".\"BuckleManuTechID\" = \"p\".\"BuckleManuTechID\" 
    left join \"public\".\"tblBuckleShape\" AS \"q\" on \"m\".\"BuckleShapeID\" = \"q\".\"BuckleShapeID\" 
    left join \"public\".\"tblBuckleElement\" AS \"r\" on \"m\".\"BuckleElementID\" = \"r\".\"BuckleElementID\" 
    left join \"public\".\"tblYesNo\" AS \"s\" on \"i\".\"PMM\" = \"s\".\"YesNoID\" 
    left join \"public\".\"tblYesNo\" AS \"t\" on \"i\".\"Burned\" = \"t\".\"YesNoID\" 
    left join \"public\".\"tblYesNo\" AS \"u\" on \"i\".\"Mended\" = \"u\".\"YesNoID\" 
    left join \"public\".\"tblArtifactImage\" as \"v\" on \"i\".\"ArtifactID\" = \"v\".\"ArtifactID\" 
    left join \"public\".\"tblImage\" AS \"w\" on \"v\".\"ImageID\" = \"w\".\"ImageID\" 
    left join \"public\".\"tblBuckleDecTech\" AS \"x\" on \"i\".\"ArtifactID\" = \"x\".\"ArtifactID\" 
    left join \"public\".\"tblBuckleDecTechType\" AS \"y\" on \"x\".\"BuckleDecTechTypeID\" = \"y\".\"BuckleDecTechTypeID\" 
    left join \"public\".\"tblBuckleDecMotif\" AS \"z\" on \"x\".\"BuckleDecMotifID\" = \"z\".\"BuckleDecMotifID\" 
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"aa\" on \"i\".\"GenerateContextArtifactID\" = \"aa\".\"GenerateContextArtifactID\" 

    #{query}

    ORDER BY
    \"ProjectName\" ASC,
    \"ArtifactID\" ASC,
    \"BuckleType\" ASC"
    
  end
  
  def aq_three_buckle_concat(query)
    "--File Name: AQ3_Buckles_ConcatenatedView_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 9 March 2015 by jeg
    --Artifact Query 3 Buckles: This file returns concatenated data for Buckles for the DRC Website and for concatenated downloads.


    --Step 1: Users select One or All Buckle Attributes.  The data always returned for this query are the following, in addition to any other Buckle Fields selected by User. 

    SELECT
    \"b\".\"ProjectName\" as \"ProjectName\",--always return this field
    \"c\".\"ProjectID\" as \"ProjectID\",--always return this field
    \"c\".\"Context\" as \"Context\",--always return this field
    \"c\".\"QuadratID\" as \"QuadratID\",
    \"d\".\"DepositType\" as \"DepositType\",
    \"f\".\"FeatureType\" as \"FeatureType\",
    \"e\".\"FeatureNumber\" as \"FeatureNumber\",--always return this field
    \"e\".\"FeatureGroupInterpretation\" as \"FeatureGroupInterpretation\",--always return this field
    \"e\".\"FeatureGroup\" as \"FeatureGroup\",--always return this field
    \"c\".\"DAACSStratigraphicGroup\" as \"StratigraphicGroup\",--always return this field
    \"c\".\"DAACSPhase\" as \"DAACSPhase\",--always return this field
    \"i\".\"ArtifactID\" as \"ArtifactID\",--always return this field
    \"i\".\"Quantity\" as \"Quantity\",--always return this field
    \"j\".\"BuckleType\" as \"BuckleType\",
    \"k\".\"BuckleCompleteness\" as \"Completeness\",
    \"l\".\"FramePlating\" as \"FramePlating\",
    string_agg(COALESCE(\"n\".\"BucklePart\")||', '||COALESCE(\"o\".\"BuckleMaterial\")||', '||COALESCE(\"p\".\"BuckleManuTech\")||
    ', '||COALESCE(\"q\".\"BuckleShape\")||', '||COALESCE(\"r\".\"BuckleElement\")||', '||COALESCE((\"m\".\"Length\"::text), '')||
    ', '||COALESCE((\"m\".\"Width\"::text), '')||', '||COALESCE((\"m\".\"PinCenterpointMeasure\"::text), ''), '; ') 
    AS \"BucklePart,Material,ManufacturingTechnique,Shape,Element,Length,Width\",
    string_agg(distinct COALESCE(\"y\".\"BuckleDecTechType\")||', '||COALESCE(\"z\".\"BuckleDecMotif\"), '; ') AS \"BuckleDecoration\",
    \"i\".\"Marks\",
    \"t\".\"YesNo\" as \"Burned\",
    \"i\".\"Conservation\",
    \"u\".\"YesNo\" as \"Mended\",
    \"s\".\"YesNo\" as \"PostManufacturingModification\",
    \"i\".\"Notes\",
    string_agg(\"w\".\"ImageFileLocation\", '; ') AS \"Images\",
    \"aa\".\"ObjectID\",
    a.\"Published\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\" 
    left join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\" 
    left join \"public\".\"tblContextDepositType\" AS \"d\" on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\" 
    left join \"public\".\"tblContextFeature\" AS \"e\" on \"c\".\"ProjectID\"=\"e\".\"ProjectID\" and \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\" 
    left join \"public\".\"tblContextFeatureType\" AS \"f\" on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\" 
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\" 
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\" 
    inner join \"public\".\"tblBuckle\" AS \"i\" on \"h\".\"ArtifactID\" = \"i\".\"ArtifactID\" 
    left join \"public\".\"tblBuckleType\" AS \"j\" on \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\" 
    left join \"public\".\"tblBuckleCompleteness\" AS \"k\" on \"i\".\"BuckleCompletenessID\" = \"k\".\"BuckleCompletenessID\" 
    left join \"public\".\"tblBuckleFramePlating\" AS \"l\" on \"i\".\"FramePlatingID\" = \"l\".\"FramePlatingID\" 
    left join \"public\".\"tblBuckleForm\" AS \"m\" on \"i\".\"ArtifactID\" = \"m\".\"ArtifactID\" 
    left join \"public\".\"tblBucklePart\" AS \"n\" on \"m\".\"BucklePartID\" = \"n\".\"BucklePartID\" 
    left join \"public\".\"tblBuckleMaterial\" AS \"o\" on \"m\".\"BuckleMaterialID\" = \"o\".\"BuckleMaterialID\" 
    left join \"public\".\"tblBuckleManuTech\" AS \"p\" on \"m\".\"BuckleManuTechID\" = \"p\".\"BuckleManuTechID\" 
    left join \"public\".\"tblBuckleShape\" AS \"q\" on \"m\".\"BuckleShapeID\" = \"q\".\"BuckleShapeID\" 
    left join \"public\".\"tblBuckleElement\" AS \"r\" on \"m\".\"BuckleElementID\" = \"r\".\"BuckleElementID\" 
    left join \"public\".\"tblYesNo\" AS \"s\" on \"i\".\"PMM\" = \"s\".\"YesNoID\" 
    left join \"public\".\"tblYesNo\" AS \"t\" on \"i\".\"Burned\" = \"t\".\"YesNoID\" 
    left join \"public\".\"tblYesNo\" AS \"u\" on \"i\".\"Mended\" = \"u\".\"YesNoID\" 
    left join \"public\".\"tblArtifactImage\" as \"v\" on \"i\".\"ArtifactID\" = \"v\".\"ArtifactID\" 
    left join \"public\".\"tblImage\" AS \"w\" on \"v\".\"ImageID\" = \"w\".\"ImageID\" 
    left join \"public\".\"tblBuckleDecTech\" AS \"x\" on \"i\".\"ArtifactID\" = \"x\".\"ArtifactID\" 
    left join \"public\".\"tblBuckleDecTechType\" AS \"y\" on \"x\".\"BuckleDecTechTypeID\" = \"y\".\"BuckleDecTechTypeID\" 
    left join \"public\".\"tblBuckleDecMotif\" AS \"z\" on \"x\".\"BuckleDecMotifID\" = \"z\".\"BuckleDecMotifID\" 
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"aa\" on \"i\".\"GenerateContextArtifactID\" = \"aa\".\"GenerateContextArtifactID\" 

#{query}

    Group BY

    \"b\".\"ProjectName\",
    \"c\".\"ProjectID\",
    \"c\".\"Context\" ,
    \"c\".\"QuadratID\" ,
    \"d\".\"DepositType\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureNumber\",
    \"e\".\"FeatureGroupInterpretation\",
    \"e\".\"FeatureGroup\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSPhase\",
    \"i\".\"ArtifactID\",
    \"i\".\"Quantity\",
    \"j\".\"BuckleType\",
    \"k\".\"BuckleCompleteness\",
    \"l\".\"FramePlating\",
    \"i\".\"Marks\",
    \"t\".\"YesNo\", --Note that this is the Burned field. The sql needs the group by to be the alias and the YesNo field, not \"Burned\"
    \"i\".\"Conservation\",
    \"u\".\"YesNo\", --Note that this is the Mended field. The sql needs the group by to be the alias and the YesNo field, not \"Mended\"
    \"s\".\"YesNo\", --Note that this is the PMM field. The sql needs the group by to be the alias and the YesNo field, not \"PMM\"
    \"i\".\"Notes\",
    \"aa\".\"ObjectID\",
    a.\"Published\"



    ORDER BY
    \"ProjectName\" ASC,
    \"ArtifactID\" ASC,
    \"BuckleType\" ASC"
    
  end
  
  def aq_three_button_concat(query)
    "--File Name: AQ3_Buttons_ConcatenatedView_DAACS_Done
    --Created by: Jillian Galle
    --Last Updated: 9 March 2015 by jeg
    --Artifact Query 3 Buttons: This file returns concatenated data for buttons for the DAACS Website and concatenated downloads.


    --Step 1: Users select One or All Button Attributes.  The data always returned for this query are the following, in addition to any other Button Fields selected by User. 
    SELECT
    \"b\".\"ProjectName\" as \"ProjectName\",--always return this field
    \"c\".\"ProjectID\" as \"ProjectID\",--always return this field
    \"c\".\"Context\" as \"Context\",--always return this field
    \"c\".\"QuadratID\" as \"QuadratID\",
    \"d\".\"DepositType\" as \"DepositType\",
    \"f\".\"FeatureType\" as \"FeatureType\",
    \"e\".\"FeatureNumber\" as \"FeatureNumber\",--always return this field
    \"e\".\"FeatureGroup\" as \"FeatureGroup\",--always return this field
    \"c\".\"DAACSStratigraphicGroup\" as \"DAACSStratigraphicGroup\",--always return this field
    \"c\".\"DAACSPhase\" as \"DAACSPhase\",--always return this field
    \"i\".\"ArtifactID\" as \"ArtifactID\",--always return this field
    \"i\".\"Quantity\" as \"Count\",--always return this field
    \"j\".\"Completeness\",
    \"q\".\"ButtonMaterial\" AS \"Material\",
    \"k\".\"ButtonManuTech\" AS \"ManufacturingTechnique\",
    \"n\".\"ButtonType\" AS \"ButtonType\",
    \"o\".\"ButtonShape\" AS \"ButtonShape\",
    \"ab\".\"BasicColor\" AS \"NonMetalButtonColor\",
    \"aa\".\"ButtonMetalColor\" AS \"MetalButtonColor\",
    \"x\".\"Eye\" as \"ButtonEye\",
    \"y\".\"ShankMaterial\" AS \"ShankMaterial\",
    \"r\".\"ShankStyle\" AS \"ShankStyle\",
    \"z\".\"ShankCondition\" AS \"ShankCondition\",
    \"p\".\"ButtonMaterial\" AS \"2PieceButton:FaceMaterial\",
    \"l\".\"ButtonManuTech\" AS \"2PieceButton:FaceManufacturingTechnique\",
    \"m\".\"ButtonJoinMethod\" AS \"2PieceButton:JoinMethod\",
    \"w\".\"YesNoID\" AS \"Decoration?\",
    string_agg(COALESCE(\"ae\".\"ButtonDecoration\")||', '||COALESCE(\"ag\".\"BasicColor\")||', '||COALESCE(\"af\".\"JewelInlayMaterial\")
    ||', '||COALESCE(\"ad\". \"DecorativeMotif\"), '; ') AS \"ButtonDecoration\",
    \"i\".\"Length\",
    \"i\".\"Width\",
    \"i\".\"Diameter\",
    \"i\".\"Height\",
    \"i\".\"Weight\",
    \"u\".\"YesNoID\" AS \"Post-Manufacturing Modification\",
    \"v\".\"YesNoID\" AS \"Burned\",
    \"i\".\"Conservation\",
    \"i\".\"BackStamp\" AS \"Back Stamp\",
    \"i\".\"Notes\",
    string_agg(\"t\".\"ImageFileLocation\", '; ') AS \"Images\",
    \"ac\".\"ObjectID\",
    a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    left join	\"public\".\"tblContext\" AS \"c\" on	\"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextDepositType\" AS \"d\" on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS \"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    inner join \"public\".\"tblButton\" AS \"i\" on \"h\".\"ArtifactID\" = \"i\".\"ArtifactID\"
    LEFT JOIN \"public\".\"tblCompleteness\" AS \"j\" ON \"i\".\"CompletenessID\" = \"j\".\"CompletenessID\"
    LEFT JOIN \"public\".\"tblButtonManuTech\" AS \"k\" ON \"i\".\"ButtonManuTechID\" = \"k\".\"ButtonManuTechID\"
    LEFT JOIN \"public\".\"tblButtonManuTech\" AS \"l\" ON \"i\".\"ButtonFaceManuTechID\" = \"l\".\"ButtonManuTechID\"
    LEFT JOIN \"public\".\"tblButtonJoinMethod\" AS \"m\" ON \"i\".\"ButtonJoinMethodID\" = \"m\".\"ButtonJoinMethodID\"
    LEFT JOIN \"public\".\"tblButtonType\" AS \"n\" ON \"i\".\"ButtonTypeID\" = \"n\".\"ButtonTypeID\"
    LEFT JOIN \"public\".\"tblButtonShape\" AS \"o\" ON \"i\".\"ButtonShapeID\" = \"o\".\"ButtonShapeID\"
    LEFT JOIN \"public\".\"tblButtonMaterial\" AS \"p\" ON \"i\".\"ButtonFaceMaterialID\" = \"p\".\"ButtonMaterialID\"
    LEFT JOIN \"public\".\"tblButtonMaterial\" AS \"q\" ON \"i\".\"ButtonMaterialID\" = \"q\".\"ButtonMaterialID\"
    LEFT JOIN \"public\".\"tblButtonShankStyle\" AS \"r\" ON \"i\".\"ShankStyleID\" = \"r\".\"ShankStyleID\"
    left join \"public\".\"tblArtifactImage\"	AS \"s\" on	\"i\".\"ArtifactID\" = \"s\".\"ArtifactID\" 
    left join \"public\".\"tblImage\" AS \"t\" on \"s\".\"ImageID\" = \"t\".\"ImageID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"u\" ON \"i\".\"PMM\" = \"u\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"v\" ON \"i\".\"Burned\" = \"v\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"w\" ON \"i\".\"DecorationYN\" = \"w\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblButtonEye\" AS \"x\" ON \"i\".\"EyeID\" = \"x\".\"EyeID\"
    LEFT JOIN \"public\".\"tblButtonShankMaterial\" AS \"y\" ON \"i\".\"ShankMaterialID\" = \"y\".\"ShankMaterialID\"
    LEFT JOIN \"public\".\"tblButtonShankCondition\" AS \"z\" ON \"i\".\"ShankConditionID\" = \"z\".\"ShankConditionID\"
    LEFT JOIN \"public\".\"tblButtonMetalColor\" AS \"aa\" ON \"i\".\"ButtonMetalColorID\" = \"aa\".\"ButtonMetalColorID\"
    LEFT JOIN \"public\".\"tblBasicColor\" AS \"ab\" ON \"i\".\"ButtonBasicColorID\" = \"ab\".\"BasicColorID\"
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"ac\" on \"i\".\"GenerateContextArtifactID\" = \"ac\".\"GenerateContextArtifactID\" 
    LEFT JOIN \"public\".\"tblButtonDecTech\" AS \"ad\" on \"i\".\"GenerateContextArtifactID\" = \"ad\".\"GenerateContextArtifactID\" 
    LEFT JOIN \"public\".\"tblButtonDecoration\" AS \"ae\" on \"ad\".\"ButtonDecorationID\" = \"ae\".\"ButtonDecorationID\" 
    LEFT JOIN \"public\".\"tblButtonJewelInlayMaterial\" AS \"af\" on \"ad\".\"JewelInlayMaterialID\" = \"af\".\"JewelInlayMaterialID\" 
    LEFT JOIN \"public\".\"tblBasicColor\" AS \"ag\" ON \"ad\".\"ButtonDecTechBasicColorID\" = \"ag\".\"BasicColorID\"


    #{query}

    GROUP BY
    \"b\".\"ProjectName\",
    \"c\".\"ProjectID\",
    \"c\".\"Context\",
    \"c\".\"QuadratID\",
    \"d\".\"DepositType\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureNumber\",
    \"e\".\"FeatureGroup\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSPhase\",
    \"i\".\"ArtifactID\",
    \"i\".\"Quantity\",
    \"j\".\"Completeness\",
    \"q\".\"ButtonMaterial\",
    \"k\".\"ButtonManuTech\",
    \"n\".\"ButtonType\",
    \"o\".\"ButtonShape\",
    \"ab\".\"BasicColor\",
    \"aa\".\"ButtonMetalColor\",
    \"x\".\"Eye\",
    \"y\".\"ShankMaterial\",
    \"r\".\"ShankStyle\",
    \"z\".\"ShankCondition\",
    \"p\".\"ButtonMaterial\",
    \"l\".\"ButtonManuTech\",
    \"m\".\"ButtonJoinMethod\",
    \"w\".\"YesNoID\", --Note that this is the Dec Y/N field. The sql needs the group by to be the alias and the YesNo field, not \"Decoration?\"
    \"i\".\"Length\",
    \"i\".\"Width\",
    \"i\".\"Diameter\",
    \"i\".\"Height\",
    \"i\".\"Weight\",
    \"u\".\"YesNoID\", --Note that this is the PMM field. The sql needs the group by to be the alias and the YesNo field, not \"PMM\"
    \"v\".\"YesNoID\", --Note that this is the Burned field. The sql needs the group by to be the alias and the YesNo field, not \"Burned\"
    \"i\".\"Conservation\",
    \"i\".\"BackStamp\",
    \"i\".\"Notes\",
    \"ac\".\"ObjectID\",
    a.\"Published\"

    Order by 	
    \"b\".\"ProjectName\",
    \"q\".\"ButtonMaterial\",
    \"n\".\"ButtonType\", 
    \"o\".\"ButtonShape\",
    \"k\".\"ButtonManuTech\""
    
  end
  
  def aq_three_button_related(query)
    "--File Name: AQ3_Buttons_RelatedView_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 6 March 2015 by jeg
    --Artifact Query 3 Buttons: This file returns related data for buttons for the DAACS Website.


    --Step 1: Users select One or All Button Attributes.  The data always returned for this query are the following, in addition to any other Button Fields selected by User. 
    SELECT
    \"b\".\"ProjectName\" as \"ProjectName\",--always return this field
    \"c\".\"ProjectID\" as \"ProjectID\",--always return this field
    \"c\".\"Context\" as \"Context\",--always return this field
    \"c\".\"QuadratID\" as \"QuadratID\",
    \"d\".\"DepositType\" as \"DepositType\",
    \"f\".\"FeatureType\" as \"FeatureType\",
    \"e\".\"FeatureNumber\" as \"FeatureNumber\",--always return this field
    \"e\".\"FeatureGroup\" as \"FeatureGroup\",--always return this field
    \"c\".\"DAACSStratigraphicGroup\" as \"DAACSStratigraphicGroup\",--always return this field
    \"c\".\"DAACSPhase\" as \"DAACSPhase\",--always return this field
    \"i\".\"ArtifactID\" as \"ArtifactID\",--always return this field
    \"i\".\"Quantity\" as \"Count\",--always return this field
    \"j\".\"Completeness\",
    \"q\".\"ButtonMaterial\" AS \"Material\",
    \"k\".\"ButtonManuTech\" AS \"ManufacturingTechnique\",
    \"n\".\"ButtonType\" AS \"ButtonType\",
    \"o\".\"ButtonShape\" AS \"ButtonShape\",
    \"ab\".\"BasicColor\" AS \"NonMetalButtonColor\",
    \"aa\".\"ButtonMetalColor\" AS \"MetalButtonColor\",
    \"x\".\"Eye\" as \"ButtonEye\",
    \"y\".\"ShankMaterial\" AS \"ShankMaterial\",
    \"r\".\"ShankStyle\" AS \"ShankStyle\",
    \"z\".\"ShankCondition\" AS \"ShankCondition\",
    \"p\".\"ButtonMaterial\" AS \"2PieceButton:FaceMaterial\",
    \"l\".\"ButtonManuTech\" AS \"2PieceButton:FaceManufacturingTechnique\",
    \"m\".\"ButtonJoinMethod\" AS \"2PieceButton:JoinMethod\",
    \"w\".\"YesNoID\" AS \"Decoration?\",
    \"ae\".\"ButtonDecoration\" as \"DecTechType\", 
    \"ag\".\"BasicColor\" as \"AppliedColor\",
    \"af\".\"JewelInlayMaterial\" as \"JewelInlayMaterial\",
    \"ad\". \"DecorativeMotif\" AS \"DecorativeMotif\",
    \"i\".\"BackStamp\" AS \"Back Stamp\",
    \"i\".\"Length\",
    \"i\".\"Width\",
    \"i\".\"Diameter\",
    \"i\".\"Height\",
    \"i\".\"Weight\",
    \"u\".\"YesNoID\" AS \"Post-Manufacturing Modification\",
    \"v\".\"YesNoID\" AS \"Burned\",
    \"i\".\"Conservation\",
    \"i\".\"Notes\",
    \"t\".\"ImageFileLocation\" AS \"Images\",
    \"ac\".\"ObjectID\",
    a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    left join	\"public\".\"tblContext\" AS \"c\" on	\"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextDepositType\" AS \"d\" on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS \"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    inner join \"public\".\"tblButton\" AS \"i\" on \"h\".\"ArtifactID\" = \"i\".\"ArtifactID\"
    LEFT JOIN \"public\".\"tblCompleteness\" AS \"j\" ON \"i\".\"CompletenessID\" = \"j\".\"CompletenessID\"
    LEFT JOIN \"public\".\"tblButtonManuTech\" AS \"k\" ON \"i\".\"ButtonManuTechID\" = \"k\".\"ButtonManuTechID\"
    LEFT JOIN \"public\".\"tblButtonManuTech\" AS \"l\" ON \"i\".\"ButtonFaceManuTechID\" = \"l\".\"ButtonManuTechID\"
    LEFT JOIN \"public\".\"tblButtonJoinMethod\" AS \"m\" ON \"i\".\"ButtonJoinMethodID\" = \"m\".\"ButtonJoinMethodID\"
    LEFT JOIN \"public\".\"tblButtonType\" AS \"n\" ON \"i\".\"ButtonTypeID\" = \"n\".\"ButtonTypeID\"
    LEFT JOIN \"public\".\"tblButtonShape\" AS \"o\" ON \"i\".\"ButtonShapeID\" = \"o\".\"ButtonShapeID\"
    LEFT JOIN \"public\".\"tblButtonMaterial\" AS \"p\" ON \"i\".\"ButtonFaceMaterialID\" = \"p\".\"ButtonMaterialID\"
    LEFT JOIN \"public\".\"tblButtonMaterial\" AS \"q\" ON \"i\".\"ButtonMaterialID\" = \"q\".\"ButtonMaterialID\"
    LEFT JOIN \"public\".\"tblButtonShankStyle\" AS \"r\" ON \"i\".\"ShankStyleID\" = \"r\".\"ShankStyleID\"
    left join \"public\".\"tblArtifactImage\"	AS \"s\" on	\"i\".\"ArtifactID\" = \"s\".\"ArtifactID\" 
    left join \"public\".\"tblImage\" AS \"t\" on \"s\".\"ImageID\" = \"t\".\"ImageID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"u\" ON \"i\".\"PMM\" = \"u\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"v\" ON \"i\".\"Burned\" = \"v\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"w\" ON \"i\".\"DecorationYN\" = \"w\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblButtonEye\" AS \"x\" ON \"i\".\"EyeID\" = \"x\".\"EyeID\"
    LEFT JOIN \"public\".\"tblButtonShankMaterial\" AS \"y\" ON \"i\".\"ShankMaterialID\" = \"y\".\"ShankMaterialID\"
    LEFT JOIN \"public\".\"tblButtonShankCondition\" AS \"z\" ON \"i\".\"ShankConditionID\" = \"z\".\"ShankConditionID\"
    LEFT JOIN \"public\".\"tblButtonMetalColor\" AS \"aa\" ON \"i\".\"ButtonMetalColorID\" = \"aa\".\"ButtonMetalColorID\"
    LEFT JOIN \"public\".\"tblBasicColor\" AS \"ab\" ON \"i\".\"ButtonBasicColorID\" = \"ab\".\"BasicColorID\"
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"ac\" on \"i\".\"GenerateContextArtifactID\" = \"ac\".\"GenerateContextArtifactID\" 
    LEFT JOIN \"public\".\"tblButtonDecTech\" AS \"ad\" on \"i\".\"GenerateContextArtifactID\" = \"ad\".\"GenerateContextArtifactID\" 
    LEFT JOIN \"public\".\"tblButtonDecoration\" AS \"ae\" on \"ad\".\"ButtonDecorationID\" = \"ae\".\"ButtonDecorationID\" 
    LEFT JOIN \"public\".\"tblButtonJewelInlayMaterial\" AS \"af\" on \"ad\".\"JewelInlayMaterialID\" = \"af\".\"JewelInlayMaterialID\" 
    LEFT JOIN \"public\".\"tblBasicColor\" AS \"ag\" on \"ad\".\"ButtonDecTechBasicColorID\" = \"ag\".\"BasicColorID\" 

    #{query}

    Order by 	
    \"b\".\"ProjectName\",
    \"q\".\"ButtonMaterial\",
    \"n\".\"ButtonType\", 
    \"o\".\"ButtonShape\",
    \"k\".\"ButtonManuTech\" "
    
  end
  
  def aq_three_ceramic_related(query)
    "--File Name: AQ3_Ceramics_RelatedView_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 11 March 2015 by jeg
    --Artifact Query 3 Ceramics: This file returns related data for ceramics for the DRC Website and downloads.


    --Step 1: Users select One or All ceramic Attributes.  The data always returned for this query are the following, in addition to any other ceramic Fields selected by User. 

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
    \"o\".\"InteriorExterior\" as \"StyElementIntExt\",
    \"p\".\"CeramicDecTechLocation\" as \"StyElementLocation\",
    \"ah\".\"CeramicDecTechTypeID\" as \"DecorativeTechniqueType\",
    \"r\".\"AppliedColorWrittenDescription\" as \"StyElementDecColor\",
    \"q\".\"CeramicDecTechStyElem\" as \"StylisticElement\",
    \"pa\".\"CeramicDecTechMotif\" as \"StyElementMotif\",
    \"nn\".\"PatternName\" as \"PatternName\",
    \"nn\".\"PatternReferences\" AS \"PatternReference\",
    --end Decoration section
    \"cc\".\"EvidenceofBurning\" as \"Burned\",
    \"dd\".\"YesNo\" as \"PostManufacturingModification\",
    \"tt\".\"UseWearLocation\" as \"UseWearLocation\",
    \"sa\".\"CeramicCompleteness\" as \"UseWearCompleteness\",
    \"uu\".\"UseWearPattern\" as \"UseWearPattern\",
    \"oo\".\"BaseMark\" as \"BaseMark\",
    \"pp\".\"BasicColor\" as \"Base MarkColor\",
    \"i\".\"BaseMarkReference\" as \"BaseMarkReference\",
    --begin cew section
    \"af\".\"AppliedColorWrittenDescription\" as \"PasteColor\",
    \"bb\".\"OxidizedVersusReduced\" as \"OxidizedVsReduced\",
    \"aaa\".\"CeramicCEWType\" as \"CoarseEarthenwareType\",
    \"ab\".\"CeramicCEWDecMode\" as \"CoarseEarthenwareDecorativeMode\",
    \"ii\".\"RimForm\" as \"Colonoware RimForm\",
    \"jj\".\"RimAngle\" as \"Colonoware RimAngle\",
    \"i\".\"MaxRimWidth\" as \"Maximum RimWidth\",
    \"ac\".\"CeramicCEWBaseForm\" as \"Coarse EarthenwareBaseForm\",
    \"ad\".\"CeramicCEWFootringForm\" as \"CoarseEarthenwareFootringForm\",
    \"ae\". \"PasteInclusionDensity\" as \"CoarseEarthenwarePasteInclusionDensity\",
    \"rr\".\"PasteInclusion\" as \"PasteInclusions\",
    \"ff\".\"CeramicCompleteness\" as \"ColonoCompleteness\",
    \"ee\".\"ColonoSherdThickness\" as \"ColonoSherdThickness\",
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
    \"mm\".\"ImageFileLocation\"as \"Images\",
    \"ag\".\"MendsToArtifactID\" as \"ArtifactsMendedTo\",
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

#{query}


    ORDER BY
    \"i\".\"ArtifactID\",
    \"l\".\"Ware\",
    \"u\".\"CeramicForm\",
    \"s\".\"CeramicGenre\""

    
  end
  
  def aq_three_ceramic_concat(query)
    "--File Name: AQ3_Ceramics_ConcatenatedView_DRC_Done
    --Created by: Beth Bollwerk
    --Last Updated: 11 March 2015 by jeg
    --Artifact Query 3 Ceramics: This file returns concatenated data for ceramics for the DRC Website and concatenated downloads.

    --Step 1: Users select One or All ceramic Attributes.  The data always returned for this query are the following, in addition to any other ceramic Fields selected by User. 
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

    #{query}

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
    \"s\".\"CeramicGenre\""

    
  end
  
  def aq_three_glass_concat(query)
    "--File Name: AQ3_Glass_ConcatenatedView_DRC_Done
    --Created by: Beth Bollwerk
    --Last Updated: 11 March 2015 by jeg
    --Artifact Query 3 Glass: This file returns concatenated data for glass for the DRC Website and downloads.


    --Step 1: Users select One or All Glass Attributes.  The data always returned for this query are the following, in addition to any other glass Fields selected by User. 
    SELECT
    \"b\".\"ProjectName\" as \"ProjectName\",
    \"c\".\"ProjectID\" as \"ProjectID\",
    \"c\".\"Context\" as \"Context\",
    \"c\".\"QuadratID\" as \"QuadratID\",
    \"d\".\"DepositType\" as \"DepositType\",
    \"f\".\"FeatureType\" as \"FeatureType\",
    \"e\".\"FeatureNumber\" as \"FeatureNumber\",
    \"e\".\"FeatureGroup\" as \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" as \"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\" as \"StratigraphicGroup\",
    \"c\".\"DAACSPhase\" as \"DAACSPhase\",
    \"i\".\"ArtifactID\" as \"ArtifactID\",
    \"i\".\"Quantity\" as \"Count\",
    \"j\".\"GlassMaterial\" as \"Material\",
    \"k\".\"BasicColor\" as \"Color\",
    \"l\".\"GlassVesselCategory\" as \"VesselCategory\",
    \"m\".\"GlassForm\" as \"Form\",
    \"n\".\"GlassCompleteness\" as \"Completeness\",
    \"o\".\"GlassManuTech\" as \"ManufacturingTechnique\",
    \"p\".\"MoldType\" as \"MoldType\",
    string_agg(distinct COALESCE(\"r\".\"GlassBottleElement\")||', '||COALESCE(\"pl\".\"GlassBottleShape\")||', '||COALESCE(\"pm\".\"GlassBottleManuTech\"), '; ') as \"BottleInformation\",
    \"bb\".\"YesNo\" as \"Decoration\",
    string_agg(distinct COALESCE(\"u\".\"GlassDecTechType\")||', '||COALESCE(\"v\".\"BasicColor\")||', '||COALESCE(\"w\".\"GlassDecTechStyElem\"), '; ') as \"DecorationInformation\",
    string_agg(distinct COALESCE(\"z\".\"Mark\")||', '||COALESCE(\"aa\".\"GlassMarkLocation\"), '; ') as \"MarkInformation\",
    \"pa\".\"YesNo\" as \"PostManufacturingModification\",
    \"pb\".\"YesNo\" as \"Mended\",
    \"pc\".\"PontilMark\",
    \"i\".\"TotalContainerHeight\" as \"TotalContainerHeight\",
    \"pd\".\"StemwareBodyShape\" as \"StemwareBodyShape\",
    \"pe\".\"StemwareFootShape\" as \"StemwareFootShape\",
    \"pf\".\"StemShape\" as \"StemShape\",
    \"i\".\"StemLength\" as \"StemLength\",
    \"pi\".\"YesNo\" as \"Burned\",
    \"pj\".\"YesNo\" as \"Patination\",
    \"pk\".\"YesNo\" as \"Solarized\",
    \"i\".\"SherdSize\",
    \"i\".\"SherdThickness\",
    \"i\".\"SherdWeight\",
    \"i\".\"MendedSherdWeight\",
    \"i\".\"LengthofRim\",
    \"i\".\"RimDiameter\",
    \"i\".\"MendedRimDiameter\",
    \"i\".\"BaseDiameter\",
    \"i\".\"BaseLength\",
    \"i\".\"MendedBaseDiameter\",
    \"i\".\"Conservation\",
    string_agg(COALESCE(\"y\".\"ImageFileLocation\"), ';') AS \"Images\",
    string_agg(COALESCE(\"dd\".\"MendsToArtifactID\"),'; ') as \"ArtifactsMendedTo\",
    \"cc\".\"ObjectID\",
    \"i\".\"Notes\",
    a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    left join \"public\".\"tblContextDepositType\" AS \"d\"	on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" =\"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    inner join \"public\".\"tblGlass\" AS \"i\" on \"h\".\"ArtifactID\" = \"i\".\"ArtifactID\"
    LEFT JOIN \"public\".\"tblGlassMaterial\" AS \"j\" ON \"i\".\"GlassMaterialID\" = \"j\".\"GlassMaterialID\"
    LEFT JOIN \"public\".\"tblBasicColor\" AS \"k\" ON \"i\".\"GlassBasicColorID\" = \"k\".\"BasicColorID\"
    LEFT join \"public\".\"tblGlassVesselCategory\" AS \"l\" on \"i\".\"GlassVesselCategoryID\" = \"l\".\"GlassVesselCategoryID\"
    LEFT JOIN \"public\".\"tblGlassForm\" AS \"m\" ON \"i\".\"GlassFormID\" = \"m\".\"GlassFormID\"
    LEFT join \"public\".\"tblGlassCompleteness\" AS \"n\" ON \"i\".\"GlassCompletenessID\" = \"n\".\"GlassCompletenessID\"
    LEFT JOIN \"public\".\"tblGlassManuTech\" AS \"o\" ON \"i\".\"GlassManuTechID\" = \"o\".\"GlassManuTechID\"
    LEFT JOIN \"public\".\"tblGlassMoldType\" AS \"p\" ON \"i\".\"MoldTypeID\" = \"p\".\"MoldTypeID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"pa\" on \"i\".\"PMM\" = \"pa\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"pb\" on \"i\".\"Mended\" = \"pb\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblGlassPontilMark\" AS \"pc\" on \"i\".\"PontilMarkID\" = \"pc\".\"PontilMarkID\"
    LEFT JOIN \"public\".\"tblGlassStemwareBodyShape\" as \"pd\" on \"i\".\"StemwareBodyShapeID\" = \"pd\".\"StemwareBodyShapeID\"
    LEFT JOIN \"public\".\"tblGlassStemwareFootShape\" as \"pe\" on \"i\".\"StemwareFootShapeID\" = \"pe\".\"StemwareFootShapeID\"
    LEFT JOIN \"public\".\"tblGlassStemShape\" as \"pf\" on \"i\".\"StemShapeID\" = \"pf\".\"StemShapeID\"
    LEFT JOIN \"public\".\"tblYesNo\" as \"pi\" on \"i\".\"Burned\" = \"pi\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" as \"pj\" on \"i\".\"Patination\" = \"pj\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" as \"pk\" on \"i\".\"Solarized\" = \"pk\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblGlassBottle\" AS \"q\" ON \"i\".\"ArtifactID\" = \"q\".\"ArtifactID\"
    LEFT JOIN \"public\".\"tblGlassBottleElement\" as \"r\" ON \"q\".\"GlassBottleElementID\" = \"r\".\"GlassBottleElementID\"
    LEFT JOIN \"public\".\"tblGlassBottleShape\" as \"pl\" on \"q\".\"GlassBottleShapeID\" = \"pl\".\"GlassBottleShapeID\"
    LEFT JOIN \"public\".\"tblGlassBottleManuTech\" as \"pm\" on \"q\".\"GlassBottleManuTechID\" = \"pm\".\"GlassBottleManuTechID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"s\" ON \"i\".\"DecorationYN\" = \"s\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblGlassDecTech\" AS \"t\" ON \"i\".\"ArtifactID\" = \"t\".\"ArtifactID\"
    LEFT JOIN \"public\".\"tblGlassDecTechType\" AS \"u\" ON \"t\".\"GlassDecTechTypeID\" = \"u\".\"GlassDecTypeTypeID\"
    LEFT JOIN \"public\".\"tblBasicColor\" as \"v\" ON \"t\".\"GlassDecTechBasicColorID\" = \"v\".\"BasicColorID\"
    LEFT JOIN \"public\".\"tblGlassDecTechStyElement\" as \"w\" on \"t\".\"GlassDecTechStyElemID\" = \"w\".\"GlassDecTechStyElemID\"
    left join \"public\".\"tblArtifactImage\" as \"x\" on	\"i\".\"ArtifactID\" = \"x\".\"ArtifactID\" 
    left join \"public\".\"tblImage\" as \"y\" on \"x\".\"ImageID\" = \"y\".\"ImageID\"
    LEFT JOIN \"public\".\"tblGlassMark\" as \"z\" on \"i\".\"ArtifactID\" = \"z\".\"ArtifactID\"
    LEFT JOIN \"public\".\"tblGlassMarkLocation\" as \"aa\" on \"z\".\"GlassMarkLocationID\" = \"aa\".\"GlassMarkLocationID\"
    LEFT JOIN \"public\".\"tblYesNo\" as \"bb\" on \"i\".\"DecorationYN\" = \"bb\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"cc\" on \"i\".\"GenerateContextArtifactID\" = \"cc\".\"GenerateContextArtifactID\" 
    left join \"public\".\"tblCeramicMends\" AS \"dd\" on \"i\".\"GenerateContextArtifactID\" = \"dd\".\"GenerateContextArtifactID\"

    #{query}

    GROUP BY
    \"b\".\"ProjectName\",
    \"c\".\"ProjectID\",
    \"c\".\"Context\",
    \"c\".\"QuadratID\",
    \"d\".\"DepositType\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureNumber\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSPhase\",
    \"i\".\"ArtifactID\",
    \"i\".\"Quantity\",
    \"j\".\"GlassMaterial\",
    \"k\".\"BasicColor\",
    \"l\".\"GlassVesselCategory\",
    \"m\".\"GlassForm\",
    \"n\".\"GlassCompleteness\",
    \"o\".\"GlassManuTech\",
    \"p\".\"MoldType\",
    \"bb\".\"YesNo\", --Decoration?
    \"pa\".\"YesNo\", --PMM
    \"pb\".\"YesNo\", --Mended
    \"pc\".\"PontilMark\",
    \"i\".\"TotalContainerHeight\",
    \"pd\".\"StemwareBodyShape\",
    \"pe\".\"StemwareFootShape\",
    \"pf\".\"StemShape\",
    \"i\".\"StemLength\",
    \"pi\".\"YesNo\", --Burned
    \"pj\".\"YesNo\", --Patination
    \"pk\".\"YesNo\", --Solarized
    \"i\".\"SherdSize\",
    \"i\".\"SherdThickness\",
    \"i\".\"SherdWeight\",
    \"i\".\"MendedSherdWeight\",
    \"i\".\"LengthofRim\",
    \"i\".\"RimDiameter\",
    \"i\".\"MendedRimDiameter\",
    \"i\".\"BaseDiameter\",
    \"i\".\"BaseLength\",
    \"i\".\"MendedBaseDiameter\",
    \"i\".\"Conservation\",
    \"cc\".\"ObjectID\",
    \"i\".\"Notes\",
    a.\"Published\"

    ORDER BY 
    \"b\".\"ProjectName\",
    \"m\".\"GlassForm\",
    \"o\".\"GlassManuTech\",
    \"j\".\"GlassMaterial\",
    \"k\".\"BasicColor\""
    
  end
  
  def aq_three_glass_related(query)
    "--File Name: AQ3_Glass_RelatedView_DRC_Done
    --Created by: Beth Bollwerk
    --Last Updated: 11 March 2015 by jeg
    --Artifact Query 3 Glass: This file returns related data for glass for the DRC Website and downloads.


    --Step 1: Users select One or All Glass Attributes.  The data always returned for this query are the following, in addition to any other glass Fields selected by User. 
    SELECT
    \"b\".\"ProjectName\" as \"ProjectName\",
    \"c\".\"ProjectID\" as \"ProjectID\",
    \"c\".\"Context\" as \"Context\",
    \"c\".\"QuadratID\" as \"QuadratID\",
    \"d\".\"DepositType\" as \"DepositType\",
    \"f\".\"FeatureType\" as \"FeatureType\",
    \"e\".\"FeatureNumber\" as \"FeatureNumber\",
    \"e\".\"FeatureGroup\" as \"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\" as \"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\" as \"StratigraphicGroup\",
    \"c\".\"DAACSPhase\" as \"DAACSPhase\",
    \"i\".\"ArtifactID\" as \"ArtifactID\",
    \"i\".\"Quantity\" as \"Count\",
    \"j\".\"GlassMaterial\" as \"Material\",
    \"k\".\"BasicColor\" as \"Color\",
    \"l\".\"GlassVesselCategory\" as \"VesselCategory\",
    \"m\".\"GlassForm\" as \"Form\",
    \"n\".\"GlassCompleteness\" as \"Completeness\",
    \"o\".\"GlassManuTech\" as \"ManufacturingTechnique\",
    \"p\".\"MoldType\" as \"MoldType\",
    \"r\".\"GlassBottleElement\" as \"BottleElement\",
    \"pl\".\"GlassBottleShape\" as \"BottleShape\",
    \"pm\".\"GlassBottleManuTech\" as \"BottleManutech\",
    \"bb\".\"YesNo\" as \"Decoration\",
    \"u\".\"GlassDecTechType\" as \"DecorativeTechniqueType\",
    \"v\".\"BasicColor\" as \"AppliedColor\",
    \"w\".\"GlassDecTechStyElem\" as \"StylisticElement\",
    \"z\".\"Mark\" as \"GlassMarkDescription\",
    \"aa\".\"GlassMarkLocation\" as \"GlassMarkLocation\",
    \"pa\".\"YesNo\" as \"PostManufacturingModification\",
    \"pb\".\"YesNo\" as \"Mended\",
    \"pc\".\"PontilMark\",
    \"i\".\"TotalContainerHeight\" as \"TotalContainerHeight\",
    \"pd\".\"StemwareBodyShape\" as \"StemwareBodyShape\",
    \"pe\".\"StemwareFootShape\" as \"StemwareFootShape\",
    \"pf\".\"StemShape\" as \"StemShape\",
    \"i\".\"StemLength\" as \"StemLength\",
    \"pi\".\"YesNo\" as \"Burned\",
    \"pj\".\"YesNo\" as \"Patination\",
    \"pk\".\"YesNo\" as \"Solarized\",
    \"i\".\"SherdSize\",
    \"i\".\"SherdThickness\",
    \"i\".\"SherdWeight\",
    \"i\".\"MendedSherdWeight\",
    \"i\".\"LengthofRim\",
    \"i\".\"RimDiameter\",
    \"i\".\"MendedRimDiameter\",
    \"i\".\"BaseDiameter\",
    \"i\".\"BaseLength\",
    \"i\".\"MendedBaseDiameter\",
    \"i\".\"Conservation\",
    \"y\".\"ImageFileLocation\" AS \"Images\",
    \"dd\".\"MendsToArtifactID\" as \"ArtifactsMendedTo\",
    \"cc\".\"ObjectID\",
    \"i\".\"Notes\",
    a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    left join \"public\".\"tblContextDepositType\" AS \"d\"	on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" =\"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    inner join \"public\".\"tblGlass\" AS \"i\" on \"h\".\"ArtifactID\" = \"i\".\"ArtifactID\"
    LEFT JOIN \"public\".\"tblGlassMaterial\" AS \"j\" ON \"i\".\"GlassMaterialID\" = \"j\".\"GlassMaterialID\"
    LEFT JOIN \"public\".\"tblBasicColor\" AS \"k\" ON \"i\".\"GlassBasicColorID\" = \"k\".\"BasicColorID\"
    LEFT join \"public\".\"tblGlassVesselCategory\" AS \"l\" on \"i\".\"GlassVesselCategoryID\" = \"l\".\"GlassVesselCategoryID\"
    LEFT JOIN \"public\".\"tblGlassForm\" AS \"m\" ON \"i\".\"GlassFormID\" = \"m\".\"GlassFormID\"
    LEFT join \"public\".\"tblGlassCompleteness\" AS \"n\" ON \"i\".\"GlassCompletenessID\" = \"n\".\"GlassCompletenessID\"
    LEFT JOIN \"public\".\"tblGlassManuTech\" AS \"o\" ON \"i\".\"GlassManuTechID\" = \"o\".\"GlassManuTechID\"
    LEFT JOIN \"public\".\"tblGlassMoldType\" AS \"p\" ON \"i\".\"MoldTypeID\" = \"p\".\"MoldTypeID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"pa\" on \"i\".\"PMM\" = \"pa\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"pb\" on \"i\".\"Mended\" = \"pb\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblGlassPontilMark\" AS \"pc\" on \"i\".\"PontilMarkID\" = \"pc\".\"PontilMarkID\"
    LEFT JOIN \"public\".\"tblGlassStemwareBodyShape\" as \"pd\" on \"i\".\"StemwareBodyShapeID\" = \"pd\".\"StemwareBodyShapeID\"
    LEFT JOIN \"public\".\"tblGlassStemwareFootShape\" as \"pe\" on \"i\".\"StemwareFootShapeID\" = \"pe\".\"StemwareFootShapeID\"
    LEFT JOIN \"public\".\"tblGlassStemShape\" as \"pf\" on \"i\".\"StemShapeID\" = \"pf\".\"StemShapeID\"
    LEFT JOIN \"public\".\"tblYesNo\" as \"pi\" on \"i\".\"Burned\" = \"pi\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" as \"pj\" on \"i\".\"Patination\" = \"pj\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblYesNo\" as \"pk\" on \"i\".\"Solarized\" = \"pk\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblGlassBottle\" AS \"q\" ON \"i\".\"ArtifactID\" = \"q\".\"ArtifactID\"
    LEFT JOIN \"public\".\"tblGlassBottleElement\" as \"r\" ON \"q\".\"GlassBottleElementID\" = \"r\".\"GlassBottleElementID\"
    LEFT JOIN \"public\".\"tblGlassBottleShape\" as \"pl\" on \"q\".\"GlassBottleShapeID\" = \"pl\".\"GlassBottleShapeID\"
    LEFT JOIN \"public\".\"tblGlassBottleManuTech\" as \"pm\" on \"q\".\"GlassBottleManuTechID\" = \"pm\".\"GlassBottleManuTechID\"
    LEFT JOIN \"public\".\"tblYesNo\" AS \"s\" ON \"i\".\"DecorationYN\" = \"s\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblGlassDecTech\" AS \"t\" ON \"i\".\"ArtifactID\" = \"t\".\"ArtifactID\"
    LEFT JOIN \"public\".\"tblGlassDecTechType\" AS \"u\" ON \"t\".\"GlassDecTechTypeID\" = \"u\".\"GlassDecTypeTypeID\"
    LEFT JOIN \"public\".\"tblBasicColor\" as \"v\" ON \"t\".\"GlassDecTechBasicColorID\" = \"v\".\"BasicColorID\"
    LEFT JOIN \"public\".\"tblGlassDecTechStyElement\" as \"w\" on \"t\".\"GlassDecTechStyElemID\" = \"w\".\"GlassDecTechStyElemID\"
    left join \"public\".\"tblArtifactImage\" as \"x\" on	\"i\".\"ArtifactID\" = \"x\".\"ArtifactID\" 
    left join \"public\".\"tblImage\" as \"y\" on \"x\".\"ImageID\" = \"y\".\"ImageID\"
    LEFT JOIN \"public\".\"tblGlassMark\" as \"z\" on \"i\".\"ArtifactID\" = \"z\".\"ArtifactID\"
    LEFT JOIN \"public\".\"tblGlassMarkLocation\" as \"aa\" on \"z\".\"GlassMarkLocationID\" = \"aa\".\"GlassMarkLocationID\"
    LEFT JOIN \"public\".\"tblYesNo\" as \"bb\" on \"i\".\"DecorationYN\" = \"bb\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"cc\" on \"i\".\"GenerateContextArtifactID\" = \"cc\".\"GenerateContextArtifactID\" 
    left join \"public\".\"tblCeramicMends\" AS \"dd\" on \"i\".\"GenerateContextArtifactID\" = \"dd\".\"GenerateContextArtifactID\"

    #{query}

    ORDER BY 
    \"b\".\"ProjectName\",
    \"i\".\"ArtifactID\",
    \"m\".\"GlassForm\",
    \"o\".\"GlassManuTech\",
    \"j\".\"GlassMaterial\",
    \"k\".\"BasicColor\""
    
  end
  
  def aq_three_tobacco_pipe_concat(query)
    "--File Name: AQ3_TobaccoPipe_ConcatenatedView_DRC_Done
    --Created by: Beth Bollwerk
    --Last Updated: 11 March 2015 by JEG
    --Artifact Query 3 Tob Pipe: This file returns concatenated data for tob pipes for the DRC Website and concatenated downloads.

    --Step 1: Users select One or All Tob Pipe Attributes.  The data always returned for this query are the following, in addition to any other tob pipe Fields selected by User. 

    SELECT
    \"b\".\"ProjectName\" as \"ProjectName\",--always return this field
    \"c\".\"ProjectID\" as \"ProjectID\",--always return this field
    \"c\".\"Context\" as \"Context\",--always return this field
    \"c\".\"QuadratID\" as \"QuadratID\",
    \"d\".\"DepositType\" as \"DepositType\",
    \"f\".\"FeatureType\" as \"FeatureType\",
    \"e\".\"FeatureNumber\" as \"FeatureNumber\",
    \"e\".\"FeatureGroup\" as \"FeatureGroup\",--always return this field
    \"e\".\"FeatureGroupInterpretation\" as \"FeatureGroupInterpretation\",--always return this field
    \"c\".\"DAACSStratigraphicGroup\" as \"StratigraphicGroup\",--always return this field
    \"c\".\"DAACSPhase\" as \"DAACSPhase\",--always return this field
    \"i\".\"ArtifactID\" as \"ArtifactID\",--always return this field
    \"i\".\"Quantity\" as \"Count\",--always return this field
    \"j\".\"TobaccoPipeCompleteness\" as \"Completeness\",
    \"k\".\"TobaccoPipeMaterial\" as \"Material\",
    \"l\".\"MunsellRangeAppliedColor\" as \"PasteColor\",
    \"la\".\"PasteInclusion\" as \"PasteInclusion\",
    \"m\".\"TobaccoPipeManuTech\" as \"ManuTech\",
    \"n\".\"GlazeType\" as \"Glaze\",
    \"na\".\"MunsellRangeAppliedColor\" as \"GlazeColor\",
    \"gg\".\"YesNo\" as \"Decoration?\",
    string_agg(distinct COALESCE (\"x\".\"TobaccoPipeDecMotif\")||', '||COALESCE(\"y\".\"MotifTextLocation\")||', '||
    COALESCE(\"z\".\"MotifManuTech\")||', '||COALESCE(\"w\".\"Notes\"), '; ') as \"Decoration\",
    \"hh\".\"YesNo\" as \"TextMark?\",
    string_agg(distinct COALESCE(\"bb\".\"TextMarkType\")||', '||COALESCE(\"cc\".\"MotifTextLocation\")||', '||COALESCE(\"dd\".\"PipeTextFrameMotif\")||', '
    ||COALESCE(\"aa\".\"FirstName\")||', '||COALESCE(\"aa\".\"LastName\")||', '||COALESCE(\"aa\".\"PlaceName\")||', '||COALESCE(\"aa\".\"SloganOther\")||', '||COALESCE(\"aa\".\"MarkNotes\"), '; ') as \"TextMark\",
    \"i\".\"PipeMaker\" as \"PipeMaker\",
    \"i\".\"ProductionDates\" as \"ProductionDates\",
    \"i\".\"ManufactureLocation\" as \"ManufactureLocation\",
    \"i\".\"CompleteMarkDescription\",
    \"s\".\"YesNo\" as \"Post ManufacturingModification\",
    \"o\".\"BowlForm\" as \"BowlForm\",
    \"p\".\"BowlBaseType\" as \"BaseType\",
    \"q\".\"MouthpieceForm\" as \"MouthpieceForm\",
    \"i\".\"MaximumSherdMeasurement\" as \"MaximumSherdMeasurement\",
    \"i\".\"StemLength\",
    \"i\".\"ExteriorStemDiameter\",
    \"i\".\"BoreDiameter64ths\",
    \"i\".\"MetricBoreDiameter\",
    \"i\".\"BowlHeight\",
    \"i\".\"BowlVolume\",
    \"i\".\"MaximumBowlDiameter\",
    \"i\".\"BowlRimDiameter\",
    \"i\".\"Weight\",
    \"i\".\"Conservation\",		
    string_agg(\"ff\".\"ImageFileLocation\", ';') AS \"Images\",
    \"ii\".\"ObjectID\",
    \"i\".\"Notes\",
    a.\"Published\"


    FROM 
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join	\"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextDepositType\" AS \"d\"	on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" =\"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    inner join \"public\".\"tblTobaccoPipe\" AS \"i\" on \"h\".\"ArtifactID\" = \"i\".\"ArtifactID\"
    left join \"public\".\"tblTobaccoPipeCompleteness\" AS \"j\" on	\"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"
    left join \"public\".\"tblTobaccoPipeMaterial\" AS \"k\" on	\"i\".\"TobaccoPipeMaterialID\" = \"k\".\"TobaccoPipeMaterialID\"
    left join \"public\".\"tblMunsellAppliedColor\" AS \"l\" on	\"i\".\"PasteMunAppColorID\" = \"l\".\"MunAppColorID\"
    left join \"public\".\"tblPasteInclusion\" as \"la\" on \"i\".\"PasteInclusionID\" = \"la\".\"PasteInclusionID\"
    left join \"public\".\"tblTobaccoPipeManuTech\" AS \"m\" on	\"i\".\"TobaccoPipeManuTechID\" = \"m\".\"TobaccoPipeManuTechID\"
    left join \"public\".\"tblTobaccoPipeGlazeType\" AS \"n\" on \"i\".\"GlazeTypeID\" = \"n\".\"GlazeTypeID\"
    left join \"public\".\"tblMunsellAppliedColor\" AS \"na\" on	\"i\".\"PasteMunAppColorID\" = \"na\".\"MunAppColorID\"
    left join \"public\".\"tblTobaccoPipeBowlForm\" AS \"o\" on  \"i\".\"BowlFormID\" = \"o\".\"BowlFormID\"
    left join \"public\".\"tblTobaccoPipeBowlBaseType\" AS \"p\" on \"i\".\"BowlBaseTypeID\" = \"p\".\"BowlBaseTypeID\"
    left join \"public\".\"tblTobaccoPipeMouthpieceForm\" AS \"q\" on \"i\".\"MouthpieceFormID\" = \"q\".\"MouthpieceFormID\" 
    left join \"public\".\"tblYesNo\"	AS \"s\" on \"i\".\"PMM\" = \"s\".\"YesNoID\"
    left join \"public\".\"tblArtifactImage\" as \"ee\" on	\"i\".\"ArtifactID\" = \"ee\".\"ArtifactID\" 
    left join \"public\".\"tblImage\" as \"ff\" on \"ee\".\"ImageID\" = \"ff\".\"ImageID\"
    left join \"public\".\"tblTobaccoPipeDecoration\"	AS \"w\"	on \"i\".\"ArtifactID\" = \"w\".\"ArtifactID\"
    left join \"public\".\"tblTobaccoPipeDecMotif\"	AS \"x\" on	\"w\".\"TobaccoPipeDecMotifID\" = \"x\".\"TobaccoPipeDecMotifID\"
    left join \"public\".\"tblTobaccoPipeMotifTextLocation\" AS	\"y\" on \"w\".\"MotifTextLocationID\" = \"y\".\"MotifTextLocationID\"
    left join \"public\".\"tblTobaccoPipeMotifManuTech\" AS	\"z\"	on \"w\".\"TobaccoPipeMotifManuTechID\" = \"z\".\"MotifManuTechID\"
    left join \"public\".\"tblTobaccoPipeTextMark\" AS \"aa\" on \"i\".\"ArtifactID\" = \"aa\".\"ArtifactID\"
    left join \"public\".\"tblTobaccoPipeTextMarkType\" AS \"bb\" on \"aa\".\"TextMarkTypeID\" = \"bb\".\"TextMarkTypeID\"
    left join \"public\".\"tblTobaccoPipeMotifTextLocation\" AS	\"cc\" on \"aa\".\"MotifTextLocationID\" = \"cc\".\"MotifTextLocationID\"
    left join \"public\".\"tblTobaccoPipeTextFrameMotif\"	AS \"dd\"	on \"aa\".\"PipeTextFrameMotifID\" = \"dd\".\"PipeTextFrameMotifID\"
    left join \"public\".\"tblYesNo\"	AS \"gg\" on \"i\".\"DecorationYN\" = \"gg\".\"YesNoID\"
    left join \"public\".\"tblYesNo\"	AS \"hh\" on \"i\".\"TextMarkYN\" = \"hh\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"ii\" on \"i\".\"GenerateContextArtifactID\" = \"ii\".\"GenerateContextArtifactID\" 

    #{query}

    GROUP BY
    \"b\".\"ProjectName\",
    \"c\".\"ProjectID\",
    \"c\".\"Context\",
    \"c\".\"QuadratID\",
    \"d\".\"DepositType\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureNumber\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSPhase\",
    \"i\".\"ArtifactID\",
    \"i\".\"Quantity\",
    \"j\".\"TobaccoPipeCompleteness\",
    \"k\".\"TobaccoPipeMaterial\",
    \"l\".\"MunsellRangeAppliedColor\",
    \"la\".\"PasteInclusion\",
    \"m\".\"TobaccoPipeManuTech\",
    \"n\".\"GlazeType\",
    \"na\".\"MunsellRangeAppliedColor\",
    \"gg\".\"YesNo\", --Decoration?
    \"hh\".\"YesNo\",--Text Mark
    \"i\".\"PipeMaker\",
    \"i\".\"ProductionDates\",
    \"i\".\"ManufactureLocation\",
    \"i\".\"CompleteMarkDescription\",
    \"s\".\"YesNo\", --PMM
    \"o\".\"BowlForm\",
    \"p\".\"BowlBaseType\",
    \"q\".\"MouthpieceForm\",
    \"i\".\"MaximumSherdMeasurement\",
    \"i\".\"StemLength\",
    \"i\".\"ExteriorStemDiameter\",
    \"i\".\"BoreDiameter64ths\",
    \"i\".\"MetricBoreDiameter\",
    \"i\".\"BowlHeight\",
    \"i\".\"BowlVolume\",
    \"i\".\"MaximumBowlDiameter\",
    \"i\".\"BowlRimDiameter\",
    \"i\".\"Weight\",
    \"i\".\"Conservation\",		
    \"ii\".\"ObjectID\",
    \"i\".\"Notes\",
    a.\"Published\"

    order by 
    \"b\".\"ProjectName\",
    \"i\".\"ArtifactID\",
    \"k\".\"TobaccoPipeMaterial\",
    \"l\".\"MunsellRangeAppliedColor\",
    \"m\".\"TobaccoPipeManuTech\",
    \"j\".\"TobaccoPipeCompleteness\""
    
  end
  
  def aq_three_tobacco_pipe_related(query)
    "--File Name: AQ3_TobaccoPipe_RelatedView_DRC_Done
    --Created by: Beth Bollwerk
    --Last Updated: 11 March 2015 by JEG
    --Artifact Query 3 Tob Pipes: This file returns related data for tob pipes for the DRC Website and downloads.

    --Step 1: Users select One or All Tob Pipe Attributes.  The data always returned for this query are the following, in addition to any other Tob Pipe Fields selected by User. 

    SELECT
    \"b\".\"ProjectName\" as \"ProjectName\",--always return this field
    \"c\".\"ProjectID\" as \"ProjectID\",--always return this field
    \"c\".\"Context\" as \"Context\",--always return this field
    \"c\".\"QuadratID\" as \"QuadratID\",
    \"d\".\"DepositType\" as \"DepositType\",
    \"f\".\"FeatureType\" as \"FeatureType\",
    \"e\".\"FeatureNumber\" as \"FeatureNumber\",
    \"e\".\"FeatureGroup\" as \"FeatureGroup\",--always return this field
    \"e\".\"FeatureGroupInterpretation\" as \"FeatureGroupInterpretation\",--always return this field
    \"c\".\"DAACSStratigraphicGroup\" as \"StratigraphicGroup\",--always return this field
    \"c\".\"DAACSPhase\" as \"DAACSPhase\",--always return this field
    \"i\".\"ArtifactID\" as \"ArtifactID\",--always return this field
    \"i\".\"Quantity\" as \"Count\",--always return this field
    \"j\".\"TobaccoPipeCompleteness\" as \"Completeness\",
    \"k\".\"TobaccoPipeMaterial\" as \"Material\",
    \"l\".\"MunsellRangeAppliedColor\" as \"PasteColor\",
    \"la\".\"PasteInclusion\" as \"PasteInclusion\",
    \"m\".\"TobaccoPipeManuTech\" as \"ManuTech\",
    \"n\".\"GlazeType\" as \"Glaze\",
    \"na\".\"MunsellRangeAppliedColor\" as \"GlazeColor\",
    \"gg\".\"YesNo\" as \"Decoration?\",
    \"x\".\"TobaccoPipeDecMotif\" \"DecorativeMotif\",
    \"y\".\"MotifTextLocation\" as \"MotifLocation\",
    \"z\".\"MotifManuTech\" as \"MotifManuTech\",
    \"w\".\"Notes\" as \"MotifNotes\",
    \"hh\".\"YesNo\" as \"TextMark?\",
    \"bb\".\"TextMarkType\" as \"TextMarkType\",
    \"cc\".\"MotifTextLocation\" as \"TextLocation\",
    \"dd\".\"PipeTextFrameMotif\" as \"TextFrameMotif\",
    \"aa\".\"FirstName\" as \"FirstName\",
    \"aa\".\"LastName\" as \"LastName\",
    \"aa\".\"PlaceName\" as \"PlaceName\",
    \"aa\".\"SloganOther\" as \"Slogan/Other\",
    \"aa\".\"MarkNotes\" as \"MarkNotes\",
    \"i\".\"PipeMaker\" as \"PipeMaker\",
    \"i\".\"ProductionDates\" as \"ProductionDates\",
    \"i\".\"ManufactureLocation\" as \"ManufactureLocation\",
    \"i\".\"CompleteMarkDescription\",
    \"s\".\"YesNo\" as \"Post ManufacturingModification\",
    \"o\".\"BowlForm\" as \"BowlForm\",
    \"p\".\"BowlBaseType\" as \"BaseType\",
    \"q\".\"MouthpieceForm\" as \"MouthpieceForm\",
    \"i\".\"MaximumSherdMeasurement\" as \"MaximumSherdMeasurement\",
    \"i\".\"StemLength\",
    \"i\".\"ExteriorStemDiameter\",
    \"i\".\"BoreDiameter64ths\",
    \"i\".\"MetricBoreDiameter\",
    \"i\".\"BowlHeight\",
    \"i\".\"BowlVolume\",
    \"i\".\"MaximumBowlDiameter\",
    \"i\".\"BowlRimDiameter\",
    \"i\".\"Weight\",
    \"i\".\"Conservation\",		
    \"ff\".\"ImageFileLocation\" AS \"Images\",
    \"ii\".\"ObjectID\",
    \"i\".\"Notes\",
    a.\"Published\"

    FROM 
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join	\"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextDepositType\" AS \"d\"	on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" =\"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    inner join \"public\".\"tblTobaccoPipe\" AS \"i\" on \"h\".\"ArtifactID\" = \"i\".\"ArtifactID\"
    left join \"public\".\"tblTobaccoPipeCompleteness\" AS \"j\" on	\"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"
    left join \"public\".\"tblTobaccoPipeMaterial\" AS \"k\" on	\"i\".\"TobaccoPipeMaterialID\" = \"k\".\"TobaccoPipeMaterialID\"
    left join \"public\".\"tblMunsellAppliedColor\" AS \"l\" on	\"i\".\"PasteMunAppColorID\" = \"l\".\"MunAppColorID\"
    left join \"public\".\"tblPasteInclusion\" as \"la\" on \"i\".\"PasteInclusionID\" = \"la\".\"PasteInclusionID\"
    left join \"public\".\"tblTobaccoPipeManuTech\" AS \"m\" on	\"i\".\"TobaccoPipeManuTechID\" = \"m\".\"TobaccoPipeManuTechID\"
    left join \"public\".\"tblTobaccoPipeGlazeType\" AS \"n\" on \"i\".\"GlazeTypeID\" = \"n\".\"GlazeTypeID\"
    left join \"public\".\"tblMunsellAppliedColor\" AS \"na\" on	\"i\".\"PasteMunAppColorID\" = \"na\".\"MunAppColorID\"
    left join \"public\".\"tblTobaccoPipeBowlForm\" AS \"o\" on  \"i\".\"BowlFormID\" = \"o\".\"BowlFormID\"
    left join \"public\".\"tblTobaccoPipeBowlBaseType\" AS \"p\" on \"i\".\"BowlBaseTypeID\" = \"p\".\"BowlBaseTypeID\"
    left join \"public\".\"tblTobaccoPipeMouthpieceForm\" AS \"q\" on \"i\".\"MouthpieceFormID\" = \"q\".\"MouthpieceFormID\" 
    left join \"public\".\"tblYesNo\"	AS \"s\" on \"i\".\"PMM\" = \"s\".\"YesNoID\"
    left join \"public\".\"tblArtifactImage\" as \"ee\" on	\"i\".\"ArtifactID\" = \"ee\".\"ArtifactID\" 
    left join \"public\".\"tblImage\" as \"ff\" on \"ee\".\"ImageID\" = \"ff\".\"ImageID\"
    left join \"public\".\"tblTobaccoPipeDecoration\"	AS \"w\"	on \"i\".\"ArtifactID\" = \"w\".\"ArtifactID\"
    left join \"public\".\"tblTobaccoPipeDecMotif\"	AS \"x\" on	\"w\".\"TobaccoPipeDecMotifID\" = \"x\".\"TobaccoPipeDecMotifID\"
    left join \"public\".\"tblTobaccoPipeMotifTextLocation\" AS	\"y\" on \"w\".\"MotifTextLocationID\" = \"y\".\"MotifTextLocationID\"
    left join \"public\".\"tblTobaccoPipeMotifManuTech\" AS	\"z\"	on \"w\".\"TobaccoPipeMotifManuTechID\" = \"z\".\"MotifManuTechID\"
    left join \"public\".\"tblTobaccoPipeTextMark\" AS \"aa\" on \"i\".\"ArtifactID\" = \"aa\".\"ArtifactID\"
    left join \"public\".\"tblTobaccoPipeTextMarkType\" AS \"bb\" on \"aa\".\"TextMarkTypeID\" = \"bb\".\"TextMarkTypeID\"
    left join \"public\".\"tblTobaccoPipeMotifTextLocation\" AS	\"cc\" on \"aa\".\"MotifTextLocationID\" = \"cc\".\"MotifTextLocationID\"
    left join \"public\".\"tblTobaccoPipeTextFrameMotif\"	AS \"dd\"	on \"aa\".\"PipeTextFrameMotifID\" = \"dd\".\"PipeTextFrameMotifID\"
    left join \"public\".\"tblYesNo\"	AS \"gg\" on \"i\".\"DecorationYN\" = \"gg\".\"YesNoID\"
    left join \"public\".\"tblYesNo\"	AS \"hh\" on \"i\".\"TextMarkYN\" = \"hh\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"ii\" on \"i\".\"GenerateContextArtifactID\" = \"ii\".\"GenerateContextArtifactID\" 

    #{query}

    order by 
    \"b\".\"ProjectName\",
    \"i\".\"ArtifactID\",
    \"k\".\"TobaccoPipeMaterial\",
    \"l\".\"MunsellRangeAppliedColor\",
    \"m\".\"TobaccoPipeManuTech\",
    \"j\".\"TobaccoPipeCompleteness\""
    
  end
  def aq_three_bone_concat(query)
    "--File Name: AQ3_Faunal_ConcatenatedView_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 11 March 2015 by jeg
    --Artifact Query 3 Faunal: This file returns concatenated data for bones for the DRC Website and concatenated downloads.

    --Step 1: Users select One or All bone Attributes.  The data always returned for this query are the following, in addition to any other bone Fields selected by User. 
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
    \"l\".\"Reliability\" AS \"Reliability\",
    \"j\".\"English\" AS \"TaxonEnglish\",
    \"j\".\"Latin\" AS \"TaxonLatin\",
    \"j\".\"TxnOrder\" AS \"TaxonOrder\",
    \"k\".\"TaxonCategory\" AS \"TaxonCategory\",
    \"j\".\"TaxonGroupCategory\" AS \"TaxonGroupCategory\",
    \"m\".\"BodyPart\" AS \"BodyPart\",
    \"m\".\"BoneElement\" AS \"Element\",
    \"n\".\"SymmetryExpand\" AS \"Symmetry\",
    \"i\".\"NISP\" AS \"NISP\",
    \"i\".\"Weight\" AS \"BoneWeight\",
    \"o\".\"BoneLocation\" AS \"BoneLocation\",
    \"p\".\"Descriptor\" AS \"BoneDescriptor\",
    \"t\".\"BoneSizeExpand\" AS \"BoneSize\",
    \"q\".\"Fusion\" AS \"Fusion\",
    \"u\".\"SexExpand\" AS \"SexExpand\",
    \"w\".\"ChewTypeExpand\" AS \"ChewType\",
    \"x\".\"ChewLocationExpand\" AS \"ChewLocation\",
    \"ah\".\"YesNoID\" AS \"FreshBreak\",
    \"r\".\"ToothTypeExpand\" AS \"ToothType\",
    \"s\".\"ToothWear\" AS \"ToothWear\",
    \"ae\".\"YesNoID\" AS \"DiseaseTrauma\",
    \"af\".\"YesNoID\" AS \"Weathered?\",
    \"ag\".\"YesNoID\" AS \"Burned?\",
    \"v\".\"BoneConditionExpand\" AS \"BoneCondition\",
    \"i\".\"NoofCutMarks\" AS \"NumberCutMarks\",
    \"y\".\"ButcherMethodExpand\" AS \"ButcherMethod\",
    \"z\".\"ButcherLocationExpand\" AS \"ButcherLocation\",
    \"aa\".\"ButcherDirectionExpand\" AS \"ButcherDirection\",
    \"ab\".\"BoneMarkType\" AS \"CutType\",
    \"ac\".\"BoneMarkLocation\" AS \"CutLocation\",
    \"ad\".\"MarkDirection\" AS \"CutDirection\",
    \"j\".\"MtWtAd\" AS \"Meat WeightAdult\",
    \"j\".\"MtWtIm\" AS \"Meat Weight mmature\",
    \"i\".\"Comments\" AS \"Notes\",
    \"i\".\"Identifier\" AS \"Identifier\",
    \"i\".\"DateIdentified\" AS \"DateIdentified\",
    string_agg(distinct COALESCE(\"aj\".\"MeasuringDescription\")||', '||COALESCE((\"ai\".\"Measurement\")::text, 'Not Recorded')
    ||', '|| COALESCE(\"ak\".\"YesNoID\"), '; ') AS \"MeasurementAccuracy\",
    a.\"Published\"

    FROM \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextDepositType\" AS \"d\"	on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBone\" as \"i\" ON \"h\".\"GenerateContextArtifactID\" = \"i\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBoneTaxon\" as \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"
    LEFT JOIN \"public\".\"tblBoneTaxonCategory\" as \"k\" ON \"j\".\"TaxonCategoryID\" = \"k\".\"TaxonCategoryID\"
    LEFT JOIN \"public\".\"tblBoneReliability\" as \"l\"  ON \"i\".\"ReliabilityID\" = \"l\".\"ReliabilityID\"
    LEFT JOIN \"public\".\"tblBoneElement\" as \"m\" ON \"i\".\"BoneElementID\" = \"m\".\"BoneElementID\"
    LEFT JOIN \"public\".\"tblBoneSymmetry\" as \"n\" ON \"i\".\"SymmetryID\" = \"n\".\"SymmetryID\"
    LEFT JOIN \"public\".\"tblBoneLocation\" as \"o\" ON \"i\".\"BoneLocationID\" = \"o\".\"BoneLocationID\"
    LEFT JOIN \"public\".\"tblBoneDescriptor\" as \"p\" ON \"i\".\"DescriptorID\" = \"p\".\"DescriptorID\"
    LEFT JOIN \"public\".\"tblBoneFusion\" as \"q\" ON \"i\".\"FusionID\" = \"q\".\"FusionID\"
    LEFT JOIN \"public\".\"tblBoneToothType\" as \"r\" ON \"i\".\"ToothTypeID\" = \"r\".\"ToothTypeID\" 
    LEFT JOIN \"public\".\"tblBoneToothWear\" as \"s\" ON \"i\".\"ToothWearID\" = \"s\".\"ToothWearID\"
    LEFT JOIN \"public\".\"tblBoneSize\" as \"t\" ON \"i\".\"BoneSizeID\" = \"t\".\"BoneSizeID\"
    LEFT JOIN \"public\".\"tblBoneSex\" as \"u\" ON \"i\".\"SexID\" = \"u\".\"SexID\"
    LEFT JOIN \"public\".\"tblBoneCondition\" as \"v\" ON \"i\".\"BoneConditionID\" = \"v\".\"BoneConditionID\"
    LEFT JOIN \"public\".\"tblBoneChewType\" as \"w\" ON \"i\".\"ChewTypeID\" = \"w\".\"ChewTypeID\"
    LEFT JOIN \"public\".\"tblBoneChewLocation\" as \"x\" ON \"i\".\"ChewLocationID\" = \"x\".\"ChewLocationID\"
    LEFT JOIN \"public\".\"tblBoneButcherMethod\" as \"y\" ON \"i\".\"ButcherMethodID\" = \"y\".\"ButcherMethodID\"
    LEFT JOIN \"public\".\"tblBoneButcherLocation\" as \"z\" ON \"i\".\"ButcherLocationID\" = \"z\".\"ButcherLocationID\"
    LEFT JOIN \"public\".\"tblBoneButcherDirection\" as \"aa\" ON \"i\".\"ButcherDirectionID\" = \"aa\".\"ButcherDirectionID\"
    LEFT JOIN \"public\".\"tblBoneMarkType\" as \"ab\" ON \"i\".\"BoneMarkTypeID\" = \"ab\".\"BoneMarkTypeID\"
    LEFT JOIN \"public\".\"tblBoneMarkLocation\" as \"ac\" ON \"i\".\"BoneMarkLocationID\" = \"ac\".\"BoneMarkLocationID\"
    LEFT JOIN \"public\".\"tblBoneMarkDirection\" as \"ad\" ON \"i\".\"MarkDirectionID\" = \"ad\".\"MarkDirectionID\"
    LEFT JOIN \"public\".\"tblBoneYesNoProbably\" AS \"ae\" ON \"i\".\"Disease\" = \"ae\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblBoneYesNoProbably\" AS \"af\" ON \"i\".\"Weathered\" = \"af\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblBoneYesNoProbably\" AS \"ag\" ON \"i\".\"Burned\" = \"ag\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblBoneYesNoProbably\" AS \"ah\" ON \"i\".\"FreshBreak\" = \"ah\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblBoneMeasure\" as \"ai\" ON \"ai\".\"GenerateContextArtifactID\" = \"i\".\"GenerateContextArtifactID\" 
    LEFT JOIN \"public\".\"tblBoneMeasuringDescription\" as \"aj\" ON \"ai\".\"MeasuringDescriptionID\" = \"aj\".\"MeasuringDescriptionID\"
    LEFT JOIN \"public\".\"tblBoneYesNoProbably\" AS \"ak\" ON \"ai\".\"Accurate\" = \"ak\".\"YesNoID\"

    #{query}

    GROUP BY 
    \"c\".\"ProjectID\",
    \"b\".\"ProjectName\",
    \"c\".\"Context\",
    \"c\".\"QuadratID\",
    \"d\".\"DepositType\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureNumber\",
    \"e\".\"FeatureGroup\" ,
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSPhase\",
    \"i\".\"ArtifactID\",
    \"i\".\"Quantity\",
    \"l\".\"Reliability\",
    \"j\".\"English\",
    \"j\".\"Latin\",
    \"j\".\"TxnOrder\",
    \"k\".\"TaxonCategory\",
    \"j\".\"TaxonGroupCategory\",
    \"m\".\"BodyPart\",
    \"m\".\"BoneElement\",
    \"n\".\"SymmetryExpand\",
    \"i\".\"NISP\",
    \"i\".\"Weight\",
    \"o\".\"BoneLocation\",
    \"p\".\"Descriptor\",
    \"t\".\"BoneSizeExpand\",
    \"q\".\"Fusion\",
    \"u\".\"SexExpand\",
    \"w\".\"ChewTypeExpand\",
    \"x\".\"ChewLocationExpand\",
    \"ah\".\"YesNoID\",
    \"r\".\"ToothTypeExpand\",
    \"s\".\"ToothWear\",
    \"ae\".\"YesNoID\",
    \"af\".\"YesNoID\",
    \"ag\".\"YesNoID\",
    \"v\".\"BoneConditionExpand\",
    \"i\".\"NoofCutMarks\",
    \"y\".\"ButcherMethodExpand\",
    \"z\".\"ButcherLocationExpand\",
    \"aa\".\"ButcherDirectionExpand\",
    \"ab\".\"BoneMarkType\",
    \"ac\".\"BoneMarkLocation\",
    \"ad\".\"MarkDirection\",
    \"j\".\"MtWtAd\",
    \"j\".\"MtWtIm\",
    \"i\".\"Comments\",
    \"i\".\"Identifier\",
    \"i\".\"DateIdentified\",
    \"a\".\"Published\"


    ORDER BY
    \"b\".\"ProjectName\" ASC,
    \"i\".\"ArtifactID\" ASC,
    \"j\".\"English\" ASC"
    
  end
  
  def aq_three_bone_related(query)
    "--File Name: AQ3_Faunal_RelatedView_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 11 March 2015 by jeg
    --Artifact Query 3 Faunal: This file returns related data for bones for the DRC Website and concatenated downloads.

    --Step 1: Users select One or All bone Attributes.  The data always returned for this query are the following, in addition to any other bone Fields selected by User. 
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
    \"l\".\"Reliability\" AS \"Reliability\",
    \"j\".\"English\" AS \"TaxonEnglish\",
    \"j\".\"Latin\" AS \"TaxonLatin\",
    \"j\".\"TxnOrder\" AS \"TaxonOrder\",
    \"k\".\"TaxonCategory\" AS \"TaxonCategory\",
    \"j\".\"TaxonGroupCategory\" AS \"TaxonGroupCategory\",
    \"m\".\"BodyPart\" AS \"BodyPart\",
    \"m\".\"BoneElement\" AS \"Element\",
    \"n\".\"SymmetryExpand\" AS \"Symmetry\",
    \"i\".\"NISP\" AS \"NISP\",
    \"i\".\"Weight\" AS \"BoneWeight\",
    \"o\".\"BoneLocation\" AS \"BoneLocation\",
    \"p\".\"Descriptor\" AS \"BoneDescriptor\",
    \"t\".\"BoneSizeExpand\" AS \"BoneSize\",
    \"q\".\"Fusion\" AS \"Fusion\",
    \"u\".\"SexExpand\" AS \"SexExpand\",
    \"w\".\"ChewTypeExpand\" AS \"ChewType\",
    \"x\".\"ChewLocationExpand\" AS \"ChewLocation\",
    \"ah\".\"YesNoID\" AS \"FreshBreak\",
    \"r\".\"ToothTypeExpand\" AS \"ToothType\",
    \"s\".\"ToothWear\" AS \"ToothWear\",
    \"ae\".\"YesNoID\" AS \"DiseaseTrauma\",
    \"af\".\"YesNoID\" AS \"Weathered?\",
    \"ag\".\"YesNoID\" AS \"Burned?\",
    \"v\".\"BoneConditionExpand\" AS \"BoneCondition\",
    \"i\".\"NoofCutMarks\" AS \"NumberCutMarks\",
    \"y\".\"ButcherMethodExpand\" AS \"ButcherMethod\",
    \"z\".\"ButcherLocationExpand\" AS \"ButcherLocation\",
    \"aa\".\"ButcherDirectionExpand\" AS \"ButcherDirection\",
    \"ab\".\"BoneMarkType\" AS \"CutType\",
    \"ac\".\"BoneMarkLocation\" AS \"CutLocation\",
    \"ad\".\"MarkDirection\" AS \"CutDirection\",
    \"j\".\"MtWtAd\" AS \"Meat WeightAdult\",
    \"j\".\"MtWtIm\" AS \"Meat Weight mmature\",
    \"i\".\"Comments\" AS \"Notes\",
    \"i\".\"Identifier\" AS \"Identifier\",
    \"i\".\"DateIdentified\" AS \"DateIdentified\",
    string_agg(distinct COALESCE(\"aj\".\"MeasuringDescription\")||', '||COALESCE((\"ai\".\"Measurement\")::text, 'Not Recorded')
    ||', '|| COALESCE(\"ak\".\"YesNoID\"), '; ') AS \"MeasurementAccuracy\",
    a.\"Published\"

    FROM \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextDepositType\" AS \"d\"	on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBone\" as \"i\" ON \"h\".\"GenerateContextArtifactID\" = \"i\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBoneTaxon\" as \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"
    LEFT JOIN \"public\".\"tblBoneTaxonCategory\" as \"k\" ON \"j\".\"TaxonCategoryID\" = \"k\".\"TaxonCategoryID\"
    LEFT JOIN \"public\".\"tblBoneReliability\" as \"l\"  ON \"i\".\"ReliabilityID\" = \"l\".\"ReliabilityID\"
    LEFT JOIN \"public\".\"tblBoneElement\" as \"m\" ON \"i\".\"BoneElementID\" = \"m\".\"BoneElementID\"
    LEFT JOIN \"public\".\"tblBoneSymmetry\" as \"n\" ON \"i\".\"SymmetryID\" = \"n\".\"SymmetryID\"
    LEFT JOIN \"public\".\"tblBoneLocation\" as \"o\" ON \"i\".\"BoneLocationID\" = \"o\".\"BoneLocationID\"
    LEFT JOIN \"public\".\"tblBoneDescriptor\" as \"p\" ON \"i\".\"DescriptorID\" = \"p\".\"DescriptorID\"
    LEFT JOIN \"public\".\"tblBoneFusion\" as \"q\" ON \"i\".\"FusionID\" = \"q\".\"FusionID\"
    LEFT JOIN \"public\".\"tblBoneToothType\" as \"r\" ON \"i\".\"ToothTypeID\" = \"r\".\"ToothTypeID\" 
    LEFT JOIN \"public\".\"tblBoneToothWear\" as \"s\" ON \"i\".\"ToothWearID\" = \"s\".\"ToothWearID\"
    LEFT JOIN \"public\".\"tblBoneSize\" as \"t\" ON \"i\".\"BoneSizeID\" = \"t\".\"BoneSizeID\"
    LEFT JOIN \"public\".\"tblBoneSex\" as \"u\" ON \"i\".\"SexID\" = \"u\".\"SexID\"
    LEFT JOIN \"public\".\"tblBoneCondition\" as \"v\" ON \"i\".\"BoneConditionID\" = \"v\".\"BoneConditionID\"
    LEFT JOIN \"public\".\"tblBoneChewType\" as \"w\" ON \"i\".\"ChewTypeID\" = \"w\".\"ChewTypeID\"
    LEFT JOIN \"public\".\"tblBoneChewLocation\" as \"x\" ON \"i\".\"ChewLocationID\" = \"x\".\"ChewLocationID\"
    LEFT JOIN \"public\".\"tblBoneButcherMethod\" as \"y\" ON \"i\".\"ButcherMethodID\" = \"y\".\"ButcherMethodID\"
    LEFT JOIN \"public\".\"tblBoneButcherLocation\" as \"z\" ON \"i\".\"ButcherLocationID\" = \"z\".\"ButcherLocationID\"
    LEFT JOIN \"public\".\"tblBoneButcherDirection\" as \"aa\" ON \"i\".\"ButcherDirectionID\" = \"aa\".\"ButcherDirectionID\"
    LEFT JOIN \"public\".\"tblBoneMarkType\" as \"ab\" ON \"i\".\"BoneMarkTypeID\" = \"ab\".\"BoneMarkTypeID\"
    LEFT JOIN \"public\".\"tblBoneMarkLocation\" as \"ac\" ON \"i\".\"BoneMarkLocationID\" = \"ac\".\"BoneMarkLocationID\"
    LEFT JOIN \"public\".\"tblBoneMarkDirection\" as \"ad\" ON \"i\".\"MarkDirectionID\" = \"ad\".\"MarkDirectionID\"
    LEFT JOIN \"public\".\"tblBoneYesNoProbably\" AS \"ae\" ON \"i\".\"Disease\" = \"ae\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblBoneYesNoProbably\" AS \"af\" ON \"i\".\"Weathered\" = \"af\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblBoneYesNoProbably\" AS \"ag\" ON \"i\".\"Burned\" = \"ag\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblBoneYesNoProbably\" AS \"ah\" ON \"i\".\"FreshBreak\" = \"ah\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblBoneMeasure\" as \"ai\" ON \"ai\".\"GenerateContextArtifactID\" = \"i\".\"GenerateContextArtifactID\" 
    LEFT JOIN \"public\".\"tblBoneMeasuringDescription\" as \"aj\" ON \"ai\".\"MeasuringDescriptionID\" = \"aj\".\"MeasuringDescriptionID\"
    LEFT JOIN \"public\".\"tblBoneYesNoProbably\" AS \"ak\" ON \"ai\".\"Accurate\" = \"ak\".\"YesNoID\"

    #{query}

    GROUP BY 
    \"c\".\"ProjectID\",
    \"b\".\"ProjectName\",
    \"c\".\"Context\",
    \"c\".\"QuadratID\",
    \"d\".\"DepositType\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureNumber\",
    \"e\".\"FeatureGroup\" ,
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSPhase\",
    \"i\".\"ArtifactID\",
    \"i\".\"Quantity\",
    \"l\".\"Reliability\",
    \"j\".\"English\",
    \"j\".\"Latin\",
    \"j\".\"TxnOrder\",
    \"k\".\"TaxonCategory\",
    \"j\".\"TaxonGroupCategory\",
    \"m\".\"BodyPart\",
    \"m\".\"BoneElement\",
    \"n\".\"SymmetryExpand\",
    \"i\".\"NISP\",
    \"i\".\"Weight\",
    \"o\".\"BoneLocation\",
    \"p\".\"Descriptor\",
    \"t\".\"BoneSizeExpand\",
    \"q\".\"Fusion\",
    \"u\".\"SexExpand\",
    \"w\".\"ChewTypeExpand\",
    \"x\".\"ChewLocationExpand\",
    \"ah\".\"YesNoID\",
    \"r\".\"ToothTypeExpand\",
    \"s\".\"ToothWear\",
    \"ae\".\"YesNoID\",
    \"af\".\"YesNoID\",
    \"ag\".\"YesNoID\",
    \"v\".\"BoneConditionExpand\",
    \"i\".\"NoofCutMarks\",
    \"y\".\"ButcherMethodExpand\",
    \"z\".\"ButcherLocationExpand\",
    \"aa\".\"ButcherDirectionExpand\",
    \"ab\".\"BoneMarkType\",
    \"ac\".\"BoneMarkLocation\",
    \"ad\".\"MarkDirection\",
    \"j\".\"MtWtAd\",
    \"j\".\"MtWtIm\",
    \"i\".\"Comments\",
    \"i\".\"Identifier\",
    \"i\".\"DateIdentified\",
    a.\"Published\"


    ORDER BY
    \"b\".\"ProjectName\" ASC,
    \"i\".\"ArtifactID\" ASC,
    \"j\".\"English\" ASC"
    
  end
  
  def aq_three_utensil_concat(query)
    "--File Name: AQ3_Utensils_ConcatenatedView_DRC_Done
    --Created by: Beth Bollwerk
    --Last Updated: 11 March 2015 by jeg
    --Artifact Query 3 Utensils: This file returns concatenated data for utensils for the DRC Website and downloads.


    --Step 1: Users select One or All Utensil Attributes.  The data always returned for this query are the following, in addition to any other utensil Fields selected by User. 
    SELECT
    \"b\".\"ProjectName\" as \"ProjectName\",--always return this field
    \"c\".\"ProjectID\" as \"ProjectID\",--always return this field
    \"c\".\"Context\" as \"Context\",--always return this field
    \"c\".\"QuadratID\" as \"QuadratID\",
    \"d\".\"DepositType\" as \"DepositType\",
    \"f\".\"FeatureType\" as \"FeatureType\",
    \"e\".\"FeatureNumber\" as \"FeatureNumber\",
    \"e\".\"FeatureGroup\" as \"FeatureGroup\",--always return this field
    \"e\".\"FeatureGroupInterpretation\" as \"FeatureGroupInterpretation\",--always return this field
    \"c\".\"DAACSStratigraphicGroup\" as \"StratigraphicGroup\",--always return this field
    \"c\".\"DAACSPhase\" as \"DAACSPhase\",--always return this field
    \"i\".\"ArtifactID\" as \"ArtifactID\",--always return this field
    \"i\".\"Quantity\" as \"Count\",--always return this field
    \"j\".\"Completeness\",
    \"k\".\"UtensilForm\" as \"UtensilForm\",
    \"l\".\"ForkTineCount\" as \"ForkTineCount\",
    \"q\".\"YesNo\" as \"PresenceofRatTail\",
    string_agg(distinct COALESCE(\"y\".\"UtensilPart\",' ')||', '||COALESCE(\"z\".\"UtensilShape\", ' ')||', '||COALESCE(\"aa\".\"UtensilManuTech\",' ')||', '||COALESCE(\"ab\".\"UtensilMaterial\", ' ')||', '||COALESCE((\"x\".\"PartLength\")::text, 'Not Recorded')||', '||COALESCE((\"x\".\"PartWidth\")::text, 'Not Recorded')
    ||', '||COALESCE((\"x\".\"PartHeight\")::text, 'Not Recorded'), '; ') AS \"UtensilSpecifics\",
    \"n\".\"YesNo\" as \"Decoration\",
    \"i\".\"Marks\",
    \"o\".\"UtensilPlating\" as \"UtensilPlating\",
    \"p\".\"HandleDecoration\" as \"HandleDecoration\",
    \"i\".\"ArtifactLength\" as \"ArtifactLength\",
    \"i\".\"ArtifactWidth\" as \"ArtifactWidth\",
    \"i\".\"ArtifactWeight\" as \"ArtifactWeight\",
    \"r\".\"YesNo\" as \"Burned\",
    \"s\".\"YesNo\" as \"PostManufacturingModification\",
    \"i\".\"Conservation\",
    \"t\".\"YesNo\" as \"Mended\",
    string_agg(COALESCE(\"v\".\"ImageFileLocation\"), '; ') AS \"Images\",
    \"w\".\"ObjectID\",
    \"i\".\"Notes\",
    a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\" 
    left join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\" 
    left join \"public\".\"tblContextDepositType\" AS \"d\" on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\" 
    left join \"public\".\"tblContextFeature\" AS \"e\" on \"c\".\"ProjectID\"=\"e\".\"ProjectID\" and \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\" 
    left join \"public\".\"tblContextFeatureType\" AS \"f\" on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\" 
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\" 
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\" 
    inner join \"public\".\"tblUtensil\" AS \"i\" on \"h\".\"ArtifactID\" = \"i\".\"ArtifactID\" 
    left join \"public\".\"tblCompleteness\" AS \"j\" on \"i\".\"CompletenessID\" = \"j\".\"CompletenessID\"
    left join \"public\".\"tblUtensilForm\" AS \"k\" on \"i\".\"UtensilFormID\" = \"k\".\"UtensilFormID\"
    left join \"public\".\"tblUtensilForkTineCount\" AS \"l\" on \"i\".\"ForkTineCountID\" = \"l\".\"ForkTineCountID\"
    left join \"public\".\"tblYesNo\" as \"n\" on \"i\".\"DecorationYN\" = \"n\".\"YesNoID\"
    left join \"public\".\"tblUtensilPlating\" as \"o\" on \"i\".\"UtensilPlatingID\" = \"o\".\"UtensilPlatingID\"
    left join \"public\".\"tblUtensilHandleDecoration\" as \"p\" on \"i\".\"HandleDecorationID\" = \"p\".\"HandleDecorationID\"
    left join \"public\".\"tblYesNo\" as \"q\" on \"i\".\"SpoonRatTail\" = \"q\".\"YesNoID\"
    left join \"public\".\"tblYesNo\" as \"r\" on \"i\".\"Burned\" = \"r\".\"YesNoID\"
    left join \"public\".\"tblYesNo\" as \"s\" on \"i\".\"PMM\" = \"s\".\"YesNoID\"
    left join \"public\".\"tblYesNo\" as \"t\" on \"i\".\"Mended\" = \"t\".\"YesNoID\"
    left join \"public\".\"tblArtifactImage\" as \"u\" on \"i\".\"ArtifactID\" = \"u\".\"ArtifactID\" 
    left join \"public\".\"tblImage\" AS \"v\" on \"u\".\"ImageID\" = \"v\".\"ImageID\"
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"w\" on \"i\".\"GenerateContextArtifactID\" = \"w\".\"GenerateContextArtifactID\"
    left join \"public\".\"tblUtensilSpecific\" as \"x\" on \"i\".\"ArtifactID\" = \"x\".\"ArtifactID\"
    left join \"public\".\"tblUtensilPart\" as \"y\" on \"x\".\"UtensilPartID\" = \"y\".\"UtensilPartID\"
    left join \"public\".\"tblUtensilShape\" as \"z\" on \"x\".\"UtensilShapeID\" = \"z\".\"UtensilShapeID\"
    left join \"public\".\"tblUtensilManuTech\" as \"aa\" on \"x\".\"UtensilManuTechID\" = \"aa\".\"UtensilManuTechID\"
    left join \"public\".\"tblUtensilMaterial\" as \"ab\" on \"x\".\"UtensilMaterialID\" = \"ab\".\"UtensilMaterialID\"

    #{query}


    GROUP BY
    \"b\".\"ProjectName\",
    \"c\".\"ProjectID\",
    \"c\".\"Context\",
    \"c\".\"QuadratID\",
    \"d\".\"DepositType\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureNumber\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSPhase\",
    \"i\".\"ArtifactID\",
    \"i\".\"Quantity\",
    \"j\".\"Completeness\",
    \"k\".\"UtensilForm\",
    \"l\".\"ForkTineCount\",
    \"q\".\"YesNo\",
    \"n\".\"YesNo\", --Deocoration?
    \"i\".\"Marks\",
    \"o\".\"UtensilPlating\" ,
    \"p\".\"HandleDecoration\",
    \"i\".\"ArtifactLength\",
    \"i\".\"ArtifactWidth\",
    \"i\".\"ArtifactWeight\",
    \"r\".\"YesNo\", --Burned
    \"s\".\"YesNo\", --PMM
    \"i\".\"Conservation\",
    \"t\".\"YesNo\",
    \"w\".\"ObjectID\",
    \"i\".\"Notes\",
    a.\"Published\"


    ORDER BY
    \"c\".\"ProjectID\",
    \"i\".\"ArtifactID\",
    \"k\".\"UtensilForm\""
    
  end
  
  def aq_three_utensil_related(query)
    "--File Name: AQ3_Utensils_ConcatenatedView_DRC_Done
    --Created by: Beth Bollwerk
    --Last Updated: 11 March 2015 by jeg
    --Artifact Query 3 Utensils: This file returns related data for utensils for the DRC Website and downloads.


    --Step 1: Users select One or All Utensil Attributes.  The data always returned for this query are the following, in addition to any other utensil Fields selected by User. 
    SELECT
    \"b\".\"ProjectName\" as \"ProjectName\",--always return this field
    \"c\".\"ProjectID\" as \"ProjectID\",--always return this field
    \"c\".\"Context\" as \"Context\",--always return this field
    \"c\".\"QuadratID\" as \"QuadratID\",
    \"d\".\"DepositType\" as \"DepositType\",
    \"f\".\"FeatureType\" as \"FeatureType\",
    \"e\".\"FeatureNumber\" as \"FeatureNumber\",
    \"e\".\"FeatureGroup\" as \"FeatureGroup\",--always return this field
    \"e\".\"FeatureGroupInterpretation\" as \"FeatureGroupInterpretation\",--always return this field
    \"c\".\"DAACSStratigraphicGroup\" as \"StratigraphicGroup\",--always return this field
    \"c\".\"DAACSPhase\" as \"DAACSPhase\",--always return this field
    \"i\".\"ArtifactID\" as \"ArtifactID\",--always return this field
    \"i\".\"Quantity\" as \"Count\",--always return this field
    \"j\".\"Completeness\",
    \"k\".\"UtensilForm\" as \"UtensilForm\",
    \"l\".\"ForkTineCount\" as \"ForkTineCount\",
    \"q\".\"YesNo\" as \"PresenceofRatTail\",
    \"y\".\"UtensilPart\" as \"UtensilPart\",
    \"z\".\"UtensilShape\" as \"PartShape\",
    \"aa\".\"UtensilManuTech\" as \"PartManufacturingTechnique\",
    \"ab\".\"UtensilMaterial\" as \"PartMaterial\", 
    \"x\".\"PartLength\" as \"PartLength\",
    \"x\".\"PartWidth\" as \"PartWidth\",
    \"x\".\"PartHeight\" as \"PartHeight\",
    \"n\".\"YesNo\" as \"Decoration\",
    \"i\".\"Marks\",
    \"o\".\"UtensilPlating\" as \"UtensilPlating\",
    \"p\".\"HandleDecoration\" as \"HandleDecoration\",
    \"i\".\"ArtifactLength\" as \"ArtifactLength\",
    \"i\".\"ArtifactWidth\" as \"ArtifactWidth\",
    \"i\".\"ArtifactWeight\" as \"ArtifactWeight\",
    \"r\".\"YesNo\" as \"Burned\",
    \"s\".\"YesNo\" as \"PostManufacturingModification\",
    \"i\".\"Conservation\",
    \"t\".\"YesNo\" as \"Mended\",
    \"v\".\"ImageFileLocation\" AS \"Images\",
    \"w\".\"ObjectID\",
    \"i\".\"Notes\",
    a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\" 
    left join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\" 
    left join \"public\".\"tblContextDepositType\" AS \"d\" on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\" 
    left join \"public\".\"tblContextFeature\" AS \"e\" on \"c\".\"ProjectID\"=\"e\".\"ProjectID\" and \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\" 
    left join \"public\".\"tblContextFeatureType\" AS \"f\" on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\" 
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\" 
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\" 
    inner join \"public\".\"tblUtensil\" AS \"i\" on \"h\".\"ArtifactID\" = \"i\".\"ArtifactID\" 
    left join \"public\".\"tblCompleteness\" AS \"j\" on \"i\".\"CompletenessID\" = \"j\".\"CompletenessID\"
    left join \"public\".\"tblUtensilForm\" AS \"k\" on \"i\".\"UtensilFormID\" = \"k\".\"UtensilFormID\"
    left join \"public\".\"tblUtensilForkTineCount\" AS \"l\" on \"i\".\"ForkTineCountID\" = \"l\".\"ForkTineCountID\"
    left join \"public\".\"tblYesNo\" as \"n\" on \"i\".\"DecorationYN\" = \"n\".\"YesNoID\"
    left join \"public\".\"tblUtensilPlating\" as \"o\" on \"i\".\"UtensilPlatingID\" = \"o\".\"UtensilPlatingID\"
    left join \"public\".\"tblUtensilHandleDecoration\" as \"p\" on \"i\".\"HandleDecorationID\" = \"p\".\"HandleDecorationID\"
    left join \"public\".\"tblYesNo\" as \"q\" on \"i\".\"SpoonRatTail\" = \"q\".\"YesNoID\"
    left join \"public\".\"tblYesNo\" as \"r\" on \"i\".\"Burned\" = \"r\".\"YesNoID\"
    left join \"public\".\"tblYesNo\" as \"s\" on \"i\".\"PMM\" = \"s\".\"YesNoID\"
    left join \"public\".\"tblYesNo\" as \"t\" on \"i\".\"Mended\" = \"t\".\"YesNoID\"
    left join \"public\".\"tblArtifactImage\" as \"u\" on \"i\".\"ArtifactID\" = \"u\".\"ArtifactID\" 
    left join \"public\".\"tblImage\" AS \"v\" on \"u\".\"ImageID\" = \"v\".\"ImageID\"
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"w\" on \"i\".\"GenerateContextArtifactID\" = \"w\".\"GenerateContextArtifactID\"
    left join \"public\".\"tblUtensilSpecific\" as \"x\" on \"i\".\"ArtifactID\" = \"x\".\"ArtifactID\"
    left join \"public\".\"tblUtensilPart\" as \"y\" on \"x\".\"UtensilPartID\" = \"y\".\"UtensilPartID\"
    left join \"public\".\"tblUtensilShape\" as \"z\" on \"x\".\"UtensilShapeID\" = \"z\".\"UtensilShapeID\"
    left join \"public\".\"tblUtensilManuTech\" as \"aa\" on \"x\".\"UtensilManuTechID\" = \"aa\".\"UtensilManuTechID\"
    left join \"public\".\"tblUtensilMaterial\" as \"ab\" on \"x\".\"UtensilMaterialID\" = \"ab\".\"UtensilMaterialID\"

    #{query}

    ORDER BY
    \"c\".\"ProjectID\",
    \"i\".\"ArtifactID\",
    \"k\".\"UtensilForm\""
    
  end
  
  def aq_three_gen_artifact_concat(query)
    "--File Name: AQ3_GenArts_ConcatenatedView_DRC_Done
    --Created by: Beth Bollwerk
    --Last Updated: 11 March 2015 by jeg
    --Artifact Query 3 General Artifacts: This file returns concatenated data for GenArts for the DRC Website and concatenated downloads.

    --Step 1: Users select One or All GenArts Attributes.  The data always returned for this query are the following, in addition to any other ceramic Fields selected by User. 
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
    \"j\".\"GenArtifactCategory\" as \"Category\",
    \"k\".\"GenArtifactForm\" as \"Form\",
    \"l\".\"GenArtifactCompleteness\" as \"Completeness\",
    string_agg(distinct COALESCE(\"ma\".\"GenArtifactMaterialType\")||', '||COALESCE(\"n\".\"GenArtifactManuTech\"), '; ') as \"MaterialandManufacturingTechnique\",
    \"o\".\"NailHeadType\" as \"NailHeadType\",
    \"x\".\"YesNo\" as \"DecorationYN?\",
    string_agg(distinct COALESCE(\"aa\".\"GenArtifactDecTechType\")||', '||COALESCE(\"bb\".\"BasicColor\")||', '|| COALESCE(\"z\".\"DecorationNotes\"), '; ') as \"DecorationType,Color,andNotes\",
    \"p\".\"NailEndType\" as \"NailEndType\",
    \"q\".\"NailModification\" as \"NailModification\",
    \"i\".\"NailLength\" as \"NailLength\",
    \"i\".\"CoinDate\" as \"CoinDate\",
    \"r\".\"BrickSize\" as \"BrickSize\",
    \"s\".\"YesNo\" as \"Mended\",
    \"t\".\"YesNo\" as \"PostManufacturingModification\",
    \"u\".\"YesNo\" as \"Burned\",
    \"i\".\"Length\", 
    \"i\".\"Width\",
    \"i\".\"Height\",
    \"i\".\"Weight\",
    \"i\".\"Marks\",
    \"i\".\"Notes\",
    \"i\".\"Conservation\",
    string_agg(COALESCE(\"w\".\"ImageFileLocation\"), ';') AS \"Images\",
    \"y\".\"ObjectID\",
    \"a\".\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    left join \"public\".\"tblContextDepositType\" AS \"d\"	on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" =\"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    inner join \"public\".\"tblGenArtifact\" AS \"i\" on \"h\".\"ArtifactID\" = \"i\".\"ArtifactID\"
    left join \"public\".\"tblGenArtifactCategory\" as \"j\" on \"i\".\"GenArtifactCategoryID\" = \"j\".\"GenArtifactCategoryID\"
    left join \"public\".\"tblGenArtifactForm\" as \"k\" on \"i\".\"GenArtifactFormID\" = \"k\".\"GenArtifactFormID\"
    left join \"public\".\"tblGenArtifactCompleteness\" as \"l\" on \"i\".\"GenArtifactCompletenessID\" = \"l\".\"GenArtifactCompletenessID\"
    left join \"public\".\"tblGenArtifactMaterial\" as \"m\" on \"i\".\"ArtifactID\" = \"m\".\"ArtifactID\"
    left join \"public\".\"tblGenArtifactMaterialType\" as \"ma\" on \"m\".\"GenArtifactMaterialTypeID\" = \"ma\".\"GenArtifactMaterialTypeID\"
    left join \"public\".\"tblGenArtifactManuTech\" as \"n\" on \"m\".\"GenArtifactManuTechID\" = \"n\".\"GenArtifactManuTechID\"
    left join \"public\".\"tblGenArtifactNailHead\" as \"o\" on \"i\".\"NailHeadTypeID\" = \"o\".\"NailHeadTypeID\"
    left join \"public\".\"tblGenArtifactNailEnd\" as \"p\" on \"i\".\"NailEndTypeID\" = \"p\".\"NailEndTypeID\"
    left join \"public\".\"tblGenArtifactNailModification\" as \"q\" on \"i\".\"NailModificationID\" = \"q\".\"NailModificationID\"
    left join \"public\".\"tblGenArtifactBrickSize\" as \"r\" on \"i\".\"BrickSizeID\" = \"r\".\"BrickSizeID\"
    left join \"public\".\"tblYesNo\" as \"s\" on \"i\".\"Mended\" = \"s\".\"YesNoID\"
    left join \"public\".\"tblYesNo\" as \"t\" on \"i\".\"PMM\" = \"t\".\"YesNoID\"
    left join \"public\".\"tblYesNo\" as \"u\" on \"i\".\"Burned\" = \"u\".\"YesNoID\"
    left join \"public\".\"tblArtifactImage\" as \"v\" on	\"i\".\"ArtifactID\" = \"v\".\"ArtifactID\" 
    left join \"public\".\"tblImage\" as \"w\" on \"v\".\"ImageID\" = \"w\".\"ImageID\"
    left join \"public\".\"tblYesNo\" as \"x\" on \"i\".\"DecorationYN\" = \"x\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"y\" on \"i\".\"GenerateContextArtifactID\" = \"y\".\"GenerateContextArtifactID\" 
    LEFT JOIN \"public\".\"tblGenArtifactDecTech\" AS \"z\" on \"i\".\"GenerateContextArtifactID\" = \"z\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGenArtifactDecTechType\" AS \"aa\" on \"z\".\"GenArtifactDecTechTypeID\" = \"aa\". \"GenArtifactDecTechTypeID\"
    LEFT JOIN \"public\".\"tblBasicColor\" AS \"bb\" ON \"z\".\"GenArtDecTechBasicColorID\" = \"bb\".\"BasicColorID\"

    #{query}


    GROUP BY

    \"b\".\"ProjectName\",
    \"c\".\"ProjectID\",
    \"c\".\"Context\",
    \"c\".\"QuadratID\",
    \"d\".\"DepositType\",
    \"f\".\"FeatureType\",
    \"e\".\"FeatureNumber\",
    \"e\".\"FeatureGroup\",
    \"e\".\"FeatureGroupInterpretation\",
    \"c\".\"DAACSStratigraphicGroup\",
    \"c\".\"DAACSPhase\",
    \"i\".\"ArtifactID\",
    \"i\".\"Quantity\",
    \"j\".\"GenArtifactCategory\",
    \"k\".\"GenArtifactForm\",
    \"l\".\"GenArtifactCompleteness\",
    \"o\".\"NailHeadType\",
    \"x\".\"YesNo\", --DecorationY/N?
    \"p\".\"NailEndType\",
    \"q\".\"NailModification\",
    \"i\".\"NailLength\",
    \"i\".\"CoinDate\",
    \"r\".\"BrickSize\",
    \"s\".\"YesNo\",--Mended
    \"t\".\"YesNo\", --PMM
    \"u\".\"YesNo\", --Burned
    \"i\".\"Length\", 
    \"i\".\"Width\",
    \"i\".\"Height\",
    \"i\".\"Weight\",
    \"i\".\"Marks\",
    \"i\".\"Notes\",
    \"i\".\"Conservation\",
    \"y\".\"ObjectID\",
    a.\"Published\"


    ORDER BY
    \"i\".\"ArtifactID\",
    \"Form\""
  end
  
  def aq_three_gen_artifact_related(query)
    "--File Name: AQ3_GenArts_ConcatenatedView_DRC_Done
    --Created by: Beth Bollwerk
    --Last Updated: 11 March 2015 by jeg
    --Artifact Query 3 General Artifacts: This file returns concatenated data for GenArts for the DRC Website and concatenated downloads.

    --Step 1: Users select One or All GenArts Attributes.  The data always returned for this query are the following, in addition to any other ceramic Fields selected by User. 
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
    \"j\".\"GenArtifactCategory\" as \"Category\",
    \"k\".\"GenArtifactForm\" as \"Form\",
    \"l\".\"GenArtifactCompleteness\" as \"Completeness\",
    \"ma\".\"GenArtifactMaterialType\" as \"Material\",
    \"n\".\"GenArtifactManuTech\"  as \"ManufacturingTechnique\",
    \"o\".\"NailHeadType\" as \"NailHeadType\",
    \"x\".\"YesNo\" as \"DecorationYN?\",
    \"aa\".\"GenArtifactDecTechType\" as \"DecorativeTechniqueType\",
    \"bb\".\"BasicColor\" as \"AppliedColor\",
    \"z\".\"DecorationNotes\" as \"DecorationNotes\",
    \"p\".\"NailEndType\" as \"NailEndType\",
    \"q\".\"NailModification\" as \"NailModification\",
    \"i\".\"NailLength\" as \"NailLength\",
    \"i\".\"CoinDate\" as \"CoinDate\",
    \"r\".\"BrickSize\" as \"BrickSize\",
    \"s\".\"YesNo\" as \"Mended\",
    \"t\".\"YesNo\" as \"PostManufacturingModification\",
    \"u\".\"YesNo\" as \"Burned\",
    \"i\".\"Length\", 
    \"i\".\"Width\",
    \"i\".\"Height\",
    \"i\".\"Weight\",
    \"i\".\"Marks\",
    \"i\".\"Notes\",
    \"i\".\"Conservation\",
    \"w\".\"ImageFileLocation\" AS \"Images\",
    \"y\".\"ObjectID\",
    a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\"
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    left join \"public\".\"tblContextDepositType\" AS \"d\"	on \"c\".\"DepositTypeID\" = \"d\".\"DepositTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" =\"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    inner join \"public\".\"tblGenArtifact\" AS \"i\" on \"h\".\"ArtifactID\" = \"i\".\"ArtifactID\"
    left join \"public\".\"tblGenArtifactCategory\" as \"j\" on \"i\".\"GenArtifactCategoryID\" = \"j\".\"GenArtifactCategoryID\"
    left join \"public\".\"tblGenArtifactForm\" as \"k\" on \"i\".\"GenArtifactFormID\" = \"k\".\"GenArtifactFormID\"
    left join \"public\".\"tblGenArtifactCompleteness\" as \"l\" on \"i\".\"GenArtifactCompletenessID\" = \"l\".\"GenArtifactCompletenessID\"
    left join \"public\".\"tblGenArtifactMaterial\" as \"m\" on \"i\".\"ArtifactID\" = \"m\".\"ArtifactID\"
    left join \"public\".\"tblGenArtifactMaterialType\" as \"ma\" on \"m\".\"GenArtifactMaterialTypeID\" = \"ma\".\"GenArtifactMaterialTypeID\"
    left join \"public\".\"tblGenArtifactManuTech\" as \"n\" on \"m\".\"GenArtifactManuTechID\" = \"n\".\"GenArtifactManuTechID\"
    left join \"public\".\"tblGenArtifactNailHead\" as \"o\" on \"i\".\"NailHeadTypeID\" = \"o\".\"NailHeadTypeID\"
    left join \"public\".\"tblGenArtifactNailEnd\" as \"p\" on \"i\".\"NailEndTypeID\" = \"p\".\"NailEndTypeID\"
    left join \"public\".\"tblGenArtifactNailModification\" as \"q\" on \"i\".\"NailModificationID\" = \"q\".\"NailModificationID\"
    left join \"public\".\"tblGenArtifactBrickSize\" as \"r\" on \"i\".\"BrickSizeID\" = \"r\".\"BrickSizeID\"
    left join \"public\".\"tblYesNo\" as \"s\" on \"i\".\"Mended\" = \"s\".\"YesNoID\"
    left join \"public\".\"tblYesNo\" as \"t\" on \"i\".\"PMM\" = \"t\".\"YesNoID\"
    left join \"public\".\"tblYesNo\" as \"u\" on \"i\".\"Burned\" = \"u\".\"YesNoID\"
    left join \"public\".\"tblArtifactImage\" as \"v\" on	\"i\".\"ArtifactID\" = \"v\".\"ArtifactID\" 
    left join \"public\".\"tblImage\" as \"w\" on \"v\".\"ImageID\" = \"w\".\"ImageID\"
    left join \"public\".\"tblYesNo\" as \"x\" on \"i\".\"DecorationYN\" = \"x\".\"YesNoID\"
    LEFT JOIN \"public\".\"tblObjectArtifact\" AS \"y\" on \"i\".\"GenerateContextArtifactID\" = \"y\".\"GenerateContextArtifactID\" 
    LEFT JOIN \"public\".\"tblGenArtifactDecTech\" AS \"z\" on \"i\".\"GenerateContextArtifactID\" = \"z\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGenArtifactDecTechType\" AS \"aa\" on \"z\".\"GenArtifactDecTechTypeID\" = \"aa\". \"GenArtifactDecTechTypeID\"
    LEFT JOIN \"public\".\"tblBasicColor\" AS \"bb\" ON \"z\".\"GenArtDecTechBasicColorID\" = \"bb\".\"BasicColorID\"

    #{query}

    ORDER BY
    \"i\".\"ArtifactID\",
    \"Form\""
  end
  
  def aq_two_context(query)
    "--File Name: AQ2_Context_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 25 March 2015 by jeg
    --Artifact Query 2 Context: This file returns detailed data for all artifacts by context for the DAACS Website.

    --Beads--
    SELECT
    	\"b\".\"ProjectName\" AS \"ProjectName\",
    	\"a\".\"ProjectID\" AS \"ProjectID\",
    	\"c\".\"Context\" AS \"Context\",
    	\"cc\".\"DepositType\" AS \"DepositType\",
    	\"d\".\"UnitType\" AS \"UnitType\",
    	\"f\".\"FeatureType\" AS \"FeatureType\",
    	\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    	\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    	\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    	\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    	\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    	\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    	\"i\".\"ArtifactID\" AS \"ArtifactID\",
    	\"i\".\"Quantity\" AS \"Quantity\",
    	'Bead, ' || \"j\".\"BeadShape\" AS \"Form\",
    	\"k\".\"BeadMaterial\" AS \"Material\",
    	l.\"BeadManuTech\" AS \"ManufacturingTechnique\",
    	'' AS \"VesselCategory\",
    	'' AS \"CeramicDecTechAppliedColorCombination\",
    	'' AS \"CeramicGenre\",
    	'Bead' AS \"ArtifactType\",
      a.\"Published\"
    FROM
    	\"public\".\"tblProject\" AS \"a\"
    LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBeadShape\" AS \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"
    LEFT JOIN \"public\".\"tblBeadMaterial\" AS \"k\" ON i.\"BeadMaterialID\" = \"k\".\"BeadMaterialID\"
    LEFT JOIN \"public\".\"tblBeadManuTech\" AS l ON i.\"BeadManuTechID\" = l.\"BeadManuTechID\"

    #{query}				
  			

    UNION ALL
    	--Buckles--
    	SELECT
    		\"b\".\"ProjectName\" AS \"ProjectName\",
    		\"a\".\"ProjectID\" AS \"ProjectID\",
    		\"c\".\"Context\" AS \"Context\",
    		\"cc\".\"DepositType\" AS \"DepositType\",
    		\"d\".\"UnitType\" AS \"UnitType\",
    		\"f\".\"FeatureType\" AS \"FeatureType\",
    		\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    		\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    		\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    		\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    		\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    		\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    		\"i\".\"ArtifactID\" AS \"ArtifactID\",
    		\"i\".\"Quantity\" AS \"Quantity\",
    		'Buckle, ' || \"j\".\"BuckleType\" AS \"Form\",
    		\"o\".\"BuckleMaterial\" AS \"Material\",
    		\"p\".\"BuckleManuTech\" AS \"ManufacturingTechnique\",
    		'' AS \"VesselCategory\",
    		'' AS \"CeramicDecTechAppliedColorCombination\",
    		'' AS \"CeramicGenre\",
    		'Buckle' AS \"ArtifactType\",
      a.\"Published\"
    	FROM
    		\"public\".\"tblProject\" AS \"a\"
    	LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    	INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    	LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    	LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    	LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    	AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    	LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    	INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    	INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    	INNER JOIN \"public\".\"tblBuckle\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    	LEFT JOIN \"public\".\"tblBuckleType\" AS \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"
    	LEFT JOIN \"public\".\"tblBuckleForm\" AS \"k\" ON \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    	LEFT JOIN \"public\".\"tblBuckleMaterial\" AS \"o\" ON \"k\".\"BuckleMaterialID\" = \"o\".\"BuckleMaterialID\"
    	LEFT JOIN \"public\".\"tblBuckleManuTech\" AS \"p\" ON \"k\".\"BuckleManuTechID\" = \"p\".\"BuckleManuTechID\"
	
    #{query}

    UNION ALL

    		--Buttons--
    		SELECT
    			\"b\".\"ProjectName\" AS \"ProjectName\",
    			\"a\".\"ProjectID\" AS \"ProjectID\",
    			\"c\".\"Context\" AS \"Context\",
    			\"cc\".\"DepositType\" AS \"DepositType\",
    			\"d\".\"UnitType\" AS \"UnitType\",
    			\"f\".\"FeatureType\" AS \"FeatureType\",
    			\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    			\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    			\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    			\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    			\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    			\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    			\"i\".\"ArtifactID\" AS \"ArtifactID\",
    			\"i\".\"Quantity\" AS \"Quantity\",
    			'Button, ' || \"j\".\"ButtonType\" AS \"Form\",
    			\"q\".\"ButtonMaterial\" AS \"Material\",
    			\"k\".\"ButtonManuTech\" AS \"ManufacturingTechnique\",
    			'' AS \"VesselCategory\",
    			'' AS \"CeramicDecTechAppliedColorCombination\",
    			'' AS \"CeramicGenre\",
    			'Button' AS \"ArtifactType\",
      a.\"Published\"
    		FROM
    			\"public\".\"tblProject\" AS \"a\"
    		LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    		INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    		LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    		LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    		LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    		AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    		LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    		INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    		INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    		INNER JOIN \"public\".\"tblButton\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    		LEFT JOIN \"public\".\"tblButtonType\" AS \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"
    		LEFT JOIN \"public\".\"tblButtonManuTech\" AS \"k\" ON \"i\".\"ButtonManuTechID\" = \"k\".\"ButtonManuTechID\"
    		LEFT JOIN \"public\".\"tblButtonMaterial\" AS \"q\" ON \"i\".\"ButtonMaterialID\" = \"q\".\"ButtonMaterialID\"

        #{query}				


    UNION ALL

    --Ceramics--
    			SELECT
    				\"b\".\"ProjectName\" AS \"ProjectName\",
    				\"a\".\"ProjectID\" AS \"ProjectID\",
    				\"c\".\"Context\" AS \"Context\",
    				\"cc\".\"DepositType\" AS \"DepositType\",
    				\"d\".\"UnitType\" AS \"UnitType\",
    				\"f\".\"FeatureType\" AS \"FeatureType\",
    				\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    				\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    				\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    				\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    				\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    				\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    				\"i\".\"ArtifactID\" AS \"ArtifactID\",
    				\"i\".\"Quantity\" AS \"Quantity\",
    				\"k\".\"CeramicForm\" AS \"Form\",
    				\"m\".\"Ware\" AS \"Material\",
    				\"l\".\"CeramicManuTech\" AS \"ManufacturingTechnique\",
    				\"j\".\"CeramicVesselCategory\" AS \"VesselCategory\",
    				string_agg (
    					DISTINCT COALESCE (\"o\".\"CeramicDecTechType\") || ', ' || COALESCE (
    						\"p\".\"AppliedColorWrittenDescription\"
    					),
    					'; '
    				) AS \"CeramicDecTechAppliedColorCombination\",
    				\"q\".\"CeramicGenre\" AS \"CeramicGenre\",
    				'Ceramic' AS \"ArtifactType\",
      a.\"Published\"

    			FROM
    				\"public\".\"tblProject\" AS \"a\"
    			LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    			INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    			LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    			LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    			LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    			AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    			LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    			INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    			INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    			INNER JOIN \"public\".\"tblCeramic\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    			LEFT JOIN \"public\".\"tblCeramicVesselCategory\" AS \"j\" ON \"i\".\"CeramicVesselCategoryID\" = \"j\".\"CeramicVesselCategoryID\"
    			LEFT JOIN \"public\".\"tblCeramicForm\" AS \"k\" ON \"i\".\"CeramicFormID\" = \"k\".\"CeramicFormID\"
    			LEFT JOIN \"public\".\"tblCeramicManuTech\" AS \"l\" ON \"i\".\"CeramicManuTechID\" = \"l\".\"CeramicManuTechID\"
    			LEFT JOIN \"public\".\"tblCeramicWare\" AS \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"
    			LEFT JOIN \"public\".\"tblCeramicDecTech\" AS \"n\" ON \"i\".\"ArtifactID\" = \"n\".\"ArtifactID\"
    			LEFT JOIN \"public\".\"tblCeramicDecTechType\" AS \"o\" ON \"n\".\"CeramicDecTechTypeID\" = \"o\".\"CeramicDecTechTypeID\"
    			LEFT JOIN \"public\".\"tblMunsellAppliedColor\" AS \"p\" ON \"n\".\"MunAppColorID\" = \"p\".\"MunAppColorID\"
    			LEFT JOIN \"public\".\"tblCeramicGenre\" AS \"q\" ON \"i\".\"CeramicGenreID\" = \"q\".\"CeramicGenreID\"
			
          #{query}				


    GROUP BY
    					\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"Context\",
    						\"cc\".\"DepositType\",
    						\"d\".\"UnitType\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"Material\",
    						\"ManufacturingTechnique\",
    						\"VesselCategory\",						
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    			UNION ALL

    				--Faunal--
    				SELECT
    					\"b\".\"ProjectName\" AS \"ProjectName\",
    					\"a\".\"ProjectID\" AS \"ProjectID\",
    					\"c\".\"Context\" AS \"Context\",
    					\"cc\".\"DepositType\" AS \"DepositType\",
    					\"d\".\"UnitType\" AS \"UnitType\",
    					\"f\".\"FeatureType\" AS \"FeatureType\",
    					\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    					\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    					\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    					\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    					\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    					\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    					\"i\".\"ArtifactID\" AS \"ArtifactID\",
    					\"i\".\"Quantity\" AS \"Quantity\",
    					\"j\".\"English\" AS \"Form\",
    					'' AS \"VesselCategory\",
    					'' AS \"Material\",
    					'' AS \"ManufacturingTechnique\",
    					'' AS \"CeramicDecTechAppliedColorCombination\",
    					'' AS \"CeramicGenre\",
    					'Faunal' AS \"ArtifactType\",
      a.\"Published\"
    				FROM
    					\"public\".\"tblProject\" AS \"a\"
    				LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    				INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    				LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    				LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    				LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    				AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    				LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    				INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    				INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    				INNER JOIN \"public\".\"tblBone\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    				LEFT JOIN \"public\".\"tblBoneTaxon\" AS \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"
				
            #{query}				
				
    UNION ALL

    --General Artifacts--
    					SELECT
    						\"b\".\"ProjectName\" AS \"ProjectName\",
    						\"a\".\"ProjectID\" AS \"ProjectID\",
    						\"c\".\"Context\" AS \"Context\",
    						\"cc\".\"DepositType\" AS \"DepositType\",
    						\"d\".\"UnitType\" AS \"UnitType\",
    						\"f\".\"FeatureType\" AS \"FeatureType\",
    						\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    						\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    						\"i\".\"ArtifactID\" AS \"ArtifactID\",
    						\"i\".\"Quantity\" AS \"Quantity\",
    						\"j\".\"GenArtifactForm\" AS \"Form\",
    						string_agg (
    							DISTINCT COALESCE (
    								\"l\".\"GenArtifactMaterialType\"
    							),
    							'; '
    						) AS \"Material\",
    						string_agg (
    							DISTINCT COALESCE (\"m\".\"GenArtifactManuTech\"),
    							'; '
    						) AS \"ManufacturingTechnique\",
    						'' AS \"VesselCategory\",
    						'' AS \"CeramicDecTechAppliedColorCombination\",
    						'' AS \"CeramicGenre\",
    						'General Artifacts' AS \"ArtifactType\",
      a.\"Published\"
    					FROM
    						\"public\".\"tblProject\" AS \"a\"
    					LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    					INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    					LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    					LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    					LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    					AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    					LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    					INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    					INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    					INNER JOIN \"public\".\"tblGenArtifact\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    					LEFT JOIN \"public\".\"tblGenArtifactForm\" AS \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"
    					LEFT JOIN \"public\".\"tblGenArtifactMaterial\" AS \"k\" ON \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    					LEFT JOIN \"public\".\"tblGenArtifactMaterialType\" AS \"l\" ON \"k\".\"GenArtifactMaterialTypeID\" = \"l\".\"GenArtifactMaterialTypeID\"
    					LEFT JOIN \"public\".\"tblGenArtifactManuTech\" AS \"m\" ON \"k\".\"GenArtifactManuTechID\" = \"m\".\"GenArtifactManuTechID\"
					
              #{query}				
				

    GROUP BY
    						\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"Context\",
    						\"cc\".\"DepositType\",
    						\"d\".\"UnitType\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"


    UNION ALL

    --Glass--
    						SELECT
    							\"b\".\"ProjectName\" AS \"ProjectName\",
    							\"a\".\"ProjectID\" AS \"ProjectID\",
    							\"c\".\"Context\" AS \"Context\",
    							\"cc\".\"DepositType\" AS \"DepositType\",
    							\"d\".\"UnitType\" AS \"UnitType\",
    							\"f\".\"FeatureType\" AS \"FeatureType\",
    							\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    							\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    							\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    							\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    							\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    							\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    							\"i\".\"ArtifactID\" AS \"ArtifactID\",
    							\"i\".\"Quantity\" AS \"Quantity\",
    							\"j\".\"GlassForm\" AS \"Form\",
    							\"k\".\"GlassMaterial\" AS \"Material\",
    							\"m\".\"GlassManuTech\" AS \"ManufacturingTechnique\",
    							\"l\".\"GlassVesselCategory\" AS \"VesselCategory\",				
							
    							'' AS \"CeramicDecTechAppliedColorCombination\",
    							'' AS \"CeramicGenre\",
    							'Glass' AS \"ArtifactType\",
      a.\"Published\"
    						FROM
    							\"public\".\"tblProject\" AS \"a\"
    						LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    						INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    						LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    						LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    						LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    						AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    						LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    						INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    						INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    						INNER JOIN \"public\".\"tblGlass\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    						LEFT JOIN \"public\".\"tblGlassForm\" AS \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"
    						LEFT JOIN \"public\".\"tblGlassMaterial\" AS \"k\" ON \"i\".\"GlassMaterialID\" = \"k\".\"GlassMaterialID\"
    						LEFT JOIN \"public\".\"tblGlassVesselCategory\" AS \"l\" ON \"i\".\"GlassVesselCategoryID\" = \"l\".\"GlassVesselCategoryID\"
    						LEFT JOIN \"public\".\"tblGlassManuTech\" AS \"m\" ON \"i\".\"GlassManuTechID\" = \"m\".\"GlassManuTechID\"
					
                #{query}				


    UNION ALL
							
    --Tobacco Pipes--
    							SELECT
    								\"b\".\"ProjectName\" AS \"ProjectName\",
    								\"a\".\"ProjectID\" AS \"ProjectID\",
    								\"c\".\"Context\" AS \"Context\",
    								\"cc\".\"DepositType\" AS \"DepositType\",
    								\"d\".\"UnitType\" AS \"UnitType\",
    								\"f\".\"FeatureType\" AS \"FeatureType\",
    								\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    								\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    								\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    								\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    								\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    								\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    								\"i\".\"ArtifactID\" AS \"ArtifactID\",
    								\"i\".\"Quantity\" AS \"Quantity\",
    								'Tobacco Pipe: ' || \"j\".\"TobaccoPipeCompleteness\" AS \"Form\",
    								\"k\".\"TobaccoPipeMaterial\" AS \"Material\",
    								\"l\".\"TobaccoPipeManuTech\" AS \"ManufacturingTechnique\",
    								'' AS \"VesselCategory\",					
								
    								'' AS \"CeramicDecTechAppliedColorCombination\",
    								'' AS \"CeramicGenre\",
    								'Tobacco Pipe' AS \"ArtifactType\",
      a.\"Published\"

    							FROM
    								\"public\".\"tblProject\" AS \"a\"
    							LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    							INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    							LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    							LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    							LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    							AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    							LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    							INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    							INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    							INNER JOIN \"public\".\"tblTobaccoPipe\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    							LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" AS \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"
    							LEFT JOIN \"public\".\"tblTobaccoPipeMaterial\" AS \"k\" ON \"i\".\"TobaccoPipeMaterialID\" = \"k\".\"TobaccoPipeMaterialID\"
    							LEFT JOIN \"public\".\"tblTobaccoPipeManuTech\" AS \"l\" ON \"i\".\"TobaccoPipeManuTechID\" = \"l\".\"TobaccoPipeManuTechID\"

                  #{query}				


    UNION ALL
							

    	--Utensils--
    								SELECT
    									\"b\".\"ProjectName\" AS \"ProjectName\",
    									\"a\".\"ProjectID\" AS \"ProjectID\",
    									\"c\".\"Context\" AS \"Context\",
    									\"cc\".\"DepositType\" AS \"DepositType\",
    									\"d\".\"UnitType\" AS \"UnitType\",
    									\"f\".\"FeatureType\" AS \"FeatureType\",
    									\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    									\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    									\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    									\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    									\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    									\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    									\"i\".\"ArtifactID\" AS \"ArtifactID\",
    									\"i\".\"Quantity\" AS \"Quantity\",
    									'Utensil: ' || \"j\".\"UtensilForm\" AS \"Form\",
    									string_agg (
    										DISTINCT COALESCE (\"m\".\"UtensilMaterial\"),
    										'; '
    									) AS \"Material\",
    									string_agg (
    										DISTINCT COALESCE (\"l\".\"UtensilManuTech\"),
    										'; '
    									) AS \"ManufacturingTechnique\",
    									'' AS \"VesselCategory\",
    									'' AS \"CeramicDecTechAppliedColorCombination\",
    									'' AS \"CeramicGenre\",
    									'Utensil' AS \"ArtifactType\",
      a.\"Published\"
    								FROM
    									\"public\".\"tblProject\" AS \"a\"
    								LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    								INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    								LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    								LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    								LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    								AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    								LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    								INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    								INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    								INNER JOIN \"public\".\"tblUtensil\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    								LEFT JOIN \"public\".\"tblUtensilForm\" AS \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"
    								LEFT JOIN \"public\".\"tblUtensilSpecific\" AS \"k\" ON \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    								LEFT JOIN \"public\".\"tblUtensilManuTech\" AS \"l\" ON \"k\".\"UtensilManuTechID\" = \"l\".\"UtensilManuTechID\"
    								LEFT JOIN \"public\".\"tblUtensilMaterial\" AS \"m\" ON \"k\".\"UtensilMaterialID\" = \"m\".\"UtensilMaterialID\"

#{query}				

    GROUP BY
    									\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"Context\",
    						\"cc\".\"DepositType\",
    						\"d\".\"UnitType\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    ORDER BY
    \"ProjectName\" ASC,
    \"Context\" ASC,
    \"ArtifactType\""
  end
  
  def aq_two_feature_group(query)
    "--File Name: AQ2_FeatureGroup_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 25 March 2015 by jeg
    --Artifact Query 2 Feature Group: This file returns detailed data for all artifacts by Feature Group for the DRC Website.

    --Beads--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Bead, '||\"j\".\"BeadShape\" AS \"Form\",
    \"k\".\"BeadMaterial\" AS \"Material\",
    l.\"BeadManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Bead' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBeadShape\" as \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"
    LEFT JOIN \"public\".\"tblBeadMaterial\" AS \"k\" ON i.\"BeadMaterialID\" = \"k\".\"BeadMaterialID\"
    LEFT JOIN \"public\".\"tblBeadManuTech\" AS l ON i.\"BeadManuTechID\" = l.\"BeadManuTechID\"

    #{query}

    UNION ALL

    --Buckles--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Buckle, '||\"j\".\"BuckleType\" AS \"Form\",
    \"o\".\"BuckleMaterial\" AS \"Material\",
    \"p\".\"BuckleManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Buckle' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBuckle\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBuckleType\" as \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"
    left join \"public\".\"tblBuckleForm\" AS \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\" 
    left join \"public\".\"tblBuckleMaterial\" AS \"o\" on \"k\".\"BuckleMaterialID\" = \"o\".\"BuckleMaterialID\" 
    left join \"public\".\"tblBuckleManuTech\" AS \"p\" on \"k\".\"BuckleManuTechID\" = \"p\".\"BuckleManuTechID\" 

    #{query}


    UNION ALL


    --Buttons--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Button, '||\"j\".\"ButtonType\" AS \"Form\",
    \"q\".\"ButtonMaterial\" AS \"Material\",
    \"k\".\"ButtonManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Button' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblButton\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblButtonType\"as \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"

    LEFT JOIN \"public\".\"tblButtonManuTech\" AS \"k\" ON \"i\".\"ButtonManuTechID\" = \"k\".\"ButtonManuTechID\"

    LEFT JOIN \"public\".\"tblButtonMaterial\" AS \"q\" ON \"i\".\"ButtonMaterialID\" = \"q\".\"ButtonMaterialID\"

    #{query}


    UNION ALL


    --Ceramics--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"k\".\"CeramicForm\" AS \"Form\",
    \"m\".\"Ware\" AS \"Material\",
    \"l\".\"CeramicManuTech\" AS \"ManufacturingTechnique\",
    \"j\".\"CeramicVesselCategory\" as \"VesselCategory\",
    string_agg(distinct COALESCE(\"o\".\"CeramicDecTechType\")||', '||COALESCE(\"p\".\"AppliedColorWrittenDescription\"), '; ') as \"CeramicDecTechAppliedColorCombination\",
    \"q\".\"CeramicGenre\" as \"CeramicGenre\",
    'Ceramic' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblCeramic\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    left join \"public\".\"tblCeramicVesselCategory\" AS \"j\" on	\"i\".\"CeramicVesselCategoryID\" = \"j\".\"CeramicVesselCategoryID\"
    left join \"public\".\"tblCeramicForm\" AS \"k\" on	\"i\".\"CeramicFormID\" = \"k\".\"CeramicFormID\"	
    left join \"public\".\"tblCeramicManuTech\" AS \"l\" on	\"i\".\"CeramicManuTechID\" = \"l\".\"CeramicManuTechID\"
    LEFT JOIN \"public\".\"tblCeramicWare\" as \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"
    left join \"public\".\"tblCeramicDecTech\" AS \"n\" on  \"i\".\"ArtifactID\" = \"n\".\"ArtifactID\"
    left join \"public\".\"tblCeramicDecTechType\" AS \"o\" on  \"n\".\"CeramicDecTechTypeID\" = \"o\".\"CeramicDecTechTypeID\"
    left join \"public\".\"tblMunsellAppliedColor\" AS \"p\" on	\"n\".\"MunAppColorID\" = \"p\".\"MunAppColorID\"
    left join \"public\".\"tblCeramicGenre\" AS \"q\" on \"i\".\"CeramicGenreID\" = \"q\".\"CeramicGenreID\"

    #{query}

    Group BY
    						\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"Material\",
    						\"ManufacturingTechnique\",
    						\"VesselCategory\",						
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    UNION ALL
    --Faunal--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"English\" as \"Form\",
    '' AS \"Material\",
    '' AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Faunal' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBone\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBoneTaxon\" as \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"

    #{query}

    UNION ALL

    --General Artifacts--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"GenArtifactForm\" AS \"Form\",
    string_agg(distinct COALESCE(\"l\".\"GenArtifactMaterialType\"), '; ') as \"Material\",
    string_agg(distinct COALESCE(\"m\".\"GenArtifactManuTech\"), '; ') as \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'General Artifacts' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGenArtifact\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGenArtifactForm\" as \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"
    left join \"public\".\"tblGenArtifactMaterial\" as \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    left join \"public\".\"tblGenArtifactMaterialType\" as \"l\" on \"k\".\"GenArtifactMaterialTypeID\" = \"l\".\"GenArtifactMaterialTypeID\"
    left join \"public\".\"tblGenArtifactManuTech\" as \"m\" on \"k\".\"GenArtifactManuTechID\" = \"m\".\"GenArtifactManuTechID\"


    #{query}


    Group BY
    					\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",		
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    UNION ALL

    --Glass--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"GlassForm\" as \"Form\",
    \"k\".\"GlassMaterial\" AS \"Material\",
    \"m\".\"GlassManuTech\" AS \"ManufacturingTechnique\",
    \"l\".\"GlassVesselCategory\" as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Glass' AS \"ArtifactType\",
      a.\"Published\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGlass\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGlassForm\" as \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"
    LEFT JOIN \"public\".\"tblGlassMaterial\" AS \"k\" ON \"i\".\"GlassMaterialID\" = \"k\".\"GlassMaterialID\"
    LEFT join \"public\".\"tblGlassVesselCategory\" AS \"l\" on \"i\".\"GlassVesselCategoryID\" = \"l\".\"GlassVesselCategoryID\"
    LEFT JOIN \"public\".\"tblGlassManuTech\" AS \"m\" ON \"i\".\"GlassManuTechID\" = \"m\".\"GlassManuTechID\"

    #{query}

    UNION ALL


    --Tobacco Pipes--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Tobacco Pipe: '||\"j\".\"TobaccoPipeCompleteness\" AS \"Form\",
    \"k\".\"TobaccoPipeMaterial\" AS \"Material\",
    \"l\".\"TobaccoPipeManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Tobacco Pipe' AS \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblTobaccoPipe\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" as \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"
    left join \"public\".\"tblTobaccoPipeMaterial\" AS \"k\" on	\"i\".\"TobaccoPipeMaterialID\" = \"k\".\"TobaccoPipeMaterialID\"
    left join \"public\".\"tblTobaccoPipeManuTech\" AS \"l\" on	\"i\".\"TobaccoPipeManuTechID\" = \"l\".\"TobaccoPipeManuTechID\"

    #{query}


    UNION ALL

    --Utensils--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Utensil: '||\"j\".\"UtensilForm\" AS \"Form\",
    string_agg(distinct COALESCE(\"m\".\"UtensilMaterial\"), '; ') as \"Material\",
    string_agg(distinct COALESCE(\"l\".\"UtensilManuTech\"), '; ') as \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Utensil' AS \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblUtensil\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblUtensilForm\" as \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"
    left join \"public\".\"tblUtensilSpecific\" as \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    left join \"public\".\"tblUtensilManuTech\" as \"l\" on \"k\".\"UtensilManuTechID\" = \"l\".\"UtensilManuTechID\"
    left join \"public\".\"tblUtensilMaterial\" as \"m\" on \"k\".\"UtensilMaterialID\" = \"m\".\"UtensilMaterialID\"

#{query}

    Group BY
    						\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",					
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    ORDER BY
    \"ProjectName\" ASC,
    \"FeatureGroupNumber\" ASC,
    \"ArtifactType\""

    
  end
  
  def aq_two_feature_number(query)
    "--File Name: AQ2_FeatureNumber_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 25 March 2015 by jeg
    --Artifact Query 2 Feature Number: This file returns detailed data for all artifacts by Feature Number for the DRC Website.

    --Beads--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Bead, '||\"j\".\"BeadShape\" AS \"Form\",
    \"k\".\"BeadMaterial\" AS \"Material\",
    l.\"BeadManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Bead' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBeadShape\" as \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"
    LEFT JOIN \"public\".\"tblBeadMaterial\" AS \"k\" ON i.\"BeadMaterialID\" = \"k\".\"BeadMaterialID\"
    LEFT JOIN \"public\".\"tblBeadManuTech\" AS l ON i.\"BeadManuTechID\" = l.\"BeadManuTechID\"

    #{query}

    UNION ALL

    --Buckles--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Buckle, '||\"j\".\"BuckleType\" AS \"Form\",
    \"o\".\"BuckleMaterial\" AS \"Material\",
    \"p\".\"BuckleManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Buckle' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBuckle\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBuckleType\" as \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"
    left join \"public\".\"tblBuckleForm\" AS \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\" 
    left join \"public\".\"tblBuckleMaterial\" AS \"o\" on \"k\".\"BuckleMaterialID\" = \"o\".\"BuckleMaterialID\" 
    left join \"public\".\"tblBuckleManuTech\" AS \"p\" on \"k\".\"BuckleManuTechID\" = \"p\".\"BuckleManuTechID\" 

    #{query}


    UNION ALL


    --Buttons--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Button, '||\"j\".\"ButtonType\" AS \"Form\",
    \"q\".\"ButtonMaterial\" AS \"Material\",
    \"k\".\"ButtonManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Button' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblButton\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblButtonType\"as \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"

    LEFT JOIN \"public\".\"tblButtonManuTech\" AS \"k\" ON \"i\".\"ButtonManuTechID\" = \"k\".\"ButtonManuTechID\"

    LEFT JOIN \"public\".\"tblButtonMaterial\" AS \"q\" ON \"i\".\"ButtonMaterialID\" = \"q\".\"ButtonMaterialID\"

    #{query}

    UNION ALL


    --Ceramics--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"k\".\"CeramicForm\" AS \"Form\",
    \"m\".\"Ware\" AS \"Material\",
    \"l\".\"CeramicManuTech\" AS \"ManufacturingTechnique\",
    \"j\".\"CeramicVesselCategory\" as \"VesselCategory\",
    string_agg(distinct COALESCE(\"o\".\"CeramicDecTechType\")||', '||COALESCE(\"p\".\"AppliedColorWrittenDescription\"), '; ') as \"CeramicDecTechAppliedColorCombination\",
    \"q\".\"CeramicGenre\" as \"CeramicGenre\",
    'Ceramic' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblCeramic\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    left join \"public\".\"tblCeramicVesselCategory\" AS \"j\" on	\"i\".\"CeramicVesselCategoryID\" = \"j\".\"CeramicVesselCategoryID\"
    left join \"public\".\"tblCeramicForm\" AS \"k\" on	\"i\".\"CeramicFormID\" = \"k\".\"CeramicFormID\"	
    left join \"public\".\"tblCeramicManuTech\" AS \"l\" on	\"i\".\"CeramicManuTechID\" = \"l\".\"CeramicManuTechID\"
    LEFT JOIN \"public\".\"tblCeramicWare\" as \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"
    left join \"public\".\"tblCeramicDecTech\" AS \"n\" on  \"i\".\"ArtifactID\" = \"n\".\"ArtifactID\"
    left join \"public\".\"tblCeramicDecTechType\" AS \"o\" on  \"n\".\"CeramicDecTechTypeID\" = \"o\".\"CeramicDecTechTypeID\"
    left join \"public\".\"tblMunsellAppliedColor\" AS \"p\" on	\"n\".\"MunAppColorID\" = \"p\".\"MunAppColorID\"
    left join \"public\".\"tblCeramicGenre\" AS \"q\" on \"i\".\"CeramicGenreID\" = \"q\".\"CeramicGenreID\"

    #{query}


    Group BY
    						\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"Material\",
    						\"ManufacturingTechnique\",
    						\"VesselCategory\",						
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    UNION ALL
    --Faunal--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"English\" as \"Form\",
    '' AS \"Material\",
    '' AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Faunal' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBone\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBoneTaxon\" as \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"

    #{query}


    UNION ALL

    --General Artifacts--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"GenArtifactForm\" AS \"Form\",
    string_agg(distinct COALESCE(\"l\".\"GenArtifactMaterialType\"), '; ') as \"Material\",
    string_agg(distinct COALESCE(\"m\".\"GenArtifactManuTech\"), '; ') as \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'General Artifacts' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGenArtifact\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGenArtifactForm\" as \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"
    left join \"public\".\"tblGenArtifactMaterial\" as \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    left join \"public\".\"tblGenArtifactMaterialType\" as \"l\" on \"k\".\"GenArtifactMaterialTypeID\" = \"l\".\"GenArtifactMaterialTypeID\"
    left join \"public\".\"tblGenArtifactManuTech\" as \"m\" on \"k\".\"GenArtifactManuTechID\" = \"m\".\"GenArtifactManuTechID\"


    #{query}

    Group BY
    					\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",		
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    UNION ALL

    --Glass--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"GlassForm\" as \"Form\",
    \"k\".\"GlassMaterial\" AS \"Material\",
    \"m\".\"GlassManuTech\" AS \"ManufacturingTechnique\",
    \"l\".\"GlassVesselCategory\" as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Glass' AS \"ArtifactType\",
      a.\"Published\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGlass\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGlassForm\" as \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"
    LEFT JOIN \"public\".\"tblGlassMaterial\" AS \"k\" ON \"i\".\"GlassMaterialID\" = \"k\".\"GlassMaterialID\"
    LEFT join \"public\".\"tblGlassVesselCategory\" AS \"l\" on \"i\".\"GlassVesselCategoryID\" = \"l\".\"GlassVesselCategoryID\"
    LEFT JOIN \"public\".\"tblGlassManuTech\" AS \"m\" ON \"i\".\"GlassManuTechID\" = \"m\".\"GlassManuTechID\"

    #{query}

    UNION ALL


    --Tobacco Pipes--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Tobacco Pipe: '||\"j\".\"TobaccoPipeCompleteness\" AS \"Form\",
    \"k\".\"TobaccoPipeMaterial\" AS \"Material\",
    \"l\".\"TobaccoPipeManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Tobacco Pipe' AS \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblTobaccoPipe\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" as \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"
    left join \"public\".\"tblTobaccoPipeMaterial\" AS \"k\" on	\"i\".\"TobaccoPipeMaterialID\" = \"k\".\"TobaccoPipeMaterialID\"
    left join \"public\".\"tblTobaccoPipeManuTech\" AS \"l\" on	\"i\".\"TobaccoPipeManuTechID\" = \"l\".\"TobaccoPipeManuTechID\"

    #{query}


    UNION ALL

    --Utensils--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Utensil: '||\"j\".\"UtensilForm\" AS \"Form\",
    string_agg(distinct COALESCE(\"m\".\"UtensilMaterial\"), '; ') as \"Material\",
    string_agg(distinct COALESCE(\"l\".\"UtensilManuTech\"), '; ') as \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Utensil' AS \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblUtensil\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblUtensilForm\" as \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"
    left join \"public\".\"tblUtensilSpecific\" as \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    left join \"public\".\"tblUtensilManuTech\" as \"l\" on \"k\".\"UtensilManuTechID\" = \"l\".\"UtensilManuTechID\"
    left join \"public\".\"tblUtensilMaterial\" as \"m\" on \"k\".\"UtensilMaterialID\" = \"m\".\"UtensilMaterialID\"

#{query}

    Group BY
    						\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",					
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    ORDER BY
    \"ProjectName\" ASC,
    \"FeatureNumber\" ASC,
    \"ArtifactType\"  "

    
  end
  
  def aq_two_feature_type(query)
    "--File Name: AQ2_FeatureNumber_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 25 March 2015 by jeg
    --Artifact Query 2 Feature Type: This file returns detailed data for all artifacts by Feature Type for the DRC Website.

    --Beads--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Bead, '||\"j\".\"BeadShape\" AS \"Form\",
    \"k\".\"BeadMaterial\" AS \"Material\",
    l.\"BeadManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Bead' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBeadShape\" as \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"
    LEFT JOIN \"public\".\"tblBeadMaterial\" AS \"k\" ON i.\"BeadMaterialID\" = \"k\".\"BeadMaterialID\"
    LEFT JOIN \"public\".\"tblBeadManuTech\" AS l ON i.\"BeadManuTechID\" = l.\"BeadManuTechID\"

    #{query}


    UNION ALL

    --Buckles--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Buckle, '||\"j\".\"BuckleType\" AS \"Form\",
    \"o\".\"BuckleMaterial\" AS \"Material\",
    \"p\".\"BuckleManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Buckle' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBuckle\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBuckleType\" as \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"
    left join \"public\".\"tblBuckleForm\" AS \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\" 
    left join \"public\".\"tblBuckleMaterial\" AS \"o\" on \"k\".\"BuckleMaterialID\" = \"o\".\"BuckleMaterialID\" 
    left join \"public\".\"tblBuckleManuTech\" AS \"p\" on \"k\".\"BuckleManuTechID\" = \"p\".\"BuckleManuTechID\" 

    #{query}


    UNION ALL


    --Buttons--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Button, '||\"j\".\"ButtonType\" AS \"Form\",
    \"q\".\"ButtonMaterial\" AS \"Material\",
    \"k\".\"ButtonManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Button' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblButton\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblButtonType\"as \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"

    LEFT JOIN \"public\".\"tblButtonManuTech\" AS \"k\" ON \"i\".\"ButtonManuTechID\" = \"k\".\"ButtonManuTechID\"

    LEFT JOIN \"public\".\"tblButtonMaterial\" AS \"q\" ON \"i\".\"ButtonMaterialID\" = \"q\".\"ButtonMaterialID\"

    #{query}

    UNION ALL


    --Ceramics--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"k\".\"CeramicForm\" AS \"Form\",
    \"m\".\"Ware\" AS \"Material\",
    \"l\".\"CeramicManuTech\" AS \"ManufacturingTechnique\",
    \"j\".\"CeramicVesselCategory\" as \"VesselCategory\",
    string_agg(distinct COALESCE(\"o\".\"CeramicDecTechType\")||', '||COALESCE(\"p\".\"AppliedColorWrittenDescription\"), '; ') as \"CeramicDecTechAppliedColorCombination\",
    \"q\".\"CeramicGenre\" as \"CeramicGenre\",
    'Ceramic' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblCeramic\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    left join \"public\".\"tblCeramicVesselCategory\" AS \"j\" on	\"i\".\"CeramicVesselCategoryID\" = \"j\".\"CeramicVesselCategoryID\"
    left join \"public\".\"tblCeramicForm\" AS \"k\" on	\"i\".\"CeramicFormID\" = \"k\".\"CeramicFormID\"	
    left join \"public\".\"tblCeramicManuTech\" AS \"l\" on	\"i\".\"CeramicManuTechID\" = \"l\".\"CeramicManuTechID\"
    LEFT JOIN \"public\".\"tblCeramicWare\" as \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"
    left join \"public\".\"tblCeramicDecTech\" AS \"n\" on  \"i\".\"ArtifactID\" = \"n\".\"ArtifactID\"
    left join \"public\".\"tblCeramicDecTechType\" AS \"o\" on  \"n\".\"CeramicDecTechTypeID\" = \"o\".\"CeramicDecTechTypeID\"
    left join \"public\".\"tblMunsellAppliedColor\" AS \"p\" on	\"n\".\"MunAppColorID\" = \"p\".\"MunAppColorID\"
    left join \"public\".\"tblCeramicGenre\" AS \"q\" on \"i\".\"CeramicGenreID\" = \"q\".\"CeramicGenreID\"

    #{query}

    Group BY
    						\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"Material\",
    						\"ManufacturingTechnique\",
    						\"VesselCategory\",						
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    UNION ALL
    --Faunal--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"English\" as \"Form\",
    '' AS \"Material\",
    '' AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Faunal' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBone\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBoneTaxon\" as \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"

    #{query}


    UNION ALL

    --General Artifacts--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"GenArtifactForm\" AS \"Form\",
    string_agg(distinct COALESCE(\"l\".\"GenArtifactMaterialType\"), '; ') as \"Material\",
    string_agg(distinct COALESCE(\"m\".\"GenArtifactManuTech\"), '; ') as \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'General Artifacts' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGenArtifact\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGenArtifactForm\" as \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"
    left join \"public\".\"tblGenArtifactMaterial\" as \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    left join \"public\".\"tblGenArtifactMaterialType\" as \"l\" on \"k\".\"GenArtifactMaterialTypeID\" = \"l\".\"GenArtifactMaterialTypeID\"
    left join \"public\".\"tblGenArtifactManuTech\" as \"m\" on \"k\".\"GenArtifactManuTechID\" = \"m\".\"GenArtifactManuTechID\"


    #{query}


    Group BY
    					\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",		
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    UNION ALL

    --Glass--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"GlassForm\" as \"Form\",
    \"k\".\"GlassMaterial\" AS \"Material\",
    \"m\".\"GlassManuTech\" AS \"ManufacturingTechnique\",
    \"l\".\"GlassVesselCategory\" as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Glass' AS \"ArtifactType\",
      a.\"Published\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGlass\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGlassForm\" as \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"
    LEFT JOIN \"public\".\"tblGlassMaterial\" AS \"k\" ON \"i\".\"GlassMaterialID\" = \"k\".\"GlassMaterialID\"
    LEFT join \"public\".\"tblGlassVesselCategory\" AS \"l\" on \"i\".\"GlassVesselCategoryID\" = \"l\".\"GlassVesselCategoryID\"
    LEFT JOIN \"public\".\"tblGlassManuTech\" AS \"m\" ON \"i\".\"GlassManuTechID\" = \"m\".\"GlassManuTechID\"

    #{query}

    UNION ALL


    --Tobacco Pipes--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Tobacco Pipe: '||\"j\".\"TobaccoPipeCompleteness\" AS \"Form\",
    \"k\".\"TobaccoPipeMaterial\" AS \"Material\",
    \"l\".\"TobaccoPipeManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Tobacco Pipe' AS \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblTobaccoPipe\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" as \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"
    left join \"public\".\"tblTobaccoPipeMaterial\" AS \"k\" on	\"i\".\"TobaccoPipeMaterialID\" = \"k\".\"TobaccoPipeMaterialID\"
    left join \"public\".\"tblTobaccoPipeManuTech\" AS \"l\" on	\"i\".\"TobaccoPipeManuTechID\" = \"l\".\"TobaccoPipeManuTechID\"

    #{query}


    UNION ALL

    --Utensils--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"f\".\"FeatureType\" AS \"FeatureType\",
    \"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    \"e\".\"FeatureGroup\" AS \"FeatureGroupNumber\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Utensil: '||\"j\".\"UtensilForm\" AS \"Form\",
    string_agg(distinct COALESCE(\"m\".\"UtensilMaterial\"), '; ') as \"Material\",
    string_agg(distinct COALESCE(\"l\".\"UtensilManuTech\"), '; ') as \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Utensil' AS \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblUtensil\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblUtensilForm\" as \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"
    left join \"public\".\"tblUtensilSpecific\" as \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    left join \"public\".\"tblUtensilManuTech\" as \"l\" on \"k\".\"UtensilManuTechID\" = \"l\".\"UtensilManuTechID\"
    left join \"public\".\"tblUtensilMaterial\" as \"m\" on \"k\".\"UtensilMaterialID\" = \"m\".\"UtensilMaterialID\"

#{query}

    Group BY
    						\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",					
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    ORDER BY
    \"ProjectName\" ASC,
    \"FeatureNumber\" ASC,
    \"ArtifactType\"  "

    
  end
  
  def aq_two_phase(query)
    "--File Name: AQ2_Phase_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 25 March 2015 by jeg
    --Artifact Query 2 Phase: This file returns detailed data for all artifacts by Phase for the DRC Website.

    --Beads--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Bead, '||\"j\".\"BeadShape\" AS \"Form\",
    \"k\".\"BeadMaterial\" AS \"Material\",
    l.\"BeadManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Bead' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBeadShape\" as \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"
    LEFT JOIN \"public\".\"tblBeadMaterial\" AS \"k\" ON i.\"BeadMaterialID\" = \"k\".\"BeadMaterialID\"
    LEFT JOIN \"public\".\"tblBeadManuTech\" AS l ON i.\"BeadManuTechID\" = l.\"BeadManuTechID\"

    #{query}

    UNION ALL

    --Buckles--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Buckle, '||\"j\".\"BuckleType\" AS \"Form\",
    \"o\".\"BuckleMaterial\" AS \"Material\",
    \"p\".\"BuckleManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Buckle' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBuckle\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBuckleType\" as \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"
    left join \"public\".\"tblBuckleForm\" AS \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\" 
    left join \"public\".\"tblBuckleMaterial\" AS \"o\" on \"k\".\"BuckleMaterialID\" = \"o\".\"BuckleMaterialID\" 
    left join \"public\".\"tblBuckleManuTech\" AS \"p\" on \"k\".\"BuckleManuTechID\" = \"p\".\"BuckleManuTechID\" 

    #{query}
 

    UNION ALL


    --Buttons--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Button, '||\"j\".\"ButtonType\" AS \"Form\",
    \"q\".\"ButtonMaterial\" AS \"Material\",
    \"k\".\"ButtonManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Button' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblButton\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblButtonType\"as \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"

    LEFT JOIN \"public\".\"tblButtonManuTech\" AS \"k\" ON \"i\".\"ButtonManuTechID\" = \"k\".\"ButtonManuTechID\"

    LEFT JOIN \"public\".\"tblButtonMaterial\" AS \"q\" ON \"i\".\"ButtonMaterialID\" = \"q\".\"ButtonMaterialID\"

    #{query}


    UNION ALL


    --Ceramics--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"k\".\"CeramicForm\" AS \"Form\",
    \"m\".\"Ware\" AS \"Material\",
    \"l\".\"CeramicManuTech\" AS \"ManufacturingTechnique\",
    \"j\".\"CeramicVesselCategory\" as \"VesselCategory\",
    string_agg(distinct COALESCE(\"o\".\"CeramicDecTechType\")||', '||COALESCE(\"p\".\"AppliedColorWrittenDescription\"), '; ') as \"CeramicDecTechAppliedColorCombination\",
    \"q\".\"CeramicGenre\" as \"CeramicGenre\",
    'Ceramic' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblCeramic\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    left join \"public\".\"tblCeramicVesselCategory\" AS \"j\" on	\"i\".\"CeramicVesselCategoryID\" = \"j\".\"CeramicVesselCategoryID\"
    left join \"public\".\"tblCeramicForm\" AS \"k\" on	\"i\".\"CeramicFormID\" = \"k\".\"CeramicFormID\"	
    left join \"public\".\"tblCeramicManuTech\" AS \"l\" on	\"i\".\"CeramicManuTechID\" = \"l\".\"CeramicManuTechID\"
    LEFT JOIN \"public\".\"tblCeramicWare\" as \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"
    left join \"public\".\"tblCeramicDecTech\" AS \"n\" on  \"i\".\"ArtifactID\" = \"n\".\"ArtifactID\"
    left join \"public\".\"tblCeramicDecTechType\" AS \"o\" on  \"n\".\"CeramicDecTechTypeID\" = \"o\".\"CeramicDecTechTypeID\"
    left join \"public\".\"tblMunsellAppliedColor\" AS \"p\" on	\"n\".\"MunAppColorID\" = \"p\".\"MunAppColorID\"
    left join \"public\".\"tblCeramicGenre\" AS \"q\" on \"i\".\"CeramicGenreID\" = \"q\".\"CeramicGenreID\"

    #{query}

    Group BY
    						\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"Material\",
    						\"ManufacturingTechnique\",
    						\"VesselCategory\",						
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    UNION ALL
    --Faunal--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"English\" as \"Form\",
    '' AS \"Material\",
    '' AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Faunal' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBone\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBoneTaxon\" as \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"

    #{query}
 
    UNION ALL

    --General Artifacts--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"GenArtifactForm\" AS \"Form\",
    string_agg(distinct COALESCE(\"l\".\"GenArtifactMaterialType\"), '; ') as \"Material\",
    string_agg(distinct COALESCE(\"m\".\"GenArtifactManuTech\"), '; ') as \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'General Artifacts' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGenArtifact\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGenArtifactForm\" as \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"
    left join \"public\".\"tblGenArtifactMaterial\" as \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    left join \"public\".\"tblGenArtifactMaterialType\" as \"l\" on \"k\".\"GenArtifactMaterialTypeID\" = \"l\".\"GenArtifactMaterialTypeID\"
    left join \"public\".\"tblGenArtifactManuTech\" as \"m\" on \"k\".\"GenArtifactManuTechID\" = \"m\".\"GenArtifactManuTechID\"


    #{query}


    Group BY
    					\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",		
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    UNION ALL

    --Glass--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"GlassForm\" as \"Form\",
    \"k\".\"GlassMaterial\" AS \"Material\",
    \"m\".\"GlassManuTech\" AS \"ManufacturingTechnique\",
    \"l\".\"GlassVesselCategory\" as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Glass' AS \"ArtifactType\",
      a.\"Published\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGlass\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGlassForm\" as \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"
    LEFT JOIN \"public\".\"tblGlassMaterial\" AS \"k\" ON \"i\".\"GlassMaterialID\" = \"k\".\"GlassMaterialID\"
    LEFT join \"public\".\"tblGlassVesselCategory\" AS \"l\" on \"i\".\"GlassVesselCategoryID\" = \"l\".\"GlassVesselCategoryID\"
    LEFT JOIN \"public\".\"tblGlassManuTech\" AS \"m\" ON \"i\".\"GlassManuTechID\" = \"m\".\"GlassManuTechID\"

    #{query}

    UNION ALL


    --Tobacco Pipes--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Tobacco Pipe: '||\"j\".\"TobaccoPipeCompleteness\" AS \"Form\",
    \"k\".\"TobaccoPipeMaterial\" AS \"Material\",
    \"l\".\"TobaccoPipeManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Tobacco Pipe' AS \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblTobaccoPipe\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" as \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"
    left join \"public\".\"tblTobaccoPipeMaterial\" AS \"k\" on	\"i\".\"TobaccoPipeMaterialID\" = \"k\".\"TobaccoPipeMaterialID\"
    left join \"public\".\"tblTobaccoPipeManuTech\" AS \"l\" on	\"i\".\"TobaccoPipeManuTechID\" = \"l\".\"TobaccoPipeManuTechID\"

    #{query}
   
    UNION ALL

    --Utensils--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Utensil: '||\"j\".\"UtensilForm\" AS \"Form\",
    string_agg(distinct COALESCE(\"m\".\"UtensilMaterial\"), '; ') as \"Material\",
    string_agg(distinct COALESCE(\"l\".\"UtensilManuTech\"), '; ') as \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Utensil' AS \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblUtensil\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblUtensilForm\" as \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"
    left join \"public\".\"tblUtensilSpecific\" as \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    left join \"public\".\"tblUtensilManuTech\" as \"l\" on \"k\".\"UtensilManuTechID\" = \"l\".\"UtensilManuTechID\"
    left join \"public\".\"tblUtensilMaterial\" as \"m\" on \"k\".\"UtensilMaterialID\" = \"m\".\"UtensilMaterialID\"

#{query}

    Group BY
    						\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",					
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    ORDER BY
    \"ProjectName\" ASC,
    \"DAACSPhase\" ASC,
    \"ArtifactType\"  "

    
  end
  
  def aq_two_strat_group(query)
    "--File Name: AQ2_SG_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 25 March 2015 by jeg
    --Artifact Query 2 Stratigraphic Group: This file returns detailed data for all artifacts by SGs for the DRC Website.

    --Beads--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Bead, '||\"j\".\"BeadShape\" AS \"Form\",
    \"k\".\"BeadMaterial\" AS \"Material\",
    l.\"BeadManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Bead' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBeadShape\" as \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"
    LEFT JOIN \"public\".\"tblBeadMaterial\" AS \"k\" ON i.\"BeadMaterialID\" = \"k\".\"BeadMaterialID\"
    LEFT JOIN \"public\".\"tblBeadManuTech\" AS l ON i.\"BeadManuTechID\" = l.\"BeadManuTechID\"

    #{query}


    UNION ALL

    --Buckles--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Buckle, '||\"j\".\"BuckleType\" AS \"Form\",
    \"o\".\"BuckleMaterial\" AS \"Material\",
    \"p\".\"BuckleManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Buckle' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBuckle\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBuckleType\" as \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"
    left join \"public\".\"tblBuckleForm\" AS \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\" 
    left join \"public\".\"tblBuckleMaterial\" AS \"o\" on \"k\".\"BuckleMaterialID\" = \"o\".\"BuckleMaterialID\" 
    left join \"public\".\"tblBuckleManuTech\" AS \"p\" on \"k\".\"BuckleManuTechID\" = \"p\".\"BuckleManuTechID\" 

    #{query}

    UNION ALL


    --Buttons--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Button, '||\"j\".\"ButtonType\" AS \"Form\",
    \"q\".\"ButtonMaterial\" AS \"Material\",
    \"k\".\"ButtonManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Button' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblButton\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblButtonType\"as \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"

    LEFT JOIN \"public\".\"tblButtonManuTech\" AS \"k\" ON \"i\".\"ButtonManuTechID\" = \"k\".\"ButtonManuTechID\"

    LEFT JOIN \"public\".\"tblButtonMaterial\" AS \"q\" ON \"i\".\"ButtonMaterialID\" = \"q\".\"ButtonMaterialID\"

    #{query}


    UNION ALL


    --Ceramics--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"k\".\"CeramicForm\" AS \"Form\",
    \"m\".\"Ware\" AS \"Material\",
    \"l\".\"CeramicManuTech\" AS \"ManufacturingTechnique\",
    \"j\".\"CeramicVesselCategory\" as \"VesselCategory\",
    string_agg(distinct COALESCE(\"o\".\"CeramicDecTechType\")||', '||COALESCE(\"p\".\"AppliedColorWrittenDescription\"), '; ') as \"CeramicDecTechAppliedColorCombination\",
    \"q\".\"CeramicGenre\" as \"CeramicGenre\",
    'Ceramic' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblCeramic\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    left join \"public\".\"tblCeramicVesselCategory\" AS \"j\" on	\"i\".\"CeramicVesselCategoryID\" = \"j\".\"CeramicVesselCategoryID\"
    left join \"public\".\"tblCeramicForm\" AS \"k\" on	\"i\".\"CeramicFormID\" = \"k\".\"CeramicFormID\"	
    left join \"public\".\"tblCeramicManuTech\" AS \"l\" on	\"i\".\"CeramicManuTechID\" = \"l\".\"CeramicManuTechID\"
    LEFT JOIN \"public\".\"tblCeramicWare\" as \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"
    left join \"public\".\"tblCeramicDecTech\" AS \"n\" on  \"i\".\"ArtifactID\" = \"n\".\"ArtifactID\"
    left join \"public\".\"tblCeramicDecTechType\" AS \"o\" on  \"n\".\"CeramicDecTechTypeID\" = \"o\".\"CeramicDecTechTypeID\"
    left join \"public\".\"tblMunsellAppliedColor\" AS \"p\" on	\"n\".\"MunAppColorID\" = \"p\".\"MunAppColorID\"
    left join \"public\".\"tblCeramicGenre\" AS \"q\" on \"i\".\"CeramicGenreID\" = \"q\".\"CeramicGenreID\"

    #{query}


    Group BY
    						\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"Material\",
    						\"ManufacturingTechnique\",
    						\"VesselCategory\",						
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    UNION ALL
    --Faunal--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"English\" as \"Form\",
    '' AS \"Material\",
    '' AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Faunal' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBone\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBoneTaxon\" as \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"

    #{query}


    UNION ALL

    --General Artifacts--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"GenArtifactForm\" AS \"Form\",
    string_agg(distinct COALESCE(\"l\".\"GenArtifactMaterialType\"), '; ') as \"Material\",
    string_agg(distinct COALESCE(\"m\".\"GenArtifactManuTech\"), '; ') as \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' as \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'General Artifacts' as \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGenArtifact\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGenArtifactForm\" as \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"
    left join \"public\".\"tblGenArtifactMaterial\" as \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    left join \"public\".\"tblGenArtifactMaterialType\" as \"l\" on \"k\".\"GenArtifactMaterialTypeID\" = \"l\".\"GenArtifactMaterialTypeID\"
    left join \"public\".\"tblGenArtifactManuTech\" as \"m\" on \"k\".\"GenArtifactManuTechID\" = \"m\".\"GenArtifactManuTechID\"


    #{query}
 

    Group BY
    					\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",		
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    UNION ALL

    --Glass--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    \"j\".\"GlassForm\" as \"Form\",
    \"k\".\"GlassMaterial\" AS \"Material\",
    \"m\".\"GlassManuTech\" AS \"ManufacturingTechnique\",
    \"l\".\"GlassVesselCategory\" as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Glass' AS \"ArtifactType\",
      a.\"Published\"


    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblGlass\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblGlassForm\" as \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"
    LEFT JOIN \"public\".\"tblGlassMaterial\" AS \"k\" ON \"i\".\"GlassMaterialID\" = \"k\".\"GlassMaterialID\"
    LEFT join \"public\".\"tblGlassVesselCategory\" AS \"l\" on \"i\".\"GlassVesselCategoryID\" = \"l\".\"GlassVesselCategoryID\"
    LEFT JOIN \"public\".\"tblGlassManuTech\" AS \"m\" ON \"i\".\"GlassManuTechID\" = \"m\".\"GlassManuTechID\"

    #{query}
 

    UNION ALL


    --Tobacco Pipes--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Tobacco Pipe: '||\"j\".\"TobaccoPipeCompleteness\" AS \"Form\",
    \"k\".\"TobaccoPipeMaterial\" AS \"Material\",
    \"l\".\"TobaccoPipeManuTech\" AS \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Tobacco Pipe' AS \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblTobaccoPipe\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" as \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"
    left join \"public\".\"tblTobaccoPipeMaterial\" AS \"k\" on	\"i\".\"TobaccoPipeMaterialID\" = \"k\".\"TobaccoPipeMaterialID\"
    left join \"public\".\"tblTobaccoPipeManuTech\" AS \"l\" on	\"i\".\"TobaccoPipeManuTechID\" = \"l\".\"TobaccoPipeManuTechID\"

    #{query}


    UNION ALL

    --Utensils--

    SELECT
    \"b\".\"ProjectName\" AS \"ProjectName\",
    \"a\".\"ProjectID\" AS \"ProjectID\",
    \"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    \"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    \"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    \"i\".\"ArtifactID\" AS \"ArtifactID\",
    \"i\".\"Quantity\" AS \"Quantity\",
    'Utensil: '||\"j\".\"UtensilForm\" AS \"Form\",
    string_agg(distinct COALESCE(\"m\".\"UtensilMaterial\"), '; ') as \"Material\",
    string_agg(distinct COALESCE(\"l\".\"UtensilManuTech\"), '; ') as \"ManufacturingTechnique\",
    '' as \"VesselCategory\",
    '' AS \"CeramicDecTechAppliedColorCombination\",
    '' as \"CeramicGenre\",
    'Utensil' AS \"ArtifactType\",
      a.\"Published\"

    FROM
    \"public\".\"tblProject\" AS \"a\" 
    left join \"public\".\"tblProjectName\" AS \"b\" on \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    inner join \"public\".\"tblContext\" AS \"c\" on \"a\".\"ProjectID\" = \"c\".\"ProjectID\"	
    left join \"public\".\"tblContextUnitType\" AS \"d\"	on \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    left join \"public\".\"tblContextFeature\" AS	\"e\"	on \"c\".\"ProjectID\" = \"e\".\"ProjectID\" and \"c\".\"FeatureNumber\"=\"e\".\"FeatureNumber\"
    left join \"public\".\"tblContextFeatureType\" AS	\"f\"	on \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    inner join \"public\".\"tblContextSample\" AS \"g\" on \"c\".\"ContextID\" = \"g\".\"ContextID\"
    inner join \"public\".\"tblGenerateContextArtifactID\" AS \"h\" on \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblUtensil\" as \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblUtensilForm\" as \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"
    left join \"public\".\"tblUtensilSpecific\" as \"k\" on \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    left join \"public\".\"tblUtensilManuTech\" as \"l\" on \"k\".\"UtensilManuTechID\" = \"l\".\"UtensilManuTechID\"
    left join \"public\".\"tblUtensilMaterial\" as \"m\" on \"k\".\"UtensilMaterialID\" = \"m\".\"UtensilMaterialID\"

#{query}

    Group BY
    						\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",					
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    ORDER BY
    \"ProjectName\" ASC,
    \"DAACSStratigraphicGroup\" ASC,
    \"ArtifactType\"  "

    
  end
  
  def aq_two_site(query)
    "--File Name: AQ2_DRC_Site_Done
    --Created by: Jillian Galle
    --Last Updated: 25 March 2015 by jeg
    --Artifact Query 2 Site: This file returns detailed data for all artifacts by site for the DRC Website.

    --Beads--
    SELECT
    	\"b\".\"ProjectName\" AS \"ProjectName\",
    	\"a\".\"ProjectID\" AS \"ProjectID\",
    	\"c\".\"Context\" AS \"Context\",
    	\"cc\".\"DepositType\" AS \"DepositType\",
    	\"d\".\"UnitType\" AS \"UnitType\",
    	\"f\".\"FeatureType\" AS \"FeatureType\",
    	\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    	\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    	\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    	\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    	\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    	\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    	\"i\".\"ArtifactID\" AS \"ArtifactID\",
    	\"i\".\"Quantity\" AS \"Quantity\",
    	'Bead, ' || \"j\".\"BeadShape\" AS \"Form\",
    	\"k\".\"BeadMaterial\" AS \"Material\",
    	l.\"BeadManuTech\" AS \"ManufacturingTechnique\",
    	'' AS \"VesselCategory\",
    	'' AS \"CeramicDecTechAppliedColorCombination\",
    	'' AS \"CeramicGenre\",
    	'Bead' AS \"ArtifactType\",
      a.\"Published\"
    FROM
    	\"public\".\"tblProject\" AS \"a\"
    LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBeadShape\" AS \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"
    LEFT JOIN \"public\".\"tblBeadMaterial\" AS \"k\" ON i.\"BeadMaterialID\" = \"k\".\"BeadMaterialID\"
    LEFT JOIN \"public\".\"tblBeadManuTech\" AS l ON i.\"BeadManuTechID\" = l.\"BeadManuTechID\"

    #{query}
		

    UNION ALL
    	--Buckles--
    	SELECT
    		\"b\".\"ProjectName\" AS \"ProjectName\",
    		\"a\".\"ProjectID\" AS \"ProjectID\",
    		\"c\".\"Context\" AS \"Context\",
    		\"cc\".\"DepositType\" AS \"DepositType\",
    		\"d\".\"UnitType\" AS \"UnitType\",
    		\"f\".\"FeatureType\" AS \"FeatureType\",
    		\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    		\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    		\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    		\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    		\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    		\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    		\"i\".\"ArtifactID\" AS \"ArtifactID\",
    		\"i\".\"Quantity\" AS \"Quantity\",
    		'Buckle, ' || \"j\".\"BuckleType\" AS \"Form\",
    		\"o\".\"BuckleMaterial\" AS \"Material\",
    		\"p\".\"BuckleManuTech\" AS \"ManufacturingTechnique\",
    		'' AS \"VesselCategory\",
    		'' AS \"CeramicDecTechAppliedColorCombination\",
    		'' AS \"CeramicGenre\",
    		'Buckle' AS \"ArtifactType\",
      a.\"Published\"
    	FROM
    		\"public\".\"tblProject\" AS \"a\"
    	LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    	INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    	LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    	LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    	LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    	AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    	LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    	INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    	INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    	INNER JOIN \"public\".\"tblBuckle\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    	LEFT JOIN \"public\".\"tblBuckleType\" AS \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"
    	LEFT JOIN \"public\".\"tblBuckleForm\" AS \"k\" ON \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    	LEFT JOIN \"public\".\"tblBuckleMaterial\" AS \"o\" ON \"k\".\"BuckleMaterialID\" = \"o\".\"BuckleMaterialID\"
    	LEFT JOIN \"public\".\"tblBuckleManuTech\" AS \"p\" ON \"k\".\"BuckleManuTechID\" = \"p\".\"BuckleManuTechID\"
	
      #{query}

    UNION ALL

    		--Buttons--
    		SELECT
    			\"b\".\"ProjectName\" AS \"ProjectName\",
    			\"a\".\"ProjectID\" AS \"ProjectID\",
    			\"c\".\"Context\" AS \"Context\",
    			\"cc\".\"DepositType\" AS \"DepositType\",
    			\"d\".\"UnitType\" AS \"UnitType\",
    			\"f\".\"FeatureType\" AS \"FeatureType\",
    			\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    			\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    			\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    			\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    			\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    			\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    			\"i\".\"ArtifactID\" AS \"ArtifactID\",
    			\"i\".\"Quantity\" AS \"Quantity\",
    			'Button, ' || \"j\".\"ButtonType\" AS \"Form\",
    			\"q\".\"ButtonMaterial\" AS \"Material\",
    			\"k\".\"ButtonManuTech\" AS \"ManufacturingTechnique\",
    			'' AS \"VesselCategory\",
    			'' AS \"CeramicDecTechAppliedColorCombination\",
    			'' AS \"CeramicGenre\",
    			'Button' AS \"ArtifactType\",
      a.\"Published\"
    		FROM
    			\"public\".\"tblProject\" AS \"a\"
    		LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    		INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    		LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    		LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    		LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    		AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    		LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    		INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    		INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    		INNER JOIN \"public\".\"tblButton\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    		LEFT JOIN \"public\".\"tblButtonType\" AS \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"
    		LEFT JOIN \"public\".\"tblButtonManuTech\" AS \"k\" ON \"i\".\"ButtonManuTechID\" = \"k\".\"ButtonManuTechID\"
    		LEFT JOIN \"public\".\"tblButtonMaterial\" AS \"q\" ON \"i\".\"ButtonMaterialID\" = \"q\".\"ButtonMaterialID\"

        #{query}
		

    UNION ALL

    --Ceramics--
    			SELECT
    				\"b\".\"ProjectName\" AS \"ProjectName\",
    				\"a\".\"ProjectID\" AS \"ProjectID\",
    				\"c\".\"Context\" AS \"Context\",
    				\"cc\".\"DepositType\" AS \"DepositType\",
    				\"d\".\"UnitType\" AS \"UnitType\",
    				\"f\".\"FeatureType\" AS \"FeatureType\",
    				\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    				\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    				\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    				\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    				\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    				\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    				\"i\".\"ArtifactID\" AS \"ArtifactID\",
    				\"i\".\"Quantity\" AS \"Quantity\",
    				\"k\".\"CeramicForm\" AS \"Form\",
    				\"m\".\"Ware\" AS \"Material\",
    				\"l\".\"CeramicManuTech\" AS \"ManufacturingTechnique\",
    				\"j\".\"CeramicVesselCategory\" AS \"VesselCategory\",
    				string_agg (
    					DISTINCT COALESCE (\"o\".\"CeramicDecTechType\") || ', ' || COALESCE (
    						\"p\".\"AppliedColorWrittenDescription\"
    					),
    					'; '
    				) AS \"CeramicDecTechAppliedColorCombination\",
    				\"q\".\"CeramicGenre\" AS \"CeramicGenre\",
    				'Ceramic' AS \"ArtifactType\",
      a.\"Published\"

    			FROM
    				\"public\".\"tblProject\" AS \"a\"
    			LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    			INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    			LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    			LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    			LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    			AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    			LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    			INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    			INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    			INNER JOIN \"public\".\"tblCeramic\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    			LEFT JOIN \"public\".\"tblCeramicVesselCategory\" AS \"j\" ON \"i\".\"CeramicVesselCategoryID\" = \"j\".\"CeramicVesselCategoryID\"
    			LEFT JOIN \"public\".\"tblCeramicForm\" AS \"k\" ON \"i\".\"CeramicFormID\" = \"k\".\"CeramicFormID\"
    			LEFT JOIN \"public\".\"tblCeramicManuTech\" AS \"l\" ON \"i\".\"CeramicManuTechID\" = \"l\".\"CeramicManuTechID\"
    			LEFT JOIN \"public\".\"tblCeramicWare\" AS \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"
    			LEFT JOIN \"public\".\"tblCeramicDecTech\" AS \"n\" ON \"i\".\"ArtifactID\" = \"n\".\"ArtifactID\"
    			LEFT JOIN \"public\".\"tblCeramicDecTechType\" AS \"o\" ON \"n\".\"CeramicDecTechTypeID\" = \"o\".\"CeramicDecTechTypeID\"
    			LEFT JOIN \"public\".\"tblMunsellAppliedColor\" AS \"p\" ON \"n\".\"MunAppColorID\" = \"p\".\"MunAppColorID\"
    			LEFT JOIN \"public\".\"tblCeramicGenre\" AS \"q\" ON \"i\".\"CeramicGenreID\" = \"q\".\"CeramicGenreID\"
			
          #{query}


    GROUP BY
    					\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"Context\",
    						\"cc\".\"DepositType\",
    						\"d\".\"UnitType\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"Material\",
    						\"ManufacturingTechnique\",
    						\"VesselCategory\",						
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    			UNION ALL

    				--Faunal--
    				SELECT
    					\"b\".\"ProjectName\" AS \"ProjectName\",
    					\"a\".\"ProjectID\" AS \"ProjectID\",
    					\"c\".\"Context\" AS \"Context\",
    					\"cc\".\"DepositType\" AS \"DepositType\",
    					\"d\".\"UnitType\" AS \"UnitType\",
    					\"f\".\"FeatureType\" AS \"FeatureType\",
    					\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    					\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    					\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    					\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    					\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    					\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    					\"i\".\"ArtifactID\" AS \"ArtifactID\",
    					\"i\".\"Quantity\" AS \"Quantity\",
    					\"j\".\"English\" AS \"Form\",
    					'' AS \"VesselCategory\",
    					'' AS \"Material\",
    					'' AS \"ManufacturingTechnique\",
    					'' AS \"CeramicDecTechAppliedColorCombination\",
    					'' AS \"CeramicGenre\",
    					'Faunal' AS \"ArtifactType\",
      a.\"Published\"
    				FROM
    					\"public\".\"tblProject\" AS \"a\"
    				LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    				INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    				LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    				LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    				LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    				AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    				LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    				INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    				INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    				INNER JOIN \"public\".\"tblBone\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    				LEFT JOIN \"public\".\"tblBoneTaxon\" AS \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"
				
            #{query}
 

    UNION ALL

    --General Artifacts--
    					SELECT
    						\"b\".\"ProjectName\" AS \"ProjectName\",
    						\"a\".\"ProjectID\" AS \"ProjectID\",
    						\"c\".\"Context\" AS \"Context\",
    						\"cc\".\"DepositType\" AS \"DepositType\",
    						\"d\".\"UnitType\" AS \"UnitType\",
    						\"f\".\"FeatureType\" AS \"FeatureType\",
    						\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    						\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    						\"i\".\"ArtifactID\" AS \"ArtifactID\",
    						\"i\".\"Quantity\" AS \"Quantity\",
    						\"j\".\"GenArtifactForm\" AS \"Form\",
    						string_agg (
    							DISTINCT COALESCE (
    								\"l\".\"GenArtifactMaterialType\"
    							),
    							'; '
    						) AS \"Material\",
    						string_agg (
    							DISTINCT COALESCE (\"m\".\"GenArtifactManuTech\"),
    							'; '
    						) AS \"ManufacturingTechnique\",
    						'' AS \"VesselCategory\",
    						'' AS \"CeramicDecTechAppliedColorCombination\",
    						'' AS \"CeramicGenre\",
    						'General Artifacts' AS \"ArtifactType\",
      a.\"Published\"
    					FROM
    						\"public\".\"tblProject\" AS \"a\"
    					LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    					INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    					LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    					LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    					LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    					AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    					LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    					INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    					INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    					INNER JOIN \"public\".\"tblGenArtifact\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    					LEFT JOIN \"public\".\"tblGenArtifactForm\" AS \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"
    					LEFT JOIN \"public\".\"tblGenArtifactMaterial\" AS \"k\" ON \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    					LEFT JOIN \"public\".\"tblGenArtifactMaterialType\" AS \"l\" ON \"k\".\"GenArtifactMaterialTypeID\" = \"l\".\"GenArtifactMaterialTypeID\"
    					LEFT JOIN \"public\".\"tblGenArtifactManuTech\" AS \"m\" ON \"k\".\"GenArtifactManuTechID\" = \"m\".\"GenArtifactManuTechID\"
					
              #{query}
				
    GROUP BY
    						\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"Context\",
    						\"cc\".\"DepositType\",
    						\"d\".\"UnitType\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"


    UNION ALL

    --Glass--
    						SELECT
    							\"b\".\"ProjectName\" AS \"ProjectName\",
    							\"a\".\"ProjectID\" AS \"ProjectID\",
    							\"c\".\"Context\" AS \"Context\",
    							\"cc\".\"DepositType\" AS \"DepositType\",
    							\"d\".\"UnitType\" AS \"UnitType\",
    							\"f\".\"FeatureType\" AS \"FeatureType\",
    							\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    							\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    							\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    							\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    							\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    							\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    							\"i\".\"ArtifactID\" AS \"ArtifactID\",
    							\"i\".\"Quantity\" AS \"Quantity\",
    							\"j\".\"GlassForm\" AS \"Form\",
    							\"k\".\"GlassMaterial\" AS \"Material\",
    							\"m\".\"GlassManuTech\" AS \"ManufacturingTechnique\",
    							\"l\".\"GlassVesselCategory\" AS \"VesselCategory\",				
							
    							'' AS \"CeramicDecTechAppliedColorCombination\",
    							'' AS \"CeramicGenre\",
    							'Glass' AS \"ArtifactType\",
      a.\"Published\"
    						FROM
    							\"public\".\"tblProject\" AS \"a\"
    						LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    						INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    						LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    						LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    						LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    						AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    						LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    						INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    						INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    						INNER JOIN \"public\".\"tblGlass\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    						LEFT JOIN \"public\".\"tblGlassForm\" AS \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"
    						LEFT JOIN \"public\".\"tblGlassMaterial\" AS \"k\" ON \"i\".\"GlassMaterialID\" = \"k\".\"GlassMaterialID\"
    						LEFT JOIN \"public\".\"tblGlassVesselCategory\" AS \"l\" ON \"i\".\"GlassVesselCategoryID\" = \"l\".\"GlassVesselCategoryID\"
    						LEFT JOIN \"public\".\"tblGlassManuTech\" AS \"m\" ON \"i\".\"GlassManuTechID\" = \"m\".\"GlassManuTechID\"
					
                #{query}
		

    UNION ALL
							
    --Tobacco Pipes--
    							SELECT
    								\"b\".\"ProjectName\" AS \"ProjectName\",
    								\"a\".\"ProjectID\" AS \"ProjectID\",
    								\"c\".\"Context\" AS \"Context\",
    								\"cc\".\"DepositType\" AS \"DepositType\",
    								\"d\".\"UnitType\" AS \"UnitType\",
    								\"f\".\"FeatureType\" AS \"FeatureType\",
    								\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    								\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    								\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    								\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    								\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    								\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    								\"i\".\"ArtifactID\" AS \"ArtifactID\",
    								\"i\".\"Quantity\" AS \"Quantity\",
    								'Tobacco Pipe: ' || \"j\".\"TobaccoPipeCompleteness\" AS \"Form\",
    								\"k\".\"TobaccoPipeMaterial\" AS \"Material\",
    								\"l\".\"TobaccoPipeManuTech\" AS \"ManufacturingTechnique\",
    								'' AS \"VesselCategory\",					
								
    								'' AS \"CeramicDecTechAppliedColorCombination\",
    								'' AS \"CeramicGenre\",
    								'Tobacco Pipe' AS \"ArtifactType\",
      a.\"Published\"

    							FROM
    								\"public\".\"tblProject\" AS \"a\"
    							LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    							INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    							LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    							LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    							LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    							AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    							LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    							INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    							INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    							INNER JOIN \"public\".\"tblTobaccoPipe\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    							LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" AS \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"
    							LEFT JOIN \"public\".\"tblTobaccoPipeMaterial\" AS \"k\" ON \"i\".\"TobaccoPipeMaterialID\" = \"k\".\"TobaccoPipeMaterialID\"
    							LEFT JOIN \"public\".\"tblTobaccoPipeManuTech\" AS \"l\" ON \"i\".\"TobaccoPipeManuTechID\" = \"l\".\"TobaccoPipeManuTechID\"

#{query}

    UNION ALL
							

    	--Utensils--
    								SELECT
    									\"b\".\"ProjectName\" AS \"ProjectName\",
    									\"a\".\"ProjectID\" AS \"ProjectID\",
    									\"c\".\"Context\" AS \"Context\",
    									\"cc\".\"DepositType\" AS \"DepositType\",
    									\"d\".\"UnitType\" AS \"UnitType\",
    									\"f\".\"FeatureType\" AS \"FeatureType\",
    									\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    									\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    									\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    									\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    									\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    									\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    									\"i\".\"ArtifactID\" AS \"ArtifactID\",
    									\"i\".\"Quantity\" AS \"Quantity\",
    									'Utensil: ' || \"j\".\"UtensilForm\" AS \"Form\",
    									string_agg (
    										DISTINCT COALESCE (\"m\".\"UtensilMaterial\"),
    										'; '
    									) AS \"Material\",
    									string_agg (
    										DISTINCT COALESCE (\"l\".\"UtensilManuTech\"),
    										'; '
    									) AS \"ManufacturingTechnique\",
    									'' AS \"VesselCategory\",
    									'' AS \"CeramicDecTechAppliedColorCombination\",
    									'' AS \"CeramicGenre\",
    									'Utensil' AS \"ArtifactType\",
      a.\"Published\"
    								FROM
    									\"public\".\"tblProject\" AS \"a\"
    								LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    								INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    								LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    								LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    								LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    								AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    								LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    								INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    								INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    								INNER JOIN \"public\".\"tblUtensil\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    								LEFT JOIN \"public\".\"tblUtensilForm\" AS \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"
    								LEFT JOIN \"public\".\"tblUtensilSpecific\" AS \"k\" ON \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    								LEFT JOIN \"public\".\"tblUtensilManuTech\" AS \"l\" ON \"k\".\"UtensilManuTechID\" = \"l\".\"UtensilManuTechID\"
    								LEFT JOIN \"public\".\"tblUtensilMaterial\" AS \"m\" ON \"k\".\"UtensilMaterialID\" = \"m\".\"UtensilMaterialID\"

#{query}

    GROUP BY
    									\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"Context\",
    						\"cc\".\"DepositType\",
    						\"d\".\"UnitType\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
      a.\"Published\"

    ORDER BY
    \"ProjectName\" ASC,
    \"ArtifactType\""
  end
  
  def aq_two_unit_type(query)
    "--File Name: AQ2_UnitType_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 25 March 2015 by jeg
    --Artifact Query 2 Unit Type: This file returns detailed data for all artifacts by Unit Type for the DRC Website.

    --Beads--
    SELECT
    	\"b\".\"ProjectName\" AS \"ProjectName\",
    	\"a\".\"ProjectID\" AS \"ProjectID\",
    	\"c\".\"Context\" AS \"Context\",
    	\"cc\".\"DepositType\" AS \"DepositType\",
    	\"d\".\"UnitType\" AS \"UnitType\",
    	\"f\".\"FeatureType\" AS \"FeatureType\",
    	\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    	\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    	\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    	\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    	\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    	\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    	\"i\".\"ArtifactID\" AS \"ArtifactID\",
    	\"i\".\"Quantity\" AS \"Quantity\",
    	'Bead, ' || \"j\".\"BeadShape\" AS \"Form\",
    	\"k\".\"BeadMaterial\" AS \"Material\",
    	l.\"BeadManuTech\" AS \"ManufacturingTechnique\",
    	'' AS \"VesselCategory\",
    	'' AS \"CeramicDecTechAppliedColorCombination\",
    	'' AS \"CeramicGenre\",
    	'Bead' AS \"ArtifactType\",
    	a.\"Published\"
    FROM
    	\"public\".\"tblProject\" AS \"a\"
    LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBeadShape\" AS \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"
    LEFT JOIN \"public\".\"tblBeadMaterial\" AS \"k\" ON i.\"BeadMaterialID\" = \"k\".\"BeadMaterialID\"
    LEFT JOIN \"public\".\"tblBeadManuTech\" AS l ON i.\"BeadManuTechID\" = l.\"BeadManuTechID\"

    #{query}		


    UNION ALL
    	--Buckles--
    	SELECT
    		\"b\".\"ProjectName\" AS \"ProjectName\",
    		\"a\".\"ProjectID\" AS \"ProjectID\",
    		\"c\".\"Context\" AS \"Context\",
    		\"cc\".\"DepositType\" AS \"DepositType\",
    		\"d\".\"UnitType\" AS \"UnitType\",
    		\"f\".\"FeatureType\" AS \"FeatureType\",
    		\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    		\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    		\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    		\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    		\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    		\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    		\"i\".\"ArtifactID\" AS \"ArtifactID\",
    		\"i\".\"Quantity\" AS \"Quantity\",
    		'Buckle, ' || \"j\".\"BuckleType\" AS \"Form\",
    		\"o\".\"BuckleMaterial\" AS \"Material\",
    		\"p\".\"BuckleManuTech\" AS \"ManufacturingTechnique\",
    		'' AS \"VesselCategory\",
    		'' AS \"CeramicDecTechAppliedColorCombination\",
    		'' AS \"CeramicGenre\",
    		'Buckle' AS \"ArtifactType\",
    	a.\"Published\"
    	FROM
    		\"public\".\"tblProject\" AS \"a\"
    	LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    	INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    	LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    	LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    	LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    	AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    	LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    	INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    	INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    	INNER JOIN \"public\".\"tblBuckle\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    	LEFT JOIN \"public\".\"tblBuckleType\" AS \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"
    	LEFT JOIN \"public\".\"tblBuckleForm\" AS \"k\" ON \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    	LEFT JOIN \"public\".\"tblBuckleMaterial\" AS \"o\" ON \"k\".\"BuckleMaterialID\" = \"o\".\"BuckleMaterialID\"
    	LEFT JOIN \"public\".\"tblBuckleManuTech\" AS \"p\" ON \"k\".\"BuckleManuTechID\" = \"p\".\"BuckleManuTechID\"
	
      #{query}		
				
    UNION ALL

    		--Buttons--
    		SELECT
    			\"b\".\"ProjectName\" AS \"ProjectName\",
    			\"a\".\"ProjectID\" AS \"ProjectID\",
    			\"c\".\"Context\" AS \"Context\",
    			\"cc\".\"DepositType\" AS \"DepositType\",
    			\"d\".\"UnitType\" AS \"UnitType\",
    			\"f\".\"FeatureType\" AS \"FeatureType\",
    			\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    			\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    			\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    			\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    			\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    			\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    			\"i\".\"ArtifactID\" AS \"ArtifactID\",
    			\"i\".\"Quantity\" AS \"Quantity\",
    			'Button, ' || \"j\".\"ButtonType\" AS \"Form\",
    			\"q\".\"ButtonMaterial\" AS \"Material\",
    			\"k\".\"ButtonManuTech\" AS \"ManufacturingTechnique\",
    			'' AS \"VesselCategory\",
    			'' AS \"CeramicDecTechAppliedColorCombination\",
    			'' AS \"CeramicGenre\",
    			'Button' AS \"ArtifactType\",
    	a.\"Published\"
    		FROM
    			\"public\".\"tblProject\" AS \"a\"
    		LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    		INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    		LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    		LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    		LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    		AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    		LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    		INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    		INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    		INNER JOIN \"public\".\"tblButton\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    		LEFT JOIN \"public\".\"tblButtonType\" AS \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"
    		LEFT JOIN \"public\".\"tblButtonManuTech\" AS \"k\" ON \"i\".\"ButtonManuTechID\" = \"k\".\"ButtonManuTechID\"
    		LEFT JOIN \"public\".\"tblButtonMaterial\" AS \"q\" ON \"i\".\"ButtonMaterialID\" = \"q\".\"ButtonMaterialID\"
        #{query}		


    UNION ALL

    --Ceramics--
    			SELECT
    				\"b\".\"ProjectName\" AS \"ProjectName\",
    				\"a\".\"ProjectID\" AS \"ProjectID\",
    				\"c\".\"Context\" AS \"Context\",
    				\"cc\".\"DepositType\" AS \"DepositType\",
    				\"d\".\"UnitType\" AS \"UnitType\",
    				\"f\".\"FeatureType\" AS \"FeatureType\",
    				\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    				\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    				\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    				\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    				\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    				\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    				\"i\".\"ArtifactID\" AS \"ArtifactID\",
    				\"i\".\"Quantity\" AS \"Quantity\",
    				\"k\".\"CeramicForm\" AS \"Form\",
    				\"m\".\"Ware\" AS \"Material\",
    				\"l\".\"CeramicManuTech\" AS \"ManufacturingTechnique\",
    				\"j\".\"CeramicVesselCategory\" AS \"VesselCategory\",
    				string_agg (
    					DISTINCT COALESCE (\"o\".\"CeramicDecTechType\") || ', ' || COALESCE (
    						\"p\".\"AppliedColorWrittenDescription\"
    					),
    					'; '
    				) AS \"CeramicDecTechAppliedColorCombination\",
    				\"q\".\"CeramicGenre\" AS \"CeramicGenre\",
    				'Ceramic' AS \"ArtifactType\",
    	a.\"Published\"

    			FROM
    				\"public\".\"tblProject\" AS \"a\"
    			LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    			INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    			LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    			LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    			LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    			AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    			LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    			INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    			INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    			INNER JOIN \"public\".\"tblCeramic\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    			LEFT JOIN \"public\".\"tblCeramicVesselCategory\" AS \"j\" ON \"i\".\"CeramicVesselCategoryID\" = \"j\".\"CeramicVesselCategoryID\"
    			LEFT JOIN \"public\".\"tblCeramicForm\" AS \"k\" ON \"i\".\"CeramicFormID\" = \"k\".\"CeramicFormID\"
    			LEFT JOIN \"public\".\"tblCeramicManuTech\" AS \"l\" ON \"i\".\"CeramicManuTechID\" = \"l\".\"CeramicManuTechID\"
    			LEFT JOIN \"public\".\"tblCeramicWare\" AS \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"
    			LEFT JOIN \"public\".\"tblCeramicDecTech\" AS \"n\" ON \"i\".\"ArtifactID\" = \"n\".\"ArtifactID\"
    			LEFT JOIN \"public\".\"tblCeramicDecTechType\" AS \"o\" ON \"n\".\"CeramicDecTechTypeID\" = \"o\".\"CeramicDecTechTypeID\"
    			LEFT JOIN \"public\".\"tblMunsellAppliedColor\" AS \"p\" ON \"n\".\"MunAppColorID\" = \"p\".\"MunAppColorID\"
    			LEFT JOIN \"public\".\"tblCeramicGenre\" AS \"q\" ON \"i\".\"CeramicGenreID\" = \"q\".\"CeramicGenreID\"
			
          #{query}		
 

    GROUP BY
    					\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"Context\",
    						\"cc\".\"DepositType\",
    						\"d\".\"UnitType\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"Material\",
    						\"ManufacturingTechnique\",
    						\"VesselCategory\",						
    						\"CeramicGenre\",
    						\"ArtifactType\",
    						\"Published\"

    			UNION ALL

    				--Faunal--
    				SELECT
    					\"b\".\"ProjectName\" AS \"ProjectName\",
    					\"a\".\"ProjectID\" AS \"ProjectID\",
    					\"c\".\"Context\" AS \"Context\",
    					\"cc\".\"DepositType\" AS \"DepositType\",
    					\"d\".\"UnitType\" AS \"UnitType\",
    					\"f\".\"FeatureType\" AS \"FeatureType\",
    					\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    					\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    					\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    					\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    					\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    					\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    					\"i\".\"ArtifactID\" AS \"ArtifactID\",
    					\"i\".\"Quantity\" AS \"Quantity\",
    					\"j\".\"English\" AS \"Form\",
    					'' AS \"VesselCategory\",
    					'' AS \"Material\",
    					'' AS \"ManufacturingTechnique\",
    					'' AS \"CeramicDecTechAppliedColorCombination\",
    					'' AS \"CeramicGenre\",
    					'Faunal' AS \"ArtifactType\",
    	a.\"Published\"
    				FROM
    					\"public\".\"tblProject\" AS \"a\"
    				LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    				INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    				LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    				LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    				LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    				AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    				LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    				INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    				INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    				INNER JOIN \"public\".\"tblBone\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    				LEFT JOIN \"public\".\"tblBoneTaxon\" AS \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"
				
            #{query}		
				

    UNION ALL

    --General Artifacts--
    					SELECT
    						\"b\".\"ProjectName\" AS \"ProjectName\",
    						\"a\".\"ProjectID\" AS \"ProjectID\",
    						\"c\".\"Context\" AS \"Context\",
    						\"cc\".\"DepositType\" AS \"DepositType\",
    						\"d\".\"UnitType\" AS \"UnitType\",
    						\"f\".\"FeatureType\" AS \"FeatureType\",
    						\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    						\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    						\"i\".\"ArtifactID\" AS \"ArtifactID\",
    						\"i\".\"Quantity\" AS \"Quantity\",
    						\"j\".\"GenArtifactForm\" AS \"Form\",
    						string_agg (
    							DISTINCT COALESCE (
    								\"l\".\"GenArtifactMaterialType\"
    							),
    							'; '
    						) AS \"Material\",
    						string_agg (
    							DISTINCT COALESCE (\"m\".\"GenArtifactManuTech\"),
    							'; '
    						) AS \"ManufacturingTechnique\",
    						'' AS \"VesselCategory\",
    						'' AS \"CeramicDecTechAppliedColorCombination\",
    						'' AS \"CeramicGenre\",
    						'General Artifacts' AS \"ArtifactType\",
    	a.\"Published\"
    					FROM
    						\"public\".\"tblProject\" AS \"a\"
    					LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    					INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    					LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    					LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    					LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    					AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    					LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    					INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    					INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    					INNER JOIN \"public\".\"tblGenArtifact\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    					LEFT JOIN \"public\".\"tblGenArtifactForm\" AS \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"
    					LEFT JOIN \"public\".\"tblGenArtifactMaterial\" AS \"k\" ON \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    					LEFT JOIN \"public\".\"tblGenArtifactMaterialType\" AS \"l\" ON \"k\".\"GenArtifactMaterialTypeID\" = \"l\".\"GenArtifactMaterialTypeID\"
    					LEFT JOIN \"public\".\"tblGenArtifactManuTech\" AS \"m\" ON \"k\".\"GenArtifactManuTechID\" = \"m\".\"GenArtifactManuTechID\"
					
              #{query}		
				
    GROUP BY
    						\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"Context\",
    						\"cc\".\"DepositType\",
    						\"d\".\"UnitType\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
    						\"Published\"


    UNION ALL

    --Glass--
    						SELECT
    							\"b\".\"ProjectName\" AS \"ProjectName\",
    							\"a\".\"ProjectID\" AS \"ProjectID\",
    							\"c\".\"Context\" AS \"Context\",
    							\"cc\".\"DepositType\" AS \"DepositType\",
    							\"d\".\"UnitType\" AS \"UnitType\",
    							\"f\".\"FeatureType\" AS \"FeatureType\",
    							\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    							\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    							\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    							\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    							\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    							\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    							\"i\".\"ArtifactID\" AS \"ArtifactID\",
    							\"i\".\"Quantity\" AS \"Quantity\",
    							\"j\".\"GlassForm\" AS \"Form\",
    							\"k\".\"GlassMaterial\" AS \"Material\",
    							\"m\".\"GlassManuTech\" AS \"ManufacturingTechnique\",
    							\"l\".\"GlassVesselCategory\" AS \"VesselCategory\",				
							
    							'' AS \"CeramicDecTechAppliedColorCombination\",
    							'' AS \"CeramicGenre\",
    							'Glass' AS \"ArtifactType\",
    	a.\"Published\"
    						FROM
    							\"public\".\"tblProject\" AS \"a\"
    						LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    						INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    						LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    						LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    						LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    						AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    						LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    						INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    						INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    						INNER JOIN \"public\".\"tblGlass\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    						LEFT JOIN \"public\".\"tblGlassForm\" AS \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"
    						LEFT JOIN \"public\".\"tblGlassMaterial\" AS \"k\" ON \"i\".\"GlassMaterialID\" = \"k\".\"GlassMaterialID\"
    						LEFT JOIN \"public\".\"tblGlassVesselCategory\" AS \"l\" ON \"i\".\"GlassVesselCategoryID\" = \"l\".\"GlassVesselCategoryID\"
    						LEFT JOIN \"public\".\"tblGlassManuTech\" AS \"m\" ON \"i\".\"GlassManuTechID\" = \"m\".\"GlassManuTechID\"
					
                #{query}		


    UNION ALL
							
    --Tobacco Pipes--
    							SELECT
    								\"b\".\"ProjectName\" AS \"ProjectName\",
    								\"a\".\"ProjectID\" AS \"ProjectID\",
    								\"c\".\"Context\" AS \"Context\",
    								\"cc\".\"DepositType\" AS \"DepositType\",
    								\"d\".\"UnitType\" AS \"UnitType\",
    								\"f\".\"FeatureType\" AS \"FeatureType\",
    								\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    								\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    								\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    								\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    								\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    								\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    								\"i\".\"ArtifactID\" AS \"ArtifactID\",
    								\"i\".\"Quantity\" AS \"Quantity\",
    								'Tobacco Pipe: ' || \"j\".\"TobaccoPipeCompleteness\" AS \"Form\",
    								\"k\".\"TobaccoPipeMaterial\" AS \"Material\",
    								\"l\".\"TobaccoPipeManuTech\" AS \"ManufacturingTechnique\",
    								'' AS \"VesselCategory\",					
								
    								'' AS \"CeramicDecTechAppliedColorCombination\",
    								'' AS \"CeramicGenre\",
    								'Tobacco Pipe' AS \"ArtifactType\",
    	a.\"Published\"

    							FROM
    								\"public\".\"tblProject\" AS \"a\"
    							LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    							INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    							LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    							LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    							LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    							AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    							LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    							INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    							INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    							INNER JOIN \"public\".\"tblTobaccoPipe\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    							LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" AS \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"
    							LEFT JOIN \"public\".\"tblTobaccoPipeMaterial\" AS \"k\" ON \"i\".\"TobaccoPipeMaterialID\" = \"k\".\"TobaccoPipeMaterialID\"
    							LEFT JOIN \"public\".\"tblTobaccoPipeManuTech\" AS \"l\" ON \"i\".\"TobaccoPipeManuTechID\" = \"l\".\"TobaccoPipeManuTechID\"
                  #{query}		
  			

    UNION ALL
							

    	--Utensils--
    								SELECT
    									\"b\".\"ProjectName\" AS \"ProjectName\",
    									\"a\".\"ProjectID\" AS \"ProjectID\",
    									\"c\".\"Context\" AS \"Context\",
    									\"cc\".\"DepositType\" AS \"DepositType\",
    									\"d\".\"UnitType\" AS \"UnitType\",
    									\"f\".\"FeatureType\" AS \"FeatureType\",
    									\"e\".\"FeatureNumber\" AS \"FeatureNumber\",
    									\"e\".\"FeatureGroup\" AS \"FeatureGroup\",
    									\"e\".\"FeatureGroupInterpretation\" AS \"FeatureGroupInterpretation\",
    									\"c\".\"DAACSStratigraphicGroup\" AS \"DAACSStratigraphicGroup\",
    									\"c\".\"DAACSStratigraphicGroupInterpretation\" AS \"DAACSStratigraphicGroupInterpretation\",
    									\"c\".\"DAACSPhase\" AS \"DAACSPhase\",
    									\"i\".\"ArtifactID\" AS \"ArtifactID\",
    									\"i\".\"Quantity\" AS \"Quantity\",
    									'Utensil: ' || \"j\".\"UtensilForm\" AS \"Form\",
    									string_agg (
    										DISTINCT COALESCE (\"m\".\"UtensilMaterial\"),
    										'; '
    									) AS \"Material\",
    									string_agg (
    										DISTINCT COALESCE (\"l\".\"UtensilManuTech\"),
    										'; '
    									) AS \"ManufacturingTechnique\",
    									'' AS \"VesselCategory\",
    									'' AS \"CeramicDecTechAppliedColorCombination\",
    									'' AS \"CeramicGenre\",
    									'Utensil' AS \"ArtifactType\",
    	a.\"Published\"
    								FROM
    									\"public\".\"tblProject\" AS \"a\"
    								LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    								INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    								LEFT JOIN \"public\".\"tblContextDepositType\" AS \"cc\" ON \"c\".\"DepositTypeID\" = \"cc\".\"DepositTypeID\"
    								LEFT JOIN \"public\".\"tblContextUnitType\" AS \"d\" ON \"c\".\"UnitTypeID\" = \"d\".\"UnitTypeID\"
    								LEFT JOIN \"public\".\"tblContextFeature\" AS \"e\" ON \"c\".\"ProjectID\" = \"e\".\"ProjectID\"
    								AND \"c\".\"FeatureNumber\" = \"e\".\"FeatureNumber\"
    								LEFT JOIN \"public\".\"tblContextFeatureType\" AS \"f\" ON \"e\".\"FeatureTypeID\" = \"f\".\"FeatureTypeID\"
    								INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    								INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    								INNER JOIN \"public\".\"tblUtensil\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    								LEFT JOIN \"public\".\"tblUtensilForm\" AS \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"
    								LEFT JOIN \"public\".\"tblUtensilSpecific\" AS \"k\" ON \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    								LEFT JOIN \"public\".\"tblUtensilManuTech\" AS \"l\" ON \"k\".\"UtensilManuTechID\" = \"l\".\"UtensilManuTechID\"
    								LEFT JOIN \"public\".\"tblUtensilMaterial\" AS \"m\" ON \"k\".\"UtensilMaterialID\" = \"m\".\"UtensilMaterialID\"
    
    #{query}		

    GROUP BY
    									\"b\".\"ProjectName\",
    						\"a\".\"ProjectID\",
    						\"c\".\"Context\",
    						\"cc\".\"DepositType\",
    						\"d\".\"UnitType\",
    						\"f\".\"FeatureType\",
    						\"e\".\"FeatureNumber\",
    						\"e\".\"FeatureGroup\",
    						\"e\".\"FeatureGroupInterpretation\",
    						\"c\".\"DAACSStratigraphicGroup\",
    						\"c\".\"DAACSStratigraphicGroupInterpretation\",
    						\"c\".\"DAACSPhase\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Form\",
    						\"VesselCategory\",
    						\"CeramicDecTechAppliedColorCombination\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
    	\"Published\"

    ORDER BY
    \"ProjectName\" ASC,
    \"UnitType\" ASC,
    \"ArtifactType\""
  end
  
  def oq_two_related(query)
    "--File Name: 	ObQ2_DRC_Related_Done
    --Created by: Jillian Galle
    --Last Updated: 1 April 2015 by jeg

    --Query Description: User selects one or more Projects. Returns all data on Objects from one or more projects in a related format

    --User notes:
    --1.This Query is for the DRC Website.

    SELECT 

    \"a\".\"ProjectID\",
    \"b\".\"ProjectName\", 
    \"c\".\"ObjectID\", 
    \"d\".\"ObjectType\" AS \"Object Type\", 
    \"e\".\"ObjectMaterial\" AS \"Object Material\", 
    \"f\".\"Ware\", 
    \"g\".\"ObjectManuTech\" AS \"Manufacturing Tech\",
    \"h\".\"ObjectVesselCategory\" AS \"Vessel Category\", 
    \"i\".\"ObjectForm\" AS \"Form\", 
    \"j\".\"ObjectShape\" AS \"Shape\", 
    \"k\".\"ObjectCompleteness\" as \"Completeness\", 
    \"n\".\"ObjectColor\",
    \"c\".\"ObjectDescription\",
    \"c\".\"Notes\",
    --Curation Information
    \"c\".\"InstitutionalObjectNumber\",
    \"l\".\"Institution\" as \"CuratingInstitution\",
    \"c\".\"ObjectLocation\",
    \"m\".\"YesNo\" as \"Conserved?\",
    \"c\".\"ConservationNotes\",
    --Measurements
    \"c\".\"ObjectLength\",
    \"o\".\"YesNo\" as \"ObjectLengthCompleteMeasurement?\",
    \"c\".\"ObjectWidth\",
    \"p\".\"YesNo\" as \"WidthCompleteMeasurement?\",
    \"c\".\"ObjectHeight\",
    \"q\".\"YesNo\" as \"HeightCompleteMeasurement?\",
    \"c\".\"ObjectWeight\",
    \"c\".\"ObjectCapacity\",
    \"c\".\"ObjectRimDiameter\",
    \"c\".\"ObjectBaseDiameter\",
    \"c\".\"ObjectHeightRimToBase\",
    \"c\".\"ExhibitLength\",
    \"c\".\"ExhibitWidth\",
    \"c\".\"ExhibitHeight\",
    --Decoration no need to concatentate
    \"r\".\"ObjectDecTech\" as \"DecorativeTechnique\",
    \"s\".\"ObjectColor\" as \"DecorationColor\",
    \"t\".\"ObjectDecPattern\" as \"DecorationPattern\",
    \"c\".\"DecorationNotes\",
    --Dating the Object
    \"c\".\"ObjectDate\",
    \"c\".\"ExcavatorPhase\",
    \"c\".\"DAACSPhase\",
    --AssociatedArtifacts concatenatedlist of related artifact ids
    \"v\".\"ArtifactID\" as \"ObjectArtifactIDs\",--ObjectLocation related table
    \"u\".\"LoanedTo\",
    \"u\".\"InstitutionContact\",
    \"u\".\"ExhibitName\",
    \"u\".\"ArtifactHandler\",
    \"u\".\"LoanLength\",
    \"u\".\"DateLoaned\",
    \"u\".\"DateReturned\",
    --Images
    \"w\".\"ImageID\", --link to related images
    a.\"Published\"


    	FROM \"public\".\"tblProject\" AS \"a\"
    	LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    	LEFT JOIN \"public\".\"tblObject\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    	LEFT JOIN \"public\".\"tblObjectType\" AS \"d\" ON \"c\".\"ObjectTypeID\" = \"d\".\"ObjectTypeID\"
      LEFT JOIN \"public\".\"tblObjectMaterial\" AS \"e\" ON \"c\".\"ObjectMaterialID\" = \"e\".\"ObjectMaterialID\"
      LEFT JOIN \"public\".\"tblCeramicWare\" AS \"f\" ON \"c\".\"ObjectWareTypeID\" = \"f\".\"WareID\"
      LEFT JOIN \"public\".\"tblObjectManuTech\" AS \"g\" ON \"c\".\"ObjectManuTechID\" = \"g\".\"ObjectManuTechID\"
      LEFT JOIN \"public\".\"tblObjectVesselCategory\" AS \"h\" ON \"c\".\"ObjectVesselCategoryID\" = \"h\".\"ObjectVesselCategoryID\"
      LEFT JOIN \"public\".\"tblObjectForm\" AS \"i\" ON \"c\".\"ObjectFormID\" = \"i\".\"ObjectFormID\"
      LEFT JOIN \"public\".\"tblObjectShape\" AS \"j\" ON \"c\".\"ObjectShapeID\" = \"j\".\"ObjectShapeID\"
    	LEFT JOIN \"public\".\"tblObjectCompleteness\" AS \"k\" ON \"c\".\"ObjectCompletenessID\" = \"k\".\"ObjectCompletenessID\"
      LEFT JOIN \"public\".\"tblProjectInstitution\" AS \"l\" ON \"c\".\"InstitutionID\" = \"l\".\"InstitutionID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"m\" ON \"c\".\"Conserved\" = \"m\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblObjectColor\" AS \"n\" ON \"c\".\"ObjectColorID\" = \"n\".\"ObjectColorID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"o\" ON \"c\".\"ObjectLengthComplete\" = \"o\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"p\" ON \"c\".\"ObjectWidthComplete\" = \"p\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"q\" ON \"c\".\"ObjectHeightComplete\" = \"q\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblObjectDecTech\" AS \"r\" ON \"c\".\"ObjectDecTechID\" = \"r\".\"ObjectDecTechID\"
    	LEFT JOIN \"public\".\"tblObjectColor\" AS \"s\" ON \"c\".\"ObjectDecColorID\" = \"s\".\"ObjectColorID\"
    	LEFT JOIN \"public\".\"tblObjectDecPattern\" AS \"t\" ON \"c\".\"ObjectDecPatternID\" = \"t\".\"ObjectDecPatternID\"
    	LEFT JOIN	\"public\".\"tblObjectLocation\" AS \"u\" ON \"c\".\"ObjectID\" = \"u\".\"ObjectID\"
    	LEFT JOIN	\"public\".\"tblObjectArtifact\" AS \"v\" ON \"c\".\"ObjectID\" = \"v\".\"ObjectID\"
    	LEFT JOIN	\"public\".\"tblObjectImage\" AS \"w\" ON \"c\".\"ObjectID\" = \"w\".\"ObjectID\"

      #{query}

    ORDER BY
    \"b\".\"ProjectName\", 
    \"c\".\"ObjectID\", 
    \"d\".\"ObjectType\", 
    \"e\".\"ObjectMaterial\", 
    \"f\".\"Ware\", 
    \"i\".\"ObjectForm\""
  end
  
  def ob_two_concat(query)
    "--File Name: 	ObQ2_DRC_Concatenated_Done
    --Created by: Jillian Galle
    --Last Updated: 5 April 2015 by jeg

    --Query Description: User selects one or more Projects. Returns all data on Objects from one or more projects in a concatenated format

    --User notes:
    --1.This Query is for the DRC Website.
     SELECT 
     \"a\".\"ProjectID\",
    \"b\".\"ProjectName\", 
    \"c\".\"ObjectID\", 
    \"d\".\"ObjectType\" AS \"Object Type\", 
    \"e\".\"ObjectMaterial\" AS \"Object Material\", 
    \"f\".\"Ware\", 
    \"g\".\"ObjectManuTech\" AS \"Manufacturing Tech\",
    \"h\".\"ObjectVesselCategory\" AS \"Vessel Category\", 
    \"i\".\"ObjectForm\" AS \"Form\", 
    \"j\".\"ObjectShape\" AS \"Shape\", 
    \"k\".\"ObjectCompleteness\" as \"Completeness\", 
    \"n\".\"ObjectColor\",
    \"c\".\"ObjectDescription\",
    \"c\".\"Notes\",
    --Curation Information
    \"c\".\"InstitutionalObjectNumber\",
    \"l\".\"Institution\" as \"CuratingInstitution\",
    \"c\".\"ObjectLocation\",
    \"m\".\"YesNo\" as \"Conserved?\",
    \"c\".\"ConservationNotes\",
    --Measurements
    \"c\".\"ObjectLength\",
    \"o\".\"YesNo\" as \"ObjectLengthCompleteMeasurement?\",
    \"c\".\"ObjectWidth\",
    \"p\".\"YesNo\" as \"WidthCompleteMeasurement?\",
    \"c\".\"ObjectHeight\",
    \"q\".\"YesNo\" as \"HeightCompleteMeasurement?\",
    \"c\".\"ObjectWeight\",
    \"c\".\"ObjectCapacity\",
    \"c\".\"ObjectRimDiameter\",
    \"c\".\"ObjectBaseDiameter\",
    \"c\".\"ObjectHeightRimToBase\",
    \"c\".\"ExhibitLength\",
    \"c\".\"ExhibitWidth\",
    \"c\".\"ExhibitHeight\",
    --Decoration No need to concatentate
    \"r\".\"ObjectDecTech\" as \"DecorativeTechnique\",
    \"s\".\"ObjectColor\" as \"DecorationColor\",
    \"t\".\"ObjectDecPattern\" as \"DecorationPattern\",
    \"c\".\"DecorationNotes\",
    --Dating the Object
    \"c\".\"ObjectDate\",
    \"c\".\"ExcavatorPhase\",
    \"c\".\"DAACSPhase\",
    a.\"Published\",
    --AssociatedArtifacts concatenatedlist of related artifact ids
    string_agg(\"v\".\"ArtifactID\", ';') AS \"ObjectArtifactIDs\",--ObjectLocation related table

    string_agg(distinct COALESCE (\"u\".\"LoanedTo\")||', '||COALESCE(\"u\".\"InstitutionContact\")||', '||
    COALESCE(\"u\".\"ExhibitName\")||', '||COALESCE(\"u\".\"ArtifactHandler\")||', '||COALESCE(\"u\".\"LoanLength\")
    ||', '||COALESCE(\"u\".\"DateLoaned\")||', '||COALESCE(\"u\".\"DateReturned\")||', '||COALESCE(\"c\".\"Notes\"), '; ') as \"ObjectLoanInformation\",

    --Images
    string_agg(\"x\".\"ImageFileLocation\", ';') AS \"Images\"

    	FROM \"public\".\"tblProject\" AS \"a\"
    	LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    	LEFT JOIN \"public\".\"tblObject\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    	LEFT JOIN \"public\".\"tblObjectType\" AS \"d\" ON \"c\".\"ObjectTypeID\" = \"d\".\"ObjectTypeID\"
      LEFT JOIN \"public\".\"tblObjectMaterial\" AS \"e\" ON \"c\".\"ObjectMaterialID\" = \"e\".\"ObjectMaterialID\"
      LEFT JOIN \"public\".\"tblCeramicWare\" AS \"f\" ON \"c\".\"ObjectWareTypeID\" = \"f\".\"WareID\"
      LEFT JOIN \"public\".\"tblObjectManuTech\" AS \"g\" ON \"c\".\"ObjectManuTechID\" = \"g\".\"ObjectManuTechID\"
      LEFT JOIN \"public\".\"tblObjectVesselCategory\" AS \"h\" ON \"c\".\"ObjectVesselCategoryID\" = \"h\".\"ObjectVesselCategoryID\"
      LEFT JOIN \"public\".\"tblObjectForm\" AS \"i\" ON \"c\".\"ObjectFormID\" = \"i\".\"ObjectFormID\"
      LEFT JOIN \"public\".\"tblObjectShape\" AS \"j\" ON \"c\".\"ObjectShapeID\" = \"j\".\"ObjectShapeID\"
    	LEFT JOIN \"public\".\"tblObjectCompleteness\" AS \"k\" ON \"c\".\"ObjectCompletenessID\" = \"k\".\"ObjectCompletenessID\"
      LEFT JOIN \"public\".\"tblProjectInstitution\" AS \"l\" ON \"c\".\"InstitutionID\" = \"l\".\"InstitutionID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"m\" ON \"c\".\"Conserved\" = \"m\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblObjectColor\" AS \"n\" ON \"c\".\"ObjectColorID\" = \"n\".\"ObjectColorID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"o\" ON \"c\".\"ObjectLengthComplete\" = \"o\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"p\" ON \"c\".\"ObjectWidthComplete\" = \"p\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"q\" ON \"c\".\"ObjectHeightComplete\" = \"q\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblObjectDecTech\" AS \"r\" ON \"c\".\"ObjectDecTechID\" = \"r\".\"ObjectDecTechID\"
    	LEFT JOIN \"public\".\"tblObjectColor\" AS \"s\" ON \"c\".\"ObjectDecColorID\" = \"s\".\"ObjectColorID\"
    	LEFT JOIN \"public\".\"tblObjectDecPattern\" AS \"t\" ON \"c\".\"ObjectDecPatternID\" = \"t\".\"ObjectDecPatternID\"
    	LEFT JOIN	\"public\".\"tblObjectLocation\" AS \"u\" ON \"c\".\"ObjectID\" = \"u\".\"ObjectID\"
    	LEFT JOIN	\"public\".\"tblObjectArtifact\" AS \"v\" ON \"c\".\"ObjectID\" = \"v\".\"ObjectID\"
    	LEFT JOIN	\"public\".\"tblObjectImage\" AS \"w\" ON \"c\".\"ObjectID\" = \"w\".\"ObjectID\"
    	left join \"public\".\"tblImage\" as \"x\" on \"w\".\"ImageID\" = \"x\".\"ImageID\"

      #{query}

    Group BY
    \"a\".\"ProjectID\",
    \"b\".\"ProjectName\", 
    \"c\".\"ObjectID\", 
    \"d\".\"ObjectType\", 
    \"e\".\"ObjectMaterial\", 
    \"f\".\"Ware\", 
    \"g\".\"ObjectManuTech\",
    \"h\".\"ObjectVesselCategory\", 
    \"i\".\"ObjectForm\", 
    \"j\".\"ObjectShape\", 
    \"k\".\"ObjectCompleteness\", 
    \"n\".\"ObjectColor\",
    \"c\".\"ObjectDescription\",
    \"c\".\"Notes\",
    \"c\".\"InstitutionalObjectNumber\",
    \"l\".\"Institution\",
    \"c\".\"ObjectLocation\",
    \"m\".\"YesNo\", --Conserved?
    \"c\".\"ConservationNotes\",
    \"c\".\"ObjectLength\",
    \"o\".\"YesNo\", --\"ObjectLengthCompleteMeasurement?\"
    \"c\".\"ObjectWidth\",
    \"p\".\"YesNo\", --\"WidthCompleteMeasurement?\"
    \"c\".\"ObjectHeight\",
    \"q\".\"YesNo\", --\"HeightCompleteMeasurement?\"
    \"c\".\"ObjectWeight\",
    \"c\".\"ObjectCapacity\",
    \"c\".\"ObjectRimDiameter\",
    \"c\".\"ObjectBaseDiameter\",
    \"c\".\"ObjectHeightRimToBase\",
    \"c\".\"ExhibitLength\",
    \"c\".\"ExhibitWidth\",
    \"c\".\"ExhibitHeight\",
    \"r\".\"ObjectDecTech\",
    \"s\".\"ObjectColor\",
    \"t\".\"ObjectDecPattern\",
    \"c\".\"DecorationNotes\",
    \"c\".\"ObjectDate\",
    \"c\".\"ExcavatorPhase\",
    \"c\".\"DAACSPhase\",
    a.\"Published\"

    ORDER BY
    \"b\".\"ProjectName\", 
    \"c\".\"ObjectID\", 
    \"d\".\"ObjectType\", 
    \"e\".\"ObjectMaterial\", 
    \"f\".\"Ware\", 
    \"i\".\"ObjectForm\""
  end
  
  def query_objects_three_concat(query)
    "--File Name: 	ObQ3_DRC_Concatenated_Done
    --Created by: Jillian Galle
    --Last Updated: 5 April 2015 by jeg

    --Query Description: User selects one or more Projects and can subset by either ObjectID, ObjectType, ObjectForm, or Ware. Returns all data on Objects from one or more projects in a concatenated format

    --User notes:
    --1.This Query is for the DRC Website.
    SELECT 
    a.\"ProjectID\",
    \"b\".\"ProjectName\", 
    \"c\".\"ObjectID\", 
    \"d\".\"ObjectType\" AS \"Object Type\", 
    \"e\".\"ObjectMaterial\" AS \"Object Material\", 
    \"f\".\"Ware\", 
    \"g\".\"ObjectManuTech\" AS \"Manufacturing Tech\",
    \"h\".\"ObjectVesselCategory\" AS \"Vessel Category\", 
    \"i\".\"ObjectForm\" AS \"Form\", 
    \"j\".\"ObjectShape\" AS \"Shape\", 
    \"k\".\"ObjectCompleteness\" as \"Completeness\", 
    \"n\".\"ObjectColor\",
    \"c\".\"ObjectDescription\",
    \"c\".\"Notes\",
    --Curation Information
    \"c\".\"InstitutionalObjectNumber\",
    \"l\".\"Institution\" as \"CuratingInstitution\",
    \"c\".\"ObjectLocation\",
    \"m\".\"YesNo\" as \"Conserved?\",
    \"c\".\"ConservationNotes\",
    --Measurements
    \"c\".\"ObjectLength\",
    \"o\".\"YesNo\" as \"ObjectLengthCompleteMeasurement?\",
    \"c\".\"ObjectWidth\",
    \"p\".\"YesNo\" as \"WidthCompleteMeasurement?\",
    \"c\".\"ObjectHeight\",
    \"q\".\"YesNo\" as \"HeightCompleteMeasurement?\",
    \"c\".\"ObjectWeight\",
    \"c\".\"ObjectCapacity\",
    \"c\".\"ObjectRimDiameter\",
    \"c\".\"ObjectBaseDiameter\",
    \"c\".\"ObjectHeightRimToBase\",
    \"c\".\"ExhibitLength\",
    \"c\".\"ExhibitWidth\",
    \"c\".\"ExhibitHeight\",
    --Decoration No need to concatentate
    \"r\".\"ObjectDecTech\" as \"DecorativeTechnique\",
    \"s\".\"ObjectColor\" as \"DecorationColor\",
    \"t\".\"ObjectDecPattern\" as \"DecorationPattern\",
    \"c\".\"DecorationNotes\",
    --Dating the Object
    \"c\".\"ObjectDate\",
    \"c\".\"ExcavatorPhase\",
    \"c\".\"DAACSPhase\",
    --AssociatedArtifacts concatenatedlist of related artifact ids
    string_agg(\"v\".\"ArtifactID\", ';') AS \"ObjectArtifactIDs\",--ObjectLocation related table

    string_agg(distinct COALESCE (\"u\".\"LoanedTo\")||', '||COALESCE(\"u\".\"InstitutionContact\")||', '||
    COALESCE(\"u\".\"ExhibitName\")||', '||COALESCE(\"u\".\"ArtifactHandler\")||', '||COALESCE(\"u\".\"LoanLength\")
    ||', '||COALESCE(\"u\".\"DateLoaned\")||', '||COALESCE(\"u\".\"DateReturned\")||', '||COALESCE(\"c\".\"Notes\"), '; ') as \"ObjectLoanInformation\",

    --Images
    string_agg(\"x\".\"ImageFileLocation\", ';') AS \"Images\"

    	FROM \"public\".\"tblProject\" AS \"a\"
    	LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    	LEFT JOIN \"public\".\"tblObject\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    	LEFT JOIN \"public\".\"tblObjectType\" AS \"d\" ON \"c\".\"ObjectTypeID\" = \"d\".\"ObjectTypeID\"
      LEFT JOIN \"public\".\"tblObjectMaterial\" AS \"e\" ON \"c\".\"ObjectMaterialID\" = \"e\".\"ObjectMaterialID\"
      LEFT JOIN \"public\".\"tblCeramicWare\" AS \"f\" ON \"c\".\"ObjectWareTypeID\" = \"f\".\"WareID\"
      LEFT JOIN \"public\".\"tblObjectManuTech\" AS \"g\" ON \"c\".\"ObjectManuTechID\" = \"g\".\"ObjectManuTechID\"
      LEFT JOIN \"public\".\"tblObjectVesselCategory\" AS \"h\" ON \"c\".\"ObjectVesselCategoryID\" = \"h\".\"ObjectVesselCategoryID\"
      LEFT JOIN \"public\".\"tblObjectForm\" AS \"i\" ON \"c\".\"ObjectFormID\" = \"i\".\"ObjectFormID\"
      LEFT JOIN \"public\".\"tblObjectShape\" AS \"j\" ON \"c\".\"ObjectShapeID\" = \"j\".\"ObjectShapeID\"
    	LEFT JOIN \"public\".\"tblObjectCompleteness\" AS \"k\" ON \"c\".\"ObjectCompletenessID\" = \"k\".\"ObjectCompletenessID\"
      LEFT JOIN \"public\".\"tblProjectInstitution\" AS \"l\" ON \"c\".\"InstitutionID\" = \"l\".\"InstitutionID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"m\" ON \"c\".\"Conserved\" = \"m\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblObjectColor\" AS \"n\" ON \"c\".\"ObjectColorID\" = \"n\".\"ObjectColorID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"o\" ON \"c\".\"ObjectLengthComplete\" = \"o\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"p\" ON \"c\".\"ObjectWidthComplete\" = \"p\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"q\" ON \"c\".\"ObjectHeightComplete\" = \"q\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblObjectDecTech\" AS \"r\" ON \"c\".\"ObjectDecTechID\" = \"r\".\"ObjectDecTechID\"
    	LEFT JOIN \"public\".\"tblObjectColor\" AS \"s\" ON \"c\".\"ObjectDecColorID\" = \"s\".\"ObjectColorID\"
    	LEFT JOIN \"public\".\"tblObjectDecPattern\" AS \"t\" ON \"c\".\"ObjectDecPatternID\" = \"t\".\"ObjectDecPatternID\"
    	LEFT JOIN	\"public\".\"tblObjectLocation\" AS \"u\" ON \"c\".\"ObjectID\" = \"u\".\"ObjectID\"
    	LEFT JOIN	\"public\".\"tblObjectArtifact\" AS \"v\" ON \"c\".\"ObjectID\" = \"v\".\"ObjectID\"
    	LEFT JOIN	\"public\".\"tblObjectImage\" AS \"w\" ON \"c\".\"ObjectID\" = \"w\".\"ObjectID\"
    	left join \"public\".\"tblImage\" as \"x\" on \"w\".\"ImageID\" = \"x\".\"ImageID\"
#{query}

    Group BY

    \"b\".\"ProjectName\", 
    \"c\".\"ObjectID\", 
    \"d\".\"ObjectType\", 
    \"e\".\"ObjectMaterial\", 
    \"f\".\"Ware\", 
    \"g\".\"ObjectManuTech\",
    \"h\".\"ObjectVesselCategory\", 
    \"i\".\"ObjectForm\", 
    \"j\".\"ObjectShape\", 
    \"k\".\"ObjectCompleteness\", 
    \"n\".\"ObjectColor\",
    \"c\".\"ObjectDescription\",
    \"c\".\"Notes\",
    \"c\".\"InstitutionalObjectNumber\",
    \"l\".\"Institution\",
    \"c\".\"ObjectLocation\",
    \"m\".\"YesNo\", --Conserved?
    \"c\".\"ConservationNotes\",
    \"c\".\"ObjectLength\",
    \"o\".\"YesNo\", --\"ObjectLengthCompleteMeasurement?\"
    \"c\".\"ObjectWidth\",
    \"p\".\"YesNo\", --\"WidthCompleteMeasurement?\"
    \"c\".\"ObjectHeight\",
    \"q\".\"YesNo\", --\"HeightCompleteMeasurement?\"
    \"c\".\"ObjectWeight\",
    \"c\".\"ObjectCapacity\",
    \"c\".\"ObjectRimDiameter\",
    \"c\".\"ObjectBaseDiameter\",
    \"c\".\"ObjectHeightRimToBase\",
    \"c\".\"ExhibitLength\",
    \"c\".\"ExhibitWidth\",
    \"c\".\"ExhibitHeight\",
    \"r\".\"ObjectDecTech\",
    \"s\".\"ObjectColor\",
    \"t\".\"ObjectDecPattern\",
    \"c\".\"DecorationNotes\",
    \"c\".\"ObjectDate\",
    \"c\".\"ExcavatorPhase\",
    \"c\".\"DAACSPhase\",
    a.\"ProjectID\"

    ORDER BY
    \"b\".\"ProjectName\", 
    \"c\".\"ObjectID\", 
    \"d\".\"ObjectType\", 
    \"e\".\"ObjectMaterial\", 
    \"f\".\"Ware\", 
    \"i\".\"ObjectForm\""
  end
  
  def query_objects_three_related(query)
    "--File Name: 	ObQ3_DRC_Concatenated_Done
    --Created by: Jillian Galle
    --Last Updated: 5 April 2015 by jeg

    --Query Description: User selects one or more Projects and can subset by either ObjectID, ObjectType, ObjectForm, or Ware. Returns all data on Objects from one or more projects in a concatenated format

    --User notes:
    --1.This Query is for the DRC Website.
    SELECT 
    a.\"ProjectID\",
    \"b\".\"ProjectName\", 
    \"c\".\"ObjectID\", 
    \"d\".\"ObjectType\" AS \"Object Type\", 
    \"e\".\"ObjectMaterial\" AS \"Object Material\", 
    \"f\".\"Ware\", 
    \"g\".\"ObjectManuTech\" AS \"Manufacturing Tech\",
    \"h\".\"ObjectVesselCategory\" AS \"Vessel Category\", 
    \"i\".\"ObjectForm\" AS \"Form\", 
    \"j\".\"ObjectShape\" AS \"Shape\", 
    \"k\".\"ObjectCompleteness\" as \"Completeness\", 
    \"n\".\"ObjectColor\",
    \"c\".\"ObjectDescription\",
    \"c\".\"Notes\",
    --Curation Information
    \"c\".\"InstitutionalObjectNumber\",
    \"l\".\"Institution\" as \"CuratingInstitution\",
    \"c\".\"ObjectLocation\",
    \"m\".\"YesNo\" as \"Conserved?\",
    \"c\".\"ConservationNotes\",
    --Measurements
    \"c\".\"ObjectLength\",
    \"o\".\"YesNo\" as \"ObjectLengthCompleteMeasurement?\",
    \"c\".\"ObjectWidth\",
    \"p\".\"YesNo\" as \"WidthCompleteMeasurement?\",
    \"c\".\"ObjectHeight\",
    \"q\".\"YesNo\" as \"HeightCompleteMeasurement?\",
    \"c\".\"ObjectWeight\",
    \"c\".\"ObjectCapacity\",
    \"c\".\"ObjectRimDiameter\",
    \"c\".\"ObjectBaseDiameter\",
    \"c\".\"ObjectHeightRimToBase\",
    \"c\".\"ExhibitLength\",
    \"c\".\"ExhibitWidth\",
    \"c\".\"ExhibitHeight\",
    --Decoration no need to concatentate
    \"r\".\"ObjectDecTech\" as \"DecorativeTechnique\",
    \"s\".\"ObjectColor\" as \"DecorationColor\",
    \"t\".\"ObjectDecPattern\" as \"DecorationPattern\",
    \"c\".\"DecorationNotes\",
    --Dating the Object
    \"c\".\"ObjectDate\",
    \"c\".\"ExcavatorPhase\",
    \"c\".\"DAACSPhase\",
    --AssociatedArtifacts concatenatedlist of related artifact ids
    \"v\".\"ArtifactID\" as \"ObjectArtifactIDs\",--ObjectLocation related table
    \"u\".\"LoanedTo\",
    \"u\".\"InstitutionContact\",
    \"u\".\"ExhibitName\",
    \"u\".\"ArtifactHandler\",
    \"u\".\"LoanLength\",
    \"u\".\"DateLoaned\",
    \"u\".\"DateReturned\",
    --Images
    \"w\".\"ImageID\" --link to related images


    	FROM \"public\".\"tblProject\" AS \"a\"
    	LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    	LEFT JOIN \"public\".\"tblObject\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    	LEFT JOIN \"public\".\"tblObjectType\" AS \"d\" ON \"c\".\"ObjectTypeID\" = \"d\".\"ObjectTypeID\"
      LEFT JOIN \"public\".\"tblObjectMaterial\" AS \"e\" ON \"c\".\"ObjectMaterialID\" = \"e\".\"ObjectMaterialID\"
      LEFT JOIN \"public\".\"tblCeramicWare\" AS \"f\" ON \"c\".\"ObjectWareTypeID\" = \"f\".\"WareID\"
      LEFT JOIN \"public\".\"tblObjectManuTech\" AS \"g\" ON \"c\".\"ObjectManuTechID\" = \"g\".\"ObjectManuTechID\"
      LEFT JOIN \"public\".\"tblObjectVesselCategory\" AS \"h\" ON \"c\".\"ObjectVesselCategoryID\" = \"h\".\"ObjectVesselCategoryID\"
      LEFT JOIN \"public\".\"tblObjectForm\" AS \"i\" ON \"c\".\"ObjectFormID\" = \"i\".\"ObjectFormID\"
      LEFT JOIN \"public\".\"tblObjectShape\" AS \"j\" ON \"c\".\"ObjectShapeID\" = \"j\".\"ObjectShapeID\"
    	LEFT JOIN \"public\".\"tblObjectCompleteness\" AS \"k\" ON \"c\".\"ObjectCompletenessID\" = \"k\".\"ObjectCompletenessID\"
      LEFT JOIN \"public\".\"tblProjectInstitution\" AS \"l\" ON \"c\".\"InstitutionID\" = \"l\".\"InstitutionID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"m\" ON \"c\".\"Conserved\" = \"m\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblObjectColor\" AS \"n\" ON \"c\".\"ObjectColorID\" = \"n\".\"ObjectColorID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"o\" ON \"c\".\"ObjectLengthComplete\" = \"o\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"p\" ON \"c\".\"ObjectWidthComplete\" = \"p\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblYesNo\" AS \"q\" ON \"c\".\"ObjectHeightComplete\" = \"q\".\"YesNoID\"
    	LEFT JOIN \"public\".\"tblObjectDecTech\" AS \"r\" ON \"c\".\"ObjectDecTechID\" = \"r\".\"ObjectDecTechID\"
    	LEFT JOIN \"public\".\"tblObjectColor\" AS \"s\" ON \"c\".\"ObjectDecColorID\" = \"s\".\"ObjectColorID\"
    	LEFT JOIN \"public\".\"tblObjectDecPattern\" AS \"t\" ON \"c\".\"ObjectDecPatternID\" = \"t\".\"ObjectDecPatternID\"
    	LEFT JOIN	\"public\".\"tblObjectLocation\" AS \"u\" ON \"c\".\"ObjectID\" = \"u\".\"ObjectID\"
    	LEFT JOIN	\"public\".\"tblObjectArtifact\" AS \"v\" ON \"c\".\"ObjectID\" = \"v\".\"ObjectID\"
    	LEFT JOIN	\"public\".\"tblObjectImage\" AS \"w\" ON \"c\".\"ObjectID\" = \"w\".\"ObjectID\"

      #{query}

    ORDER BY
    \"b\".\"ProjectName\", 
    \"c\".\"ObjectID\", 
    \"d\".\"ObjectType\", 
    \"e\".\"ObjectMaterial\", 
    \"f\".\"Ware\", 
    \"i\".\"ObjectForm\""
  end
  
  def query_image_one(query)
    "--File Name: 	IQ1_DRC_Done
    --Created by: Jillian Galle
    --Last Updated: 5 April 2015 by jeg

    --Query Description: Query Returns all images for selected sites and include basic artiact data for image. 


    --Beads--
    SELECT
    a.\"ProjectID\",
    a.\"Published\",
    	\"b\".\"ProjectName\" AS \"ProjectName\",
    	\"c\".\"Context\" AS \"Context\",
    	\"i\".\"ArtifactID\" AS \"ArtifactID\",
    	\"i\".\"Quantity\" AS \"Quantity\",
    	'Bead, ' || \"j\".\"BeadShape\" AS \"Form\",
    	'' AS \"Ware\",
    	'' AS \"CeramicGenre\",
    string_agg(z.\"ImageFileLocation\", ';') AS \"Images\",
    	'Bead' AS \"ArtifactType\"


    FROM
    	\"public\".\"tblProject\" AS \"a\"
    LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    INNER JOIN \"public\".\"tblBead\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    LEFT JOIN \"public\".\"tblBeadShape\" AS \"j\" ON \"i\".\"BeadShapeID\" = \"j\".\"BeadShapeID\"
    LEFT JOIN \"public\".\"tblArtifactImage\" AS \"y\" ON \"i\".\"ArtifactID\" = \"y\".\"ArtifactID\"
    LEFT JOIN \"public\".\"tblImage\" AS \"z\" ON \"y\".\"ImageID\" = \"z\".\"ImageID\"

    #{query}
		

    Group BY
    	\"b\".\"ProjectName\",
    	\"c\".\"Context\",
    	\"i\".\"ArtifactID\",
    	\"i\".\"Quantity\",
    	\"j\".\"BeadShape\",
    	\"Ware\",
    	\"CeramicGenre\",
    	\"ArtifactType\",
    	a.\"ProjectID\",
    	a.\"Published\"

    UNION ALL

    	--Buckles--
    	SELECT
    	a.\"ProjectID\",
    	a.\"Published\",
    		\"b\".\"ProjectName\" AS \"ProjectName\",
    		\"c\".\"Context\" AS \"Context\",
    		\"i\".\"ArtifactID\" AS \"ArtifactID\",
    		\"i\".\"Quantity\" AS \"Quantity\",
    		'Buckle, ' || \"j\".\"BuckleType\" AS \"Form\",
    		'' AS \"Ware\",
    		'' AS \"CeramicGenre\",
    		string_agg(z.\"ImageFileLocation\", ';') AS \"Images\",
    		'Buckle' AS \"ArtifactType\"

    	FROM
    		\"public\".\"tblProject\" AS \"a\"
    	LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    	INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    	INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    	INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    	INNER JOIN \"public\".\"tblBuckle\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    	LEFT JOIN \"public\".\"tblBuckleType\" AS \"j\" ON \"i\".\"BuckleTypeID\" = \"j\".\"BuckleTypeID\"
    	LEFT JOIN \"public\".\"tblBuckleForm\" AS \"k\" ON \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    	LEFT JOIN \"public\".\"tblArtifactImage\" AS \"y\" ON \"i\".\"ArtifactID\" = \"y\".\"ArtifactID\"
    	LEFT JOIN \"public\".\"tblImage\" AS \"z\" ON \"y\".\"ImageID\" = \"z\".\"ImageID\"
	
      #{query}

    Group BY
    		\"b\".\"ProjectName\",
    		\"c\".\"Context\",
    		\"i\".\"ArtifactID\",
    		\"i\".\"Quantity\",
    		\"j\".\"BuckleType\",
    		\"Ware\",
    		\"CeramicGenre\",
    		\"ArtifactType\",
    		a.\"ProjectID\",
    		a.\"Published\"


    UNION ALL

    		--Buttons--
    		SELECT
    		a.\"ProjectID\",
    		a.\"Published\",
    			\"b\".\"ProjectName\" AS \"ProjectName\",
    			\"c\".\"Context\" AS \"Context\",
    			\"i\".\"ArtifactID\" AS \"ArtifactID\",
    			\"i\".\"Quantity\" AS \"Quantity\",
    			'Button, ' || \"j\".\"ButtonType\" AS \"Form\",
    			'' AS \"Ware\",
    			'' AS \"CeramicGenre\",
    string_agg(z.\"ImageFileLocation\", ';') AS \"Images\",
    			'Button' AS \"ArtifactType\"

    		FROM
    			\"public\".\"tblProject\" AS \"a\"
    		LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    		INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    		INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    		INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    		INNER JOIN \"public\".\"tblButton\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    		LEFT JOIN \"public\".\"tblButtonType\" AS \"j\" ON \"i\".\"ButtonTypeID\" = \"j\".\"ButtonTypeID\"
    		LEFT JOIN \"public\".\"tblArtifactImage\" AS \"y\" ON \"i\".\"ArtifactID\" = \"y\".\"ArtifactID\"
    		LEFT JOIN \"public\".\"tblImage\" AS \"z\" ON \"y\".\"ImageID\" = \"z\".\"ImageID\"

        #{query}
		
    Group BY
    		\"b\".\"ProjectName\",
    			\"c\".\"Context\",
    			\"i\".\"ArtifactID\",
    			\"i\".\"Quantity\",
    			\"j\".\"ButtonType\",
    			\"Ware\",
    			\"CeramicGenre\",
    			\"ArtifactType\",
    			a.\"ProjectID\",
    			a.\"Published\"


    UNION ALL

    --Ceramics--
    			SELECT
    			a.\"ProjectID\",
    			a.\"Published\",
    				\"b\".\"ProjectName\" AS \"ProjectName\",
    				\"c\".\"Context\" AS \"Context\",
    				\"i\".\"ArtifactID\" AS \"ArtifactID\",
    				\"i\".\"Quantity\" AS \"Quantity\",
    				\"k\".\"CeramicForm\" AS \"Form\",
    				\"m\".\"Ware\" AS \"Ware\",
    				\"q\".\"CeramicGenre\" AS \"CeramicGenre\",
    				string_agg(z.\"ImageFileLocation\", ';') AS \"Images\",
    				'Ceramic' AS \"ArtifactType\"

    			FROM
    				\"public\".\"tblProject\" AS \"a\"
    			LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    			INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    			INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    			INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    			INNER JOIN \"public\".\"tblCeramic\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    			LEFT JOIN \"public\".\"tblCeramicForm\" AS \"k\" ON \"i\".\"CeramicFormID\" = \"k\".\"CeramicFormID\"
    			LEFT JOIN \"public\".\"tblCeramicWare\" AS \"m\" ON \"i\".\"WareID\" = \"m\".\"WareID\"
    			LEFT JOIN \"public\".\"tblCeramicGenre\" AS \"q\" ON \"i\".\"CeramicGenreID\" = \"q\".\"CeramicGenreID\"
    			LEFT JOIN \"public\".\"tblArtifactImage\" AS \"y\" ON \"i\".\"ArtifactID\" = \"y\".\"ArtifactID\"
    			LEFT JOIN \"public\".\"tblImage\" AS \"z\" ON \"y\".\"ImageID\" = \"z\".\"ImageID\"

          #{query}
		

    GROUP BY
    				\"b\".\"ProjectName\",
    				\"c\".\"Context\",
    				\"i\".\"ArtifactID\",
    				\"i\".\"Quantity\",
    				\"k\".\"CeramicForm\",
    				\"m\".\"Ware\",
    				\"q\".\"CeramicGenre\",
    				\"ArtifactType\",
    				a.\"ProjectID\",
    				a.\"Published\"

    			UNION ALL

    				--Faunal--
    				SELECT
    				a.\"ProjectID\",
    				a.\"Published\",
    					\"b\".\"ProjectName\" AS \"ProjectName\",
    					\"c\".\"Context\" AS \"Context\",
    					\"i\".\"ArtifactID\" AS \"ArtifactID\",
    					\"i\".\"Quantity\" AS \"Quantity\",
    					\"j\".\"English\" AS \"Form\",
    					'' AS \"Ware\",
    					'' AS \"CeramicGenre\",
    					string_agg(z.\"ImageFileLocation\", ';') AS \"Images\",
    					'Faunal' AS \"ArtifactType\"

    				FROM
    					\"public\".\"tblProject\" AS \"a\"
    				LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    				INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    				INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    				INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    				INNER JOIN \"public\".\"tblBone\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    				LEFT JOIN \"public\".\"tblBoneTaxon\" AS \"j\" ON \"i\".\"TaxonID\" = \"j\".\"TaxonID\"
    				LEFT JOIN \"public\".\"tblArtifactImage\" AS \"y\" ON \"i\".\"ArtifactID\" = \"y\".\"ArtifactID\"
    				LEFT JOIN \"public\".\"tblImage\" AS \"z\" ON \"y\".\"ImageID\" = \"z\".\"ImageID\"

            #{query}
		
    Group BY

    					\"b\".\"ProjectName\",
    					\"c\".\"Context\",
    					\"i\".\"ArtifactID\",
    					\"i\".\"Quantity\",
    					\"j\".\"English\",
    					\"Ware\",
    					\"CeramicGenre\",
    					\"ArtifactType\",
    					a.\"ProjectID\",
    					a.\"Published\"

    UNION ALL

    --General Artifacts--
    					SELECT
    					a.\"ProjectID\",
    					a.\"Published\",
    						\"b\".\"ProjectName\" AS \"ProjectName\",
    						\"c\".\"Context\" AS \"Context\",
    						\"i\".\"ArtifactID\" AS \"ArtifactID\",
    						\"i\".\"Quantity\" AS \"Quantity\",
    						\"j\".\"GenArtifactForm\" AS \"Form\",
    						'' AS \"Ware\",
    						'' AS \"CeramicGenre\",
    string_agg(z.\"ImageFileLocation\", ';') AS \"Images\",
    						'General Artifacts' AS \"ArtifactType\"
    					FROM
    						\"public\".\"tblProject\" AS \"a\"
    					LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    					INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    					INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    					INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    					INNER JOIN \"public\".\"tblGenArtifact\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    					LEFT JOIN \"public\".\"tblGenArtifactForm\" AS \"j\" ON \"i\".\"GenArtifactFormID\" = \"j\".\"GenArtifactFormID\"
    					LEFT JOIN \"public\".\"tblArtifactImage\" AS \"y\" ON \"i\".\"ArtifactID\" = \"y\".\"ArtifactID\"
    					LEFT JOIN \"public\".\"tblImage\" AS \"z\" ON \"y\".\"ImageID\" = \"z\".\"ImageID\"

              #{query}

    GROUP BY
    						\"b\".\"ProjectName\",
    						\"c\".\"Context\",
    						\"i\".\"ArtifactID\",
    						\"i\".\"Quantity\",
    						\"Ware\",
    						\"Form\",
    						\"CeramicGenre\",
    						\"ArtifactType\",
    						a.\"ProjectID\",
    						a.\"Published\"


    UNION ALL

    --Glass--
    						SELECT
    						a.\"ProjectID\",
    						a.\"Published\",
    							\"b\".\"ProjectName\" AS \"ProjectName\",
    							\"c\".\"Context\" AS \"Context\",
    							\"i\".\"ArtifactID\" AS \"ArtifactID\",
    							\"i\".\"Quantity\" AS \"Quantity\",
    							\"j\".\"GlassForm\" AS \"Form\",
    							'' AS \"Ware\",
    							'' AS \"CeramicGenre\",
    							string_agg(z.\"ImageFileLocation\", ';') AS \"Images\",
    							'Glass' AS \"ArtifactType\"
    						FROM
    							\"public\".\"tblProject\" AS \"a\"
    						LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    						INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    						INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    						INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    						INNER JOIN \"public\".\"tblGlass\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    						LEFT JOIN \"public\".\"tblGlassForm\" AS \"j\" ON \"i\".\"GlassFormID\" = \"j\".\"GlassFormID\"
    						LEFT JOIN \"public\".\"tblArtifactImage\" AS \"y\" ON \"i\".\"ArtifactID\" = \"y\".\"ArtifactID\"
    						LEFT JOIN \"public\".\"tblImage\" AS \"z\" ON \"y\".\"ImageID\" = \"z\".\"ImageID\"	

                #{query}

    Group BY
    							\"b\".\"ProjectName\",
    							\"c\".\"Context\",
    							\"i\".\"ArtifactID\",
    							\"i\".\"Quantity\",
    							\"j\".\"GlassForm\",
    							\"Ware\",
    							\"CeramicGenre\",
    							\"ArtifactType\",
    							a.\"ProjectID\",
    							a.\"Published\"



    UNION ALL
							
    --Tobacco Pipes--
    							SELECT
    							a.\"ProjectID\",
    							a.\"Published\",
    								\"b\".\"ProjectName\" AS \"ProjectName\",
    								\"c\".\"Context\" AS \"Context\",
    								\"i\".\"ArtifactID\" AS \"ArtifactID\",
    								\"i\".\"Quantity\" AS \"Quantity\",
    								'Tobacco Pipe: ' || \"j\".\"TobaccoPipeCompleteness\" AS \"Form\",
    								'' AS \"Ware\",
    								'' AS \"CeramicGenre\",
    								string_agg(z.\"ImageFileLocation\", ';') AS \"Images\",
    								'Tobacco Pipe' AS \"ArtifactType\"

    							FROM
    								\"public\".\"tblProject\" AS \"a\"
    							LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    							INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    							INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    							INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    							INNER JOIN \"public\".\"tblTobaccoPipe\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    							LEFT JOIN \"public\".\"tblTobaccoPipeCompleteness\" AS \"j\" ON \"i\".\"TobaccoPipeCompletenessID\" = \"j\".\"TobaccoPipeCompletenessID\"
    										LEFT JOIN \"public\".\"tblArtifactImage\" AS \"y\" ON \"i\".\"ArtifactID\" = \"y\".\"ArtifactID\"
    							LEFT JOIN \"public\".\"tblImage\" AS \"z\" ON \"y\".\"ImageID\" = \"z\".\"ImageID\"

                  #{query}


    Group BY
    								\"b\".\"ProjectName\",
    								\"c\".\"Context\",
    								\"i\".\"ArtifactID\",
    								\"i\".\"Quantity\",
    								\"j\".\"TobaccoPipeCompleteness\" ,
    								\"Ware\",
    								\"CeramicGenre\",
    								\"ArtifactType\",
    								a.\"ProjectID\",
    								a.\"Published\"


    UNION ALL
							

    	--Utensils--
    								SELECT
    								a.\"ProjectID\",
    								a.\"Published\",
    									\"b\".\"ProjectName\" AS \"ProjectName\",
    									\"c\".\"Context\" AS \"Context\",
    									\"i\".\"ArtifactID\" AS \"ArtifactID\",
    									\"i\".\"Quantity\" AS \"Quantity\",
    									'Utensil: ' || \"j\".\"UtensilForm\" AS \"Form\",
    									'' AS \"Ware\",
    									'' AS \"CeramicGenre\",
    								string_agg(z.\"ImageFileLocation\", ';') AS \"Images\",
    									'Utensil' AS \"ArtifactType\"

    								FROM
    									\"public\".\"tblProject\" AS \"a\"
    								LEFT JOIN \"public\".\"tblProjectName\" AS \"b\" ON \"a\".\"ProjectNameID\" = \"b\".\"ProjectNameID\"
    								INNER JOIN \"public\".\"tblContext\" AS \"c\" ON \"a\".\"ProjectID\" = \"c\".\"ProjectID\"
    								INNER JOIN \"public\".\"tblContextSample\" AS \"g\" ON \"c\".\"ContextID\" = \"g\".\"ContextID\"
    								INNER JOIN \"public\".\"tblGenerateContextArtifactID\" AS \"h\" ON \"g\".\"ContextSampleID\" = \"h\".\"ContextSampleID\"
    								INNER JOIN \"public\".\"tblUtensil\" AS \"i\" ON \"i\".\"GenerateContextArtifactID\" = \"h\".\"GenerateContextArtifactID\"
    								LEFT JOIN \"public\".\"tblUtensilForm\" AS \"j\" ON \"i\".\"UtensilFormID\" = \"j\".\"UtensilFormID\"
    								LEFT JOIN \"public\".\"tblUtensilSpecific\" AS \"k\" ON \"i\".\"ArtifactID\" = \"k\".\"ArtifactID\"
    								LEFT JOIN \"public\".\"tblArtifactImage\" AS \"y\" ON \"i\".\"ArtifactID\" = \"y\".\"ArtifactID\"
    								LEFT JOIN \"public\".\"tblImage\" AS \"z\" ON \"y\".\"ImageID\" = \"z\".\"ImageID\"


#{query}
		
    GROUP BY
    									\"b\".\"ProjectName\",
    									\"c\".\"Context\",
    									\"i\".\"ArtifactID\",
    									\"i\".\"Quantity\",
    									\"j\".\"UtensilForm\",
    									\"Ware\",
    									\"CeramicGenre\",
    									\"ArtifactType\",
    									a.\"ProjectID\",
    									a.\"Published\"
									
    ORDER BY
    \"ProjectName\" ASC,
    \"ArtifactType\""
  end
end