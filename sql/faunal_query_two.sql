create view faunal_query_context as SELECT
"public"."tblProjectName"."ProjectName" AS """ProjectName""",
"public"."tblProject"."ProjectID" AS """ProjecID""",
"public"."tblContext"."Context" AS """Context""",
"public"."tblContext"."QuadratID" AS """QuadratID""",
"public"."tblContextDepositType"."DepositType" AS """DepositType""",
"public"."tblContextUnitType"."UnitType" AS """UnitType""",
"public"."tblContextFeatureType"."FeatureType" AS """FeatureType""",
"public"."tblContextFeature"."FeatureNumber" AS """FeatureNumber""",
"public"."tblContextFeature"."FeatureGroup" AS """Feature roup""",
"public"."tblContextFeature"."FeatureGroupInterpretation" AS """FeatureGroupInterpretation""",
"public"."tblContext"."DAACSStratigraphicGroup" AS """DAACSStratigraphicGroup""",
"public"."tblContext"."DAACSStratigraphicGroupInterpretation" AS """DAACSStratigraphicGroupInterpretation""",
"public"."tblContext"."DAACSPhase" AS """DAACSPhase""",
"public"."tblBone"."Quantity" AS """TotalCount""",
"public"."tblBoneReliability"."Reliability" AS """Reliability""",
"public"."tblBoneTaxon"."English" AS """TaxonEnglish""",
"public"."tblBoneTaxon"."Latin" AS """TaxonLatin""",
"public"."tblBoneTaxon"."TxnOrder" AS """TaxonOrder""",
"public"."tblBoneTaxonCategory"."TaxonCategory" AS """TaxonCategory""",
"public"."tblBoneTaxon"."TaxonGroupCategory" AS """TaxonGroupCategory""",
"public"."tblBoneElement"."BodyPart" AS """BodyPart""",
"public"."tblBoneElement"."BoneElement" AS """Element""",
"public"."tblBoneSymmetry"."SymmetryExpand" AS """Symmetry""",
"public"."tblBone"."NISP" AS """NISP""",
"public"."tblBone"."Weight" AS """BoneWeight""",
"public"."tblBoneLocation"."BoneLocation" AS """BoneLocation""",
"public"."tblBoneDescriptor"."Descriptor" AS """BoneDescriptor""",
"public"."tblBoneSize"."BoneSizeExpand" AS """BoneSize""",
"public"."tblBoneFusion"."Fusion" AS """Fusion""",
"public"."tblBoneSex"."SexExpand" AS """SexExpand""",
"public"."tblBoneChewType"."ChewTypeExpand" AS """ChewType""",
"public"."tblBoneChewLocation"."ChewLocationExpand" AS """ChewLocation""",
"public"."tblBone"."FreshBreak" AS """FreshBreak""",
"public"."tblBoneToothType"."ToothTypeExpand" AS """ToothType""",
"public"."tblBoneToothWear"."ToothWear" AS """ToothWear""",
"public"."tblBone"."Disease" AS """DiseaseTrauma""",
"public"."tblBone"."Weathered" AS """Weathered?""",
"public"."tblBone"."Burned" AS """Burned?""",
"public"."tblBoneCondition"."BoneConditionExpand" AS """BoneCondition""",
"public"."tblBone"."NoofCutMarks" AS """NumberCutMarks",
"public"."tblBoneButcherMethod"."ButcherMethodExpand" AS """ButcherMethod""",
"public"."tblBoneButcherLocation"."ButcherLocationExpand" AS """ButcherLocation""",
"public"."tblBoneButcherDirection"."ButcherDirectionExpand" AS """ButcherDirection""",
"public"."tblBoneMarkType"."BoneMarkType" AS """CutType""",
"public"."tblBoneMarkLocation"."BoneMarkLocation" AS """CutLocation""",
"public"."tblBoneMarkDirection"."MarkDirection" AS """CutDirection""",
"public"."tblBoneTaxon"."MtWtAd" AS """Meat WeightAdult""",
"public"."tblBoneTaxon"."MtWtIm" AS """Meat Weight mmature""",
"public"."tblBone"."Comments" AS """Notes""",
"public"."tblBone"."Identifier" AS """Identifier""",
"public"."tblBone"."DateIdentified" AS "DateIdentified",
string_agg("public"."tblBoneMeasuringDescription"."MeasuringDescription",',') AS """MeasurementDescription""",
array_agg("public"."tblBoneMeasure"."Measurement") AS """Measurement""",
Accurate AS """Accurate"""
-- Accurate needs to be a string_agg but I can't figure out how to do this with an Alias related to multiple Tables i.e. string_agg(Accurate,',') AS """Accurate"""


FROM
"public"."tblProject"
LEFT JOIN "public"."tblProjectName" ON "public"."tblProject"."ProjectNameID" = "public"."tblProjectName"."ProjectNameID"
LEFT JOIN "public"."tblContext" ON "public"."tblContext"."ProjectID" = "public"."tblProject"."ProjectID"
LEFT JOIN "public"."tblContextDepositType" ON "public"."tblContext"."DepositTypeID" = "public"."tblContextDepositType"."DepositTypeID"
LEFT JOIN "public"."tblContextFeature" ON "public"."tblContext"."ProjectID" = "public"."tblContextFeature"."ProjectID" AND "public"."tblContext"."FeatureNumber" = "public"."tblContextFeature"."FeatureNumber"
LEFT JOIN "public"."tblContextFeatureType" ON "public"."tblContextFeature"."FeatureTypeID" = "public"."tblContextFeatureType"."FeatureTypeID"
LEFT JOIN "public"."tblContextUnitType" ON "public"."tblContext"."UnitTypeID" = "public"."tblContextUnitType"."UnitTypeID"
LEFT JOIN "public"."tblYesNo" ON "public"."tblContext"."ArtifactPresence" = "public"."tblYesNo"."YesNoID"
LEFT JOIN "public"."tblContextSample" ON "public"."tblContextSample"."ContextAutoID" = "public"."tblContext"."ContextAutoID"
INNER JOIN "public"."tblGenerateContextArtifactID" ON "public"."tblContextSample"."ContextSampleID" = "public"."tblGenerateContextArtifactID"."ContextSampleID"
INNER JOIN "public"."tblBone" ON "public"."tblBone"."GenerateContextArtifactID" = "public"."tblGenerateContextArtifactID"."GenerateContextArtifactID"
LEFT JOIN "public"."tblBoneTaxon" ON "public"."tblBone"."TaxonID" = "public"."tblBoneTaxon"."TaxonID"
LEFT JOIN "public"."tblBoneTaxonCategory" ON "public"."tblBoneTaxon"."TaxonCategoryID" = "public"."tblBoneTaxonCategory"."TaxonCategoryID"
LEFT JOIN "public"."tblBoneReliability" ON "public"."tblBone"."ReliabilityID" = "public"."tblBoneReliability"."ReliabilityID"
LEFT JOIN "public"."tblBoneElement" ON "public"."tblBone"."BoneElementID" = "public"."tblBoneElement"."BoneElementID"
LEFT JOIN "public"."tblBoneSymmetry" ON "public"."tblBone"."SymmetryID" = "public"."tblBoneSymmetry"."SymmetryID"
LEFT JOIN "public"."tblBoneLocation" ON "public"."tblBone"."BoneLocationID" = "public"."tblBoneLocation"."BoneLocationID"
LEFT JOIN "public"."tblBoneDescriptor" ON "public"."tblBone"."DescriptorID" = "public"."tblBoneDescriptor"."DescriptorID"
LEFT JOIN "public"."tblBoneFusion" ON "public"."tblBone"."FusionID" = "public"."tblBoneFusion"."FusionID"
LEFT JOIN "public"."tblBoneToothType" ON "public"."tblBone"."ToothTypeID" = "public"."tblBoneToothType"."ToothTypeID" AND "public"."tblBone"."ToothTypeID" = "public"."tblBoneToothType"."ToothTypeID"
LEFT JOIN "public"."tblBoneToothWear" ON "public"."tblBone"."ToothWearID" = "public"."tblBoneToothWear"."ToothWearID"
LEFT JOIN "public"."tblBoneSize" ON "public"."tblBone"."BoneSizeID" = "public"."tblBoneSize"."BoneSizeID"
LEFT JOIN "public"."tblBoneSex" ON "public"."tblBone"."SexID" = "public"."tblBoneSex"."SexID"
LEFT JOIN "public"."tblBoneCondition" ON "public"."tblBone"."BoneConditionID" = "public"."tblBoneCondition"."BoneConditionID"
LEFT JOIN "public"."tblBoneChewType" ON "public"."tblBone"."ChewTypeID" = "public"."tblBoneChewType"."ChewTypeID"
LEFT JOIN "public"."tblBoneChewLocation" ON "public"."tblBone"."ChewLocationID" = "public"."tblBoneChewLocation"."ChewLocationID"
LEFT JOIN "public"."tblBoneButcherMethod" ON "public"."tblBone"."ButcherMethodID" = "public"."tblBoneButcherMethod"."ButcherMethodID"
LEFT JOIN "public"."tblBoneButcherLocation" ON "public"."tblBone"."ButcherLocationID" = "public"."tblBoneButcherLocation"."ButcherLocationID"
LEFT JOIN "public"."tblBoneButcherDirection" ON "public"."tblBone"."ButcherDirectionID" = "public"."tblBoneButcherDirection"."ButcherDirectionID"
LEFT JOIN "public"."tblBoneMarkType" ON "public"."tblBone"."BoneMarkTypeID" = "public"."tblBoneMarkType"."BoneMarkTypeID"
LEFT JOIN "public"."tblBoneMarkLocation" ON "public"."tblBone"."BoneMarkLocationID" = "public"."tblBoneMarkLocation"."BoneMarkLocationID"
LEFT JOIN "public"."tblBoneMarkDirection" ON "public"."tblBone"."MarkDirectionID" = "public"."tblBoneMarkDirection"."MarkDirectionID"
LEFT JOIN "public"."tblBoneYesNoProbably" AS disease ON "public"."tblBone"."Disease" = disease."YesNoID"
LEFT JOIN "public"."tblBoneYesNoProbably" AS weathered ON "public"."tblBone"."Weathered" = weathered."YesNoID"
LEFT JOIN "public"."tblBoneYesNoProbably" AS burned ON "public"."tblBone"."Burned" = burned."YesNoID"
LEFT JOIN "public"."tblBoneYesNoProbably" AS freshbreak ON "public"."tblBone"."FreshBreak" = freshbreak."YesNoID"
LEFT JOIN "public"."tblBoneMeasure" ON "public"."tblBoneMeasure"."GenerateContextArtifactID" = "public"."tblBone"."GenerateContextArtifactID" 
LEFT JOIN "public"."tblBoneMeasuringDescription" ON "public"."tblBoneMeasure"."MeasuringDescriptionID" = "public"."tblBoneMeasuringDescription"."MeasuringDescriptionID"
LEFT JOIN "public"."tblBoneYesNoProbably" AS accurate ON "public"."tblBoneMeasure"."Accurate" = accurate."YesNoID"

GROUP BY 
"""ProjectName""",
"""ProjecID""",
"""Context""",
"""QuadratID""",
"""DepositType""",
"""UnitType""",
"""FeatureType""",
"""FeatureNumber""",
"""Feature roup""",
"""FeatureGroupInterpretation""",
"""DAACSStratigraphicGroup""",
"""DAACSStratigraphicGroupInterpretation""",
"""DAACSPhase""",
"""TotalCount""",
"""Reliability""",
"""TaxonEnglish""",
"""TaxonLatin""",
"""TaxonOrder""",
"""TaxonCategory""",
"""TaxonGroupCategory""",
"""BodyPart""",
"""Element""",
 """Symmetry""",
"""NISP""",
"""BoneWeight""",
"""BoneLocation""",
"""BoneDescriptor""",
"""BoneSize""",
"""Fusion""",
"""SexExpand""",
"""ChewType""",
"""ChewLocation""",
"""FreshBreak""",
"""ToothType""",
"""ToothWear""",
"""DiseaseTrauma""",
"""Weathered?""",
"""Burned?""",
"""BoneCondition""",
"""NumberCutMarks",
"""ButcherMethod""",
"""ButcherLocation""",
"""ButcherDirection""",
"""CutType""",
"""CutLocation""",
"""CutDirection""",
"""Meat WeightAdult""",
"""Meat Weight mmature""",
"""Notes""",
"""Identifier""",
"DateIdentified",
"""Accurate"""
ORDER BY
"""ProjectName""" ASC,
"""Context""" ASC,
"""TaxonEnglish""" ASC
