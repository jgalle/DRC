# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140422111246) do

  create_table "TempSTPTable", id: false, force: true do |t|
    t.string  "ContextID",         limit: 50
    t.integer "STPLevel"
    t.integer "ContextSTPLevelID"
  end

  create_table "activities", force: true do |t|
    t.integer  "user_id"
    t.string   "controller"
    t.string   "action"
    t.string   "object_id"
    t.string   "activity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "summary"
    t.string   "thumbnail"
    t.text     "body"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tblACDistance", id: false, force: true do |t|
    t.integer "ACDistance", limit: 2, null: false
  end

  add_index "tblACDistance", ["ACDistance"], name: "ACDistance", using: :btree

  create_table "tblArtifactBox", id: false, force: true do |t|
    t.integer  "BoxID",                   null: false
    t.string   "BoxNumber",   limit: 100
    t.string   "BoxLocation", limit: 50
    t.string   "ProjectID",   limit: 4
    t.string   "ProjectYear", limit: 50
    t.text     "Notes"
    t.integer  "EditorIDN"
    t.datetime "DateAdded"
    t.integer  "EditorID"
    t.datetime "DateChanged"
  end

  create_table "tblArtifactImage", id: false, force: true do |t|
    t.string  "ArtifactID",                limit: 36, null: false
    t.integer "ImageID",                              null: false
    t.integer "GenerateContextArtifactID"
  end

  add_index "tblArtifactImage", ["ArtifactID"], name: "ArtifactID", using: :btree
  add_index "tblArtifactImage", ["ArtifactID"], name: "tblGenerateArtifactIDstblArtifactImages", using: :btree
  add_index "tblArtifactImage", ["ImageID"], name: "ImageID", using: :btree
  add_index "tblArtifactImage", ["ImageID"], name: "tblImagestblArtifactImages", using: :btree

  create_table "tblBasicColor", id: false, force: true do |t|
    t.integer "BasicColorID",            null: false
    t.string  "BasicColor",   limit: 35
  end

  create_table "tblBead", id: false, force: true do |t|
    t.string   "ArtifactID",                limit: 36,                         null: false
    t.integer  "Quantity",                  limit: 2
    t.integer  "CompletenessID"
    t.integer  "BeadMaterialID"
    t.integer  "BeadManuTechID"
    t.integer  "StructureID"
    t.integer  "BeadFormID"
    t.integer  "BeadShapeID"
    t.integer  "EndTreatmentID"
    t.integer  "HeatTreated"
    t.integer  "NumberofFacets",            limit: 2
    t.integer  "DiaphaneityID"
    t.integer  "PMM"
    t.integer  "Patination"
    t.integer  "Burned"
    t.integer  "BeadWeatheredEroded"
    t.decimal  "Length",                               precision: 9, scale: 4
    t.decimal  "Width",                                precision: 9, scale: 4
    t.decimal  "Height",                               precision: 9, scale: 4
    t.decimal  "Weight",                               precision: 9, scale: 4
    t.decimal  "SizeofPerforationI",                   precision: 9, scale: 4
    t.decimal  "SizeofPerforationII",                  precision: 9, scale: 4
    t.integer  "Mended"
    t.string   "Conservation",              limit: 15
    t.integer  "EditorIDN",                                                    null: false
    t.datetime "DateAdded",                                                    null: false
    t.integer  "EditorID"
    t.datetime "DateChanged"
    t.text     "Notes"
    t.integer  "BeadTag",                   limit: 2,                          null: false
    t.integer  "BeadComplexShapeID"
    t.integer  "GenerateContextArtifactID",                                    null: false
    t.string   "KiddBeadTypeID",            limit: 7
    t.integer  "BeadBasicColorID"
    t.integer  "Decoration"
  end

  add_index "tblBead", ["ArtifactID"], name: "IX_tblBead", using: :btree
  add_index "tblBead", ["ArtifactID"], name: "tblGenerateArtifactIDstblBeads", using: :btree
  add_index "tblBead", ["BeadFormID"], name: "tblBeadFormtblBeads", using: :btree
  add_index "tblBead", ["BeadManuTechID"], name: "tblBeadManufacturingtblBeads", using: :btree
  add_index "tblBead", ["BeadMaterialID"], name: "tblBeadMaterialstblBeads", using: :btree
  add_index "tblBead", ["BeadShapeID"], name: "tblBeadShapetblBeads", using: :btree
  add_index "tblBead", ["BeadWeatheredEroded"], name: "tblYesNotblBeads2", using: :btree
  add_index "tblBead", ["Burned"], name: "tblYesNotblBeads3", using: :btree
  add_index "tblBead", ["CompletenessID"], name: "tblCompletenesstblBeads", using: :btree
  add_index "tblBead", ["DiaphaneityID"], name: "tblBeadDiaphaneitytblBeads", using: :btree
  add_index "tblBead", ["EditorID"], name: "tblBeadsEditorID", using: :btree
  add_index "tblBead", ["EditorID"], name: "tblEditorstblBeads1", using: :btree
  add_index "tblBead", ["EditorIDN"], name: "tblEditorstblBeads", using: :btree
  add_index "tblBead", ["EndTreatmentID"], name: "tblBeadEndTreatmenttblBeads", using: :btree
  add_index "tblBead", ["HeatTreated"], name: "tblYesNotblBeads5", using: :btree
  add_index "tblBead", ["Mended"], name: "tblYesNotblBeads7", using: :btree
  add_index "tblBead", ["NumberofFacets"], name: "Number of Facets", using: :btree
  add_index "tblBead", ["PMM"], name: "tblYesNotblBeads6", using: :btree
  add_index "tblBead", ["Patination"], name: "tblYesNotblBeads1", using: :btree
  add_index "tblBead", ["StructureID"], name: "tblBeadStructuretblBeads", using: :btree

  create_table "tblBeadCasing", id: false, force: true do |t|
    t.integer "BeadCasingID",                         null: false
    t.string  "ArtifactID",                limit: 36
    t.integer "CasingLayerID"
    t.integer "GenerateContextArtifactID",            null: false
    t.integer "BeadCasingBasicColorID"
  end

  create_table "tblBeadCasingLayer", id: false, force: true do |t|
    t.integer "CasingLayerID",            null: false
    t.string  "CasingLayer",   limit: 15
  end

  create_table "tblBeadComplexShape", id: false, force: true do |t|
    t.integer "BeadComplexShapeID",            null: false
    t.string  "BeadComplexShape",   limit: 20
  end

  create_table "tblBeadDecTech", id: false, force: true do |t|
    t.integer "BeadDecTechID",                        null: false
    t.string  "ArtifactID",                limit: 36
    t.integer "BeadDecorationID"
    t.integer "MunAppColorID"
    t.text    "DecDescription"
    t.integer "GenerateContextArtifactID",            null: false
  end

  create_table "tblBeadDecoration", id: false, force: true do |t|
    t.integer "BeadDecorationID",            null: false
    t.string  "BeadDecoration",   limit: 25
  end

  create_table "tblBeadDiaphaneity", id: false, force: true do |t|
    t.integer "DiaphaneityID",            null: false
    t.string  "Diaphaneity",   limit: 15
  end

  create_table "tblBeadEndTreatment", id: false, force: true do |t|
    t.integer "EndTreatmentID",            null: false
    t.string  "EndTreatment",   limit: 20
  end

  create_table "tblBeadForm", id: false, force: true do |t|
    t.integer "BeadFormID",            null: false
    t.string  "BeadForm",   limit: 25
  end

  create_table "tblBeadKiddBeadType", id: false, force: true do |t|
    t.string "KiddBeadTypeID", limit: 7,  null: false
    t.string "KiddBeadType",   limit: 50, null: false
  end

  create_table "tblBeadManuTech", id: false, force: true do |t|
    t.integer "BeadManuTechID",            null: false
    t.string  "BeadManuTech",   limit: 25
  end

  create_table "tblBeadMaterial", id: false, force: true do |t|
    t.integer "BeadMaterialID",            null: false
    t.string  "BeadMaterial",   limit: 20
  end

  create_table "tblBeadShape", id: false, force: true do |t|
    t.integer "BeadShapeID",            null: false
    t.string  "BeadShape",   limit: 25
  end

  create_table "tblBeadStructure", id: false, force: true do |t|
    t.integer "StructureID",            null: false
    t.string  "Structure",   limit: 15
  end

  create_table "tblBone", id: false, force: true do |t|
    t.string   "ArtifactID",                limit: 36,                         null: false
    t.integer  "Quantity",                  limit: 2,                          null: false
    t.integer  "ReliabilityID"
    t.integer  "TaxonID"
    t.string   "BoneElementID",             limit: 3
    t.integer  "SymmetryID"
    t.integer  "NISP",                      limit: 2
    t.decimal  "Weight",                               precision: 9, scale: 4
    t.string   "BoneLocationID",            limit: 3
    t.integer  "DescriptorID",              limit: 2
    t.string   "FusionID",                  limit: 3
    t.integer  "ToothTypeID"
    t.string   "ToothWearID",               limit: 3
    t.integer  "BoneSizeID"
    t.integer  "SexID"
    t.integer  "Disease"
    t.integer  "Weathered"
    t.integer  "Burned"
    t.integer  "BoneConditionID"
    t.integer  "ChewTypeID"
    t.integer  "ChewLocationID"
    t.integer  "FreshBreak"
    t.integer  "ButcherMethodID"
    t.integer  "ButcherLocationID"
    t.integer  "ButcherDirectionID"
    t.string   "BoneMarkTypeID",            limit: 3
    t.string   "BoneMarkLocationID",        limit: 3
    t.string   "MarkDirectionID",           limit: 3
    t.integer  "NoofCutMarks",              limit: 2
    t.text     "Comments"
    t.string   "Identifier",                limit: 30
    t.datetime "DateIdentified"
    t.integer  "EditorIDN",                                                    null: false
    t.datetime "DateAdded",                                                    null: false
    t.integer  "EditorID"
    t.datetime "DateChanged"
    t.integer  "BonesTag",                  limit: 2,                          null: false
    t.integer  "GenerateContextArtifactID",                                    null: false
  end

  create_table "tblBoneButcherDirection", id: false, force: true do |t|
    t.integer "ButcherDirectionID",            null: false
    t.string  "ButcherDirection",   limit: 30
  end

  create_table "tblBoneButcherLocation", id: false, force: true do |t|
    t.integer "ButcherLocationID",            null: false
    t.string  "ButcherLocation",   limit: 25
  end

  create_table "tblBoneButcherMethod", id: false, force: true do |t|
    t.integer "ButcherMethodID",            null: false
    t.string  "ButcherMethod",   limit: 15
  end

  create_table "tblBoneChewLocation", id: false, force: true do |t|
    t.integer "ChewLocationID",            null: false
    t.string  "ChewLocation",   limit: 25
  end

  create_table "tblBoneChewType", id: false, force: true do |t|
    t.integer "ChewTypeID",            null: false
    t.string  "ChewType",   limit: 13
  end

  create_table "tblBoneCondition", id: false, force: true do |t|
    t.integer "BoneConditionID",            null: false
    t.string  "BoneCondition",   limit: 10
  end

  create_table "tblBoneDescriptor", id: false, force: true do |t|
    t.string  "Descriptor",   limit: 50
    t.integer "DescriptorID", limit: 2,  null: false
  end

  create_table "tblBoneElement", id: false, force: true do |t|
    t.string "BoneElementID", limit: 3,  null: false
    t.string "BoneElement",   limit: 30
    t.string "BodyPart",      limit: 10
  end

  create_table "tblBoneFusion", id: false, force: true do |t|
    t.string "Fusion",   limit: 40
    t.string "FusionID", limit: 3,  null: false
  end

  create_table "tblBoneLocation", id: false, force: true do |t|
    t.string "BoneLocation",   limit: 30
    t.string "BoneLocationID", limit: 3,  null: false
  end

  create_table "tblBoneMarkDirection", id: false, force: true do |t|
    t.string "MarkDirection",   limit: 30
    t.string "MarkDirectionID", limit: 3,  null: false
  end

  create_table "tblBoneMarkLocation", id: false, force: true do |t|
    t.string "BoneMarkLocation",   limit: 25
    t.string "BoneMarkLocationID", limit: 3,  null: false
  end

  create_table "tblBoneMarkType", id: false, force: true do |t|
    t.string "BoneMarkType",   limit: 20
    t.string "BoneMarkTypeID", limit: 3,  null: false
  end

  create_table "tblBoneMeasure", id: false, force: true do |t|
    t.integer  "BoneMeasureID",                                                null: false
    t.string   "ArtifactID",                limit: 36
    t.integer  "MeasuringDescriptionID"
    t.decimal  "Measurement",                          precision: 9, scale: 4
    t.integer  "Accurate"
    t.integer  "EditorIDN"
    t.datetime "AddDate"
    t.integer  "EditorID"
    t.datetime "ChangeDate"
    t.integer  "GenerateContextArtifactID",                                    null: false
  end

  create_table "tblBoneMeasuringDescription", id: false, force: true do |t|
    t.integer "MeasuringDescriptionID",           null: false
    t.string  "MeasuringDescription",   limit: 7
  end

  create_table "tblBoneReliability", id: false, force: true do |t|
    t.integer "ReliabilityID",              null: false
    t.string  "Reliability",     limit: 10
    t.string  "ReliabilityCode", limit: 3
  end

  create_table "tblBoneSex", id: false, force: true do |t|
    t.integer "SexID",            null: false
    t.string  "Sex",   limit: 13
  end

  add_index "tblBoneSex", ["SexID"], name: "SexID", using: :btree

  create_table "tblBoneSize", id: false, force: true do |t|
    t.integer "BoneSizeID",            null: false
    t.string  "BoneSize",   limit: 50
  end

  add_index "tblBoneSize", ["BoneSizeID"], name: "SizeID", using: :btree

  create_table "tblBoneSummary", id: false, force: true do |t|
    t.integer  "SummaryID",              null: false
    t.string   "MetaContext", limit: 25
    t.string   "Phase",       limit: 25
    t.string   "Taxon",       limit: 5
    t.integer  "MNIAd",       limit: 2
    t.integer  "MNIIm",       limit: 2
    t.integer  "EditorIDN"
    t.datetime "AddDate"
    t.integer  "EditorID"
    t.datetime "ChangeDate"
  end

  create_table "tblBoneSymmetry", id: false, force: true do |t|
    t.integer "SymmetryID",            null: false
    t.string  "Symmetry",   limit: 13
  end

  create_table "tblBoneTaxon", id: false, force: true do |t|
    t.integer "TaxonID",                                               null: false
    t.string  "Taxon",              limit: 10
    t.string  "Latin",              limit: 32
    t.string  "English",            limit: 30
    t.string  "TaxonCategoryID",    limit: 2
    t.decimal "MtWtAd",                        precision: 9, scale: 4
    t.decimal "MtWtIm",                        precision: 9, scale: 4
    t.float   "TxnOrder"
    t.string  "TaxonGroupCategory", limit: 50
    t.string  "ClassCategory",      limit: 50
    t.string  "BiomassCategory",    limit: 50
    t.string  "PgCowSG",            limit: 50
    t.string  "IdorUnid",           limit: 50
    t.string  "WildorDomestic",     limit: 50
    t.string  "BoneType",           limit: 50
  end

  create_table "tblBoneTaxonCategory", id: false, force: true do |t|
    t.string "TaxonCategoryID", limit: 2,  null: false
    t.string "TaxonCategory",   limit: 20
  end

  create_table "tblBoneToothType", id: false, force: true do |t|
    t.integer "ToothTypeID",            null: false
    t.string  "ToothType",   limit: 14
  end

  create_table "tblBoneToothWear", id: false, force: true do |t|
    t.string "ToothWear",   limit: 50
    t.string "ToothWearID", limit: 3,  null: false
  end

  create_table "tblBoneYesNoProbably", id: false, force: true do |t|
    t.integer "YesNoID",            null: false
    t.string  "YesNO",   limit: 10
  end

  add_index "tblBoneYesNoProbably", ["YesNoID"], name: "YesNoID", using: :btree

  create_table "tblBuckle", id: false, force: true do |t|
    t.string   "ArtifactID",                limit: 36,                         null: false
    t.integer  "Quantity",                  limit: 2,                          null: false
    t.integer  "BuckleTypeID"
    t.integer  "BuckleCompletenessID"
    t.integer  "FramePlatingID"
    t.decimal  "Weight",                               precision: 9, scale: 4
    t.string   "Marks",                     limit: 50
    t.integer  "Burned"
    t.string   "Conservation",              limit: 15
    t.integer  "Mended"
    t.integer  "PMM"
    t.integer  "EditorIDN",                                                    null: false
    t.datetime "DateAdded",                                                    null: false
    t.integer  "EditorID"
    t.datetime "DateChanged"
    t.text     "Notes"
    t.integer  "BuckleTag",                 limit: 2,                          null: false
    t.integer  "GenerateContextArtifactID",                                    null: false
    t.integer  "Decoration"
  end

  create_table "tblBuckleCompleteness", id: false, force: true do |t|
    t.integer "BuckleCompletenessID",            null: false
    t.string  "BuckleCompleteness",   limit: 25
  end

  create_table "tblBuckleDecMotif", id: false, force: true do |t|
    t.integer "BuckleDecMotifID",            null: false
    t.string  "BuckleDecMotif",   limit: 25
  end

  create_table "tblBuckleDecTech", id: false, force: true do |t|
    t.integer "BuckleDecTechID",                      null: false
    t.string  "ArtifactID",                limit: 36
    t.integer "BuckleDecTechTypeID"
    t.integer "BuckleDecMotifID"
    t.integer "GenerateContextArtifactID",            null: false
  end

  create_table "tblBuckleDecTechType", id: false, force: true do |t|
    t.integer "BuckleDecTechTypeID",            null: false
    t.string  "BuckleDecTechType",   limit: 15
  end

  create_table "tblBuckleElement", id: false, force: true do |t|
    t.integer "BuckleElementID",            null: false
    t.string  "BuckleElement",   limit: 15
  end

  create_table "tblBuckleForm", id: false, force: true do |t|
    t.integer "BuckleFormID",                                                 null: false
    t.string  "ArtifactID",                limit: 36
    t.integer "BucklePartID"
    t.integer "BuckleMaterialID"
    t.integer "BuckleManuTechID"
    t.integer "BuckleShapeID"
    t.integer "BuckleElementID"
    t.decimal "Length",                               precision: 9, scale: 4
    t.decimal "Width",                                precision: 9, scale: 4
    t.decimal "PinCenterpointMeasure",                precision: 9, scale: 4
    t.integer "GenerateContextArtifactID",                                    null: false
  end

  create_table "tblBuckleFramePlating", id: false, force: true do |t|
    t.integer "FramePlatingID",            null: false
    t.string  "FramePlating",   limit: 15
  end

  create_table "tblBuckleManuTech", id: false, force: true do |t|
    t.integer "BuckleManuTechID",            null: false
    t.string  "BuckleManuTech",   limit: 15
  end

  create_table "tblBuckleMaterial", id: false, force: true do |t|
    t.integer "BuckleMaterialID",            null: false
    t.string  "BuckleMaterial",   limit: 15
  end

  create_table "tblBucklePart", id: false, force: true do |t|
    t.integer "BucklePartID",            null: false
    t.string  "BucklePart",   limit: 15
  end

  create_table "tblBuckleShape", id: false, force: true do |t|
    t.integer "BuckleShapeID",            null: false
    t.string  "BuckleShape",   limit: 15
  end

  create_table "tblBuckleType", id: false, force: true do |t|
    t.integer "BuckleTypeID",            null: false
    t.string  "BuckleType",   limit: 20
  end

  create_table "tblButton", id: false, force: true do |t|
    t.string   "ArtifactID",                limit: 36,                         null: false
    t.integer  "Quantity",                  limit: 2,                          null: false
    t.integer  "CompletenessID"
    t.integer  "ButtonManuTechID"
    t.integer  "ButtonTypeID"
    t.integer  "ButtonShapeID"
    t.integer  "ButtonFaceMaterialID"
    t.integer  "ButtonMaterialID"
    t.integer  "EyeID"
    t.integer  "ShankStyleID"
    t.integer  "ShankMaterialID"
    t.integer  "ShankConditionID"
    t.integer  "ButtonMetalColorID"
    t.integer  "Burned"
    t.decimal  "Length",                               precision: 9, scale: 4
    t.decimal  "Width",                                precision: 9, scale: 4
    t.decimal  "Height",                               precision: 9, scale: 4
    t.decimal  "Weight",                               precision: 9, scale: 4
    t.string   "BackStamp",                 limit: 15
    t.string   "Conservation",              limit: 15
    t.integer  "PMM"
    t.integer  "EditorIDN",                                                    null: false
    t.datetime "DateAdded",                                                    null: false
    t.integer  "EditorID"
    t.datetime "DateChanged"
    t.text     "Notes"
    t.integer  "ButtonTag",                 limit: 2,                          null: false
    t.integer  "ButtonFaceManuTechID"
    t.decimal  "Diameter",                             precision: 9, scale: 4
    t.integer  "ButtonJoinMethodID"
    t.integer  "GenerateContextArtifactID",                                    null: false
    t.integer  "ButtonBasicColorID"
    t.integer  "Decoration"
  end

  create_table "tblButtonDecTech", id: false, force: true do |t|
    t.integer "ButtonDecTechID",                        null: false
    t.string  "ArtifactID",                limit: 36
    t.integer "ButtonDecorationID"
    t.integer "JewelInlayMaterialID"
    t.string  "DecorativeMotif",           limit: 4000
    t.integer "GenerateContextArtifactID",              null: false
    t.integer "ButtonDecTechBasicColorID"
  end

  create_table "tblButtonDecoration", id: false, force: true do |t|
    t.integer "ButtonDecorationID",            null: false
    t.string  "ButtonDecoration",   limit: 20
  end

  create_table "tblButtonEye", id: false, force: true do |t|
    t.integer "EyeID",            null: false
    t.string  "Eye",   limit: 15
  end

  create_table "tblButtonJewelInlayMaterial", id: false, force: true do |t|
    t.integer "JewelInlayMaterialID",            null: false
    t.string  "JewelInlayMaterial",   limit: 15
  end

  create_table "tblButtonJoinMethod", id: false, force: true do |t|
    t.integer "ButtonJoinMethodID",            null: false
    t.string  "ButtonJoinMethod",   limit: 20
  end

  create_table "tblButtonManuTech", id: false, force: true do |t|
    t.integer "ButtonManuTechID",            null: false
    t.string  "ButtonManuTech",   limit: 20
  end

  create_table "tblButtonMaterial", id: false, force: true do |t|
    t.integer "ButtonMaterialID",            null: false
    t.string  "ButtonMaterial",   limit: 20
  end

  create_table "tblButtonMetalColor", id: false, force: true do |t|
    t.integer "ButtonMetalColorID",            null: false
    t.string  "ButtonMetalColor",   limit: 15
  end

  create_table "tblButtonShankCondition", id: false, force: true do |t|
    t.integer "ShankConditionID",            null: false
    t.string  "ShankCondition",   limit: 15
  end

  add_index "tblButtonShankCondition", ["ShankConditionID"], name: "ShankConditionID", using: :btree

  create_table "tblButtonShankMaterial", id: false, force: true do |t|
    t.integer "ShankMaterialID",            null: false
    t.string  "ShankMaterial",   limit: 15
  end

  add_index "tblButtonShankMaterial", ["ShankMaterialID"], name: "ShankMaterialID", using: :btree

  create_table "tblButtonShankStyle", id: false, force: true do |t|
    t.integer "ShankStyleID",            null: false
    t.string  "ShankStyle",   limit: 30
  end

  create_table "tblButtonShape", id: false, force: true do |t|
    t.integer "ButtonShapeID",            null: false
    t.string  "ButtonShape",   limit: 15
  end

  create_table "tblButtonType", id: false, force: true do |t|
    t.integer "ButtonTypeID",            null: false
    t.string  "ButtonType",   limit: 25
  end

  create_table "tblCeramic", id: false, force: true do |t|
    t.string   "ArtifactID",                limit: 36,                           null: false
    t.integer  "Quantity",                  limit: 2,                            null: false
    t.integer  "CeramicMaterialID"
    t.integer  "CeramicManuTechID"
    t.integer  "WareID"
    t.integer  "CeramicVesselCategoryID"
    t.integer  "CeramicFormID"
    t.integer  "MendedFormID"
    t.integer  "CeramicCompletenessID"
    t.integer  "ExteriorGlazeID"
    t.integer  "ExteriorMunAppColorID"
    t.integer  "InteriorGlazeID"
    t.integer  "InteriorMunAppColorID"
    t.integer  "OxidizedVersusReducedID"
    t.integer  "EvidenceofBurningID"
    t.integer  "Mended"
    t.integer  "PMM"
    t.text     "PatternNotes"
    t.text     "PatternReference"
    t.integer  "CeramicGenreID"
    t.integer  "BaseMarkID"
    t.string   "BaseMarkReference",         limit: 500
    t.decimal  "SherdThickness",                        precision: 9,  scale: 4
    t.integer  "MaximumSherdMeasurement",   limit: 2
    t.decimal  "SherdWeight",                           precision: 9,  scale: 4
    t.decimal  "RimLength",                             precision: 9,  scale: 4
    t.integer  "RimDiameter",               limit: 2
    t.integer  "MendedRimDiameter",         limit: 2
    t.integer  "ACDistance",                limit: 2
    t.decimal  "CurvedDialReading",                     precision: 9,  scale: 4
    t.decimal  "FlatDialReading",                       precision: 9,  scale: 4
    t.text     "Notes"
    t.integer  "EditorIDN",                                                      null: false
    t.datetime "DateAdded",                                                      null: false
    t.integer  "EditorID"
    t.datetime "DateChanged"
    t.integer  "CeramicTag",                limit: 2,                            null: false
    t.decimal  "MendedSherdWeight",                     precision: 9,  scale: 4
    t.integer  "RimFormID"
    t.integer  "RimAngleID"
    t.integer  "PasteInclusionDensityID"
    t.decimal  "MaxRimWidth",                           precision: 9,  scale: 4
    t.integer  "PatternNameID"
    t.integer  "GenerateContextArtifactID",                                      null: false
    t.decimal  "BaseLength",                            precision: 18, scale: 4
    t.decimal  "BaseDiameter",                          precision: 18, scale: 4
    t.decimal  "MendedBaseDiameter",                    precision: 18, scale: 4
    t.integer  "CeramicCEWTypeID"
    t.integer  "CeramicCEWDecModeID"
    t.integer  "CeramicCEWBaseFormID"
    t.integer  "CeramicCEWFootringFormID"
    t.integer  "ExteriorGlazeOpacityID"
    t.integer  "InteriorGlazeOpacityID"
    t.integer  "BaseMarkBasicColorID"
    t.integer  "DecorationYN"
  end

  create_table "tblCeramicBaseMark", id: false, force: true do |t|
    t.integer "BaseMarkID",            null: false
    t.string  "BaseMark",   limit: 15
  end

  create_table "tblCeramicBurning", id: false, force: true do |t|
    t.integer "EvidenceofBurningID",            null: false
    t.string  "EvidenceofBurning",   limit: 35
  end

  create_table "tblCeramicCEWBaseForm", id: false, force: true do |t|
    t.integer "CeramicCEWBaseFormID",            null: false
    t.string  "CeramicCEWBaseForm",   limit: 50
  end

  create_table "tblCeramicCEWDecMode", id: false, force: true do |t|
    t.integer "CeramicCEWDecModeID",            null: false
    t.string  "CeramicCEWDecMode",   limit: 50
  end

  create_table "tblCeramicCEWFootringForm", id: false, force: true do |t|
    t.integer "CeramicCEWFootringFormID",            null: false
    t.string  "CeramicCEWFootringForm",   limit: 50
  end

  create_table "tblCeramicCEWType", id: false, force: true do |t|
    t.integer "CeramicCEWTypeID",            null: false
    t.string  "CeramicCEWType",   limit: 25
  end

  create_table "tblCeramicColonoThickness", id: false, force: true do |t|
    t.integer "ColonoThicknessID",                                            null: false
    t.string  "ArtifactID",                limit: 36,                         null: false
    t.integer "CeramicCompletenessID",                                        null: false
    t.decimal "ColonoSherdThickness",                 precision: 9, scale: 4, null: false
    t.integer "GenerateContextArtifactID"
  end

  create_table "tblCeramicCompleteness", id: false, force: true do |t|
    t.integer "CeramicCompletenessID",            null: false
    t.string  "CeramicCompleteness",   limit: 30
  end

  create_table "tblCeramicDecTech", id: false, force: true do |t|
    t.integer "CeramicDecTechID",                     null: false
    t.string  "ArtifactID",                limit: 36, null: false
    t.integer "CeramicDecTechTypeID"
    t.integer "MunAppColorID"
    t.integer "InteriorExteriorID"
    t.integer "CeramicDecTechLocationID"
    t.integer "CeramicDecTechStyElemID"
    t.integer "CeramicDecTechMotifID"
    t.integer "GenerateContextArtifactID",            null: false
  end

  create_table "tblCeramicDecTechInteriorExterior", id: false, force: true do |t|
    t.integer "InteriorExteriorID",           null: false
    t.string  "InteriorExterior",   limit: 9
  end

  create_table "tblCeramicDecTechLocation", id: false, force: true do |t|
    t.integer "CeramicDecTechLocationID",            null: false
    t.string  "CeramicDecTechLocation",   limit: 20
  end

  create_table "tblCeramicDecTechMotif", id: false, force: true do |t|
    t.integer "CeramicDecTechMotifID",            null: false
    t.string  "CeramicDecTechMotif",   limit: 25
  end

  create_table "tblCeramicDecTechStyElement", id: false, force: true do |t|
    t.integer "DecTechStyElemID",            null: false
    t.string  "DecTechStyElem",   limit: 30
  end

  create_table "tblCeramicDecTechType", id: false, force: true do |t|
    t.integer "CeramicDecTechTypeID",            null: false
    t.string  "CeramicDecTechType",   limit: 45
  end

  create_table "tblCeramicForm", id: false, force: true do |t|
    t.integer "CeramicFormID",            null: false
    t.string  "CeramicForm",   limit: 30
  end

  create_table "tblCeramicGenre", id: false, force: true do |t|
    t.integer "CeramicGenreID",             null: false
    t.string  "CeramicGenre",    limit: 50, null: false
    t.string  "GenreWareTypes",  limit: 75
    t.text    "GenreReferences"
  end

  create_table "tblCeramicGlaze", id: false, force: true do |t|
    t.integer "CeramicGlazeID",            null: false
    t.string  "CeramicGlaze",   limit: 25
  end

  create_table "tblCeramicGlazeOpacity", id: false, force: true do |t|
    t.integer "CeramicGlazeOpacityID",            null: false
    t.string  "CeramicGlazeOpacity",   limit: 50
  end

  create_table "tblCeramicManuTech", id: false, force: true do |t|
    t.integer "CeramicManuTechID",            null: false
    t.string  "CeramicManuTech",   limit: 20
  end

  create_table "tblCeramicMaterial", id: false, force: true do |t|
    t.integer "CeramicMaterialID",            null: false
    t.string  "CeramicMaterial",   limit: 15
  end

  create_table "tblCeramicMends", id: false, force: true do |t|
    t.integer "CeramicMendID",                             null: false
    t.string  "ArtifactID",                     limit: 36, null: false
    t.string  "MendsToArtifactID",              limit: 36, null: false
    t.integer "MendsGenerateContextArtifactID"
    t.integer "GenerateContextArtifactID"
  end

  create_table "tblCeramicOxidized", id: false, force: true do |t|
    t.integer "OxidizedVersusReducedID",            null: false
    t.string  "OxidizedVersusReduced",   limit: 25
  end

  create_table "tblCeramicPasteInclusion", primary_key: "CeramicPasteInclusionID", force: true do |t|
    t.string  "ArtifactID",                limit: 36, null: false
    t.integer "PasteInclusionID",                     null: false
    t.integer "GenerateContextArtifactID",            null: false
  end

  add_index "tblCeramicPasteInclusion", ["ArtifactID"], name: "IX_tblCeramicPasteInclusion", using: :btree
  add_index "tblCeramicPasteInclusion", ["ArtifactID"], name: "tblCeramicstblCeramicInclusionsRelated", using: :btree
  add_index "tblCeramicPasteInclusion", ["PasteInclusionID"], name: "tblCeramicInclusionstblCeramicInclusionsRelated", using: :btree

  create_table "tblCeramicPasteInclusionDensity", id: false, force: true do |t|
    t.integer "PasteInclusionDensityID",            null: false
    t.string  "PasteInclusionDensity",   limit: 30
  end

  create_table "tblCeramicPatternName", id: false, force: true do |t|
    t.integer "PatternNameID",               null: false
    t.string  "PatternName",      limit: 50
    t.string  "PatternWareTypes", limit: 75
    t.text    "PatternReference"
  end

  create_table "tblCeramicRimAngle", id: false, force: true do |t|
    t.integer "RimAngleID",            null: false
    t.string  "RimAngle",   limit: 30
  end

  create_table "tblCeramicRimForm", id: false, force: true do |t|
    t.integer "RimFormID",            null: false
    t.string  "RimForm",   limit: 30
  end

  create_table "tblCeramicStyElemDecTechType", id: false, force: true do |t|
    t.integer "StyElemDecTechTypeID", null: false
    t.integer "StyElemMetaDataID"
    t.integer "CeramicDecTechTypeID"
  end

  create_table "tblCeramicStyElemDesignMotif", id: false, force: true do |t|
    t.integer "StyElemDesignMotifID",            null: false
    t.string  "StyElemDesignMotif",   limit: 50
  end

  create_table "tblCeramicStyElemGenre", id: false, force: true do |t|
    t.integer "StyElemGenreID",    null: false
    t.integer "StyElemMetaDataID"
    t.integer "CeramicGenreID"
  end

  create_table "tblCeramicStyElemIndividualDesign", id: false, force: true do |t|
    t.integer "StyElemIndividualDesignID",                null: false
    t.integer "StyElemMetaDataID"
    t.string  "StyElemIndividualDesignElemID", limit: 50
  end

  create_table "tblCeramicStyElemIndividualDesignElement", id: false, force: true do |t|
    t.integer "StyElemIndividualDesignElemID",            null: false
    t.string  "StyElemIndividualDesignElem",   limit: 50
  end

  create_table "tblCeramicStyElemManuTech", id: false, force: true do |t|
    t.integer "StyElemManuTechID",            null: false
    t.string  "StyElemManuTech",   limit: 20
  end

  create_table "tblCeramicStyElemMetaData", id: false, force: true do |t|
    t.integer "StyElemMetaDataID",          null: false
    t.integer "CeramicDecTechStyElementID"
    t.integer "StyElemManuTechID"
    t.integer "StyElemTypeID"
    t.integer "StyElemDesignMotifID"
  end

  create_table "tblCeramicStyElemType", id: false, force: true do |t|
    t.integer "StyElemTypeID",            null: false
    t.string  "StyElemType",   limit: 25
  end

  create_table "tblCeramicStyElemWare", id: false, force: true do |t|
    t.integer "StyElemWareID",     null: false
    t.integer "StyElemMetaDataID"
    t.integer "WareID"
  end

  create_table "tblCeramicUseWear", id: false, force: true do |t|
    t.string  "ArtifactID",                limit: 36
    t.integer "UseWearLocationID"
    t.integer "UseWearPatternID"
    t.integer "CeramicUseWearID",                     null: false
    t.integer "GenerateContextArtifactID",            null: false
    t.integer "CeramicCompletenessID"
  end

  create_table "tblCeramicUseWearLocation", id: false, force: true do |t|
    t.integer "UseWearLocationID",            null: false
    t.string  "UseWearLocation",   limit: 20
  end

  create_table "tblCeramicUseWearPattern", id: false, force: true do |t|
    t.integer "UseWearPatternID",            null: false
    t.string  "UseWearPattern",   limit: 20
  end

  create_table "tblCeramicVesselCategory", id: false, force: true do |t|
    t.integer "CeramicVesselCategoryID",            null: false
    t.string  "CeramicVesselCategory",   limit: 15
  end

  create_table "tblCeramicWare", id: false, force: true do |t|
    t.integer "WareID",            null: false
    t.string  "Ware",   limit: 50
  end

  create_table "tblCompleteness", id: false, force: true do |t|
    t.integer "CompletenessID",            null: false
    t.string  "Completeness",   limit: 10
  end

  create_table "tblContext", id: false, force: true do |t|
    t.string   "ContextID",                             limit: 15,                           null: false
    t.string   "ProjectID",                             limit: 4,                            null: false
    t.string   "Context",                               limit: 10,                           null: false
    t.string   "QuadratID",                             limit: 10
    t.integer  "Excavated"
    t.integer  "LevelTypeID"
    t.integer  "DepositTypeID"
    t.string   "FeatureNumber",                         limit: 50
    t.string   "MasterContextNumber",                   limit: 50
    t.string   "MasterContextInterpretation",           limit: 50
    t.string   "DAACSStratigraphicGroupInterpretation", limit: 250
    t.string   "DAACSStratigraphicGroup",               limit: 50
    t.string   "DAACSPhase",                            limit: 5
    t.string   "ExcavatorPhase",                        limit: 5
    t.decimal  "ContextLength",                                     precision: 18, scale: 4
    t.decimal  "ContextWidth",                                      precision: 18, scale: 4
    t.decimal  "MaximumLithostratigraphicThickness",                precision: 18, scale: 4
    t.text     "ExcavatorDescription"
    t.decimal  "ActualMeasuredVolume",                              precision: 18, scale: 4
    t.integer  "UnitTypeID"
    t.string   "UnitSize",                              limit: 13
    t.decimal  "QuadratLength",                                     precision: 18, scale: 4
    t.decimal  "QuadratWidth",                                      precision: 18, scale: 4
    t.integer  "ArtifactPresence"
    t.string   "TPQ",                                   limit: 4
    t.text     "TPQNotes"
    t.integer  "Photographs"
    t.text     "PlanDrawings"
    t.text     "ProfileDrawings"
    t.text     "ExcavatorInterpretation"
    t.datetime "DateOpened"
    t.datetime "DateClosed"
    t.string   "ExcavatedBy",                           limit: 15
    t.string   "RecordedBy",                            limit: 15
    t.integer  "EditorIDN",                                                                  null: false
    t.datetime "DateAdded",                                                                  null: false
    t.integer  "EditorID"
    t.datetime "DateChanged"
    t.text     "DataEntryNotes"
    t.integer  "ContextTag",                            limit: 2,                            null: false
    t.decimal  "STPNorthing",                                       precision: 18, scale: 4
    t.decimal  "STPEasting",                                        precision: 18, scale: 4
    t.integer  "FeatureTypeID"
    t.integer  "SpatialDistribution"
    t.integer  "ContextAutoID",                                                              null: false
    t.string   "CAPlowzonePhase",                       limit: 25
    t.string   "LevelDesignation",                      limit: 5
    t.string   "CRN",                                   limit: 15
  end

  create_table "tblContextArtifactBox", id: false, force: true do |t|
    t.string  "ContextID", limit: 25, null: false
    t.integer "BoxID",                null: false
  end

  create_table "tblContextDepositType", id: false, force: true do |t|
    t.integer "DepositTypeID",            null: false
    t.string  "DepositType",   limit: 50
  end

  add_index "tblContextDepositType", ["DepositTypeID"], name: "DepositTypeID", using: :btree

  create_table "tblContextElevation", id: false, force: true do |t|
    t.integer "ContextElevationID",                                        null: false
    t.string  "ContextID",             limit: 15
    t.integer "OpeningClosingID"
    t.integer "ContextElevationLocID"
    t.decimal "ElevationAmount",                  precision: 18, scale: 4
    t.integer "ContextAutoID",                                             null: false
  end

  create_table "tblContextElevationLocation", id: false, force: true do |t|
    t.integer "ContextElevationLocID",           null: false
    t.string  "ContextElevationLoc",   limit: 6
  end

  add_index "tblContextElevationLocation", ["ContextElevationLocID"], name: "ContextLocationID", using: :btree

  create_table "tblContextFeature", id: false, force: true do |t|
    t.integer  "FeatureID",                                                        null: false
    t.string   "ProjectID",                  limit: 4,                             null: false
    t.string   "FeatureNumber",              limit: 50,                            null: false
    t.decimal  "Length",                                  precision: 18, scale: 4
    t.decimal  "Width",                                   precision: 18, scale: 4
    t.decimal  "Depth",                                   precision: 18, scale: 4
    t.string   "Description",                limit: 4000
    t.integer  "FeatureTypeID",                                                    null: false
    t.string   "QuadratID",                  limit: 10
    t.decimal  "CentroidX",                               precision: 18, scale: 4
    t.decimal  "CentroidY",                               precision: 18, scale: 4
    t.decimal  "FeatureTPQ",                              precision: 18, scale: 4
    t.integer  "PlanShapeID"
    t.integer  "ProfileShapeID"
    t.string   "FeatureGroup",               limit: 20
    t.string   "FeatureGroupInterpretation", limit: 4000
    t.decimal  "OriginalPitCutLength",                    precision: 18, scale: 4
    t.decimal  "OriginalPitCutWidth",                     precision: 18, scale: 4
    t.decimal  "OriginalPitCutDepth",                     precision: 18, scale: 4
    t.integer  "EditorIDN"
    t.datetime "DateAdded"
    t.integer  "EditorID"
    t.datetime "DateChanged"
  end

  create_table "tblContextFeatureImage", id: false, force: true do |t|
    t.integer "ImageID",   null: false
    t.integer "FeatureID", null: false
  end

  create_table "tblContextFeaturePlanShape", id: false, force: true do |t|
    t.integer "PlanSahpeID",            null: false
    t.string  "PlanShape",   limit: 50, null: false
  end

  create_table "tblContextFeatureProfileShape", id: false, force: true do |t|
    t.integer "ProfileShapeID",            null: false
    t.string  "ProfileShape",   limit: 20, null: false
  end

  create_table "tblContextFeatureType", id: false, force: true do |t|
    t.integer "FeatureTypeID",            null: false
    t.string  "FeatureType",   limit: 60
  end

  create_table "tblContextFineSediment", id: false, force: true do |t|
    t.integer "FineSedimentID",                               null: false
    t.string  "ContextID",                         limit: 15
    t.integer "FineSedimentTextureID"
    t.integer "RankOrder",                         limit: 2
    t.integer "MunSedColorID"
    t.string  "ExcavatorSedimentColorDescription", limit: 50
    t.integer "PercentageID"
    t.integer "ContextAutoID",                                null: false
  end

  add_index "tblContextFineSediment", ["ContextID"], name: "tblContexttblContextFineSedimentsRelated", using: :btree
  add_index "tblContextFineSediment", ["FineSedimentTextureID"], name: "tblContextFineSedimentTexturetblContextFineSedimentsRelated", using: :btree
  add_index "tblContextFineSediment", ["MunSedColorID"], name: "tblContextSedimentsColortblContextFineSedimentsRelated", using: :btree
  add_index "tblContextFineSediment", ["MunSedColorID"], name: "tblContextSedimentsColortblContextFineSedimentsRelated1", using: :btree
  add_index "tblContextFineSediment", ["PercentageID"], name: "tblContextPercentagetblContextFineSedimentsRelated", using: :btree
  add_index "tblContextFineSediment", ["RankOrder"], name: "tblContextRankOrdertblContextFineSedimentsRelated", using: :btree

  create_table "tblContextFineSedimentTexture", id: false, force: true do |t|
    t.integer "FineSedimentTextureID",            null: false
    t.string  "FineSedimentTexture",   limit: 15
  end

  add_index "tblContextFineSedimentTexture", ["FineSedimentTextureID"], name: "FineSedimentDescriptionID", using: :btree

  create_table "tblContextImage", id: false, force: true do |t|
    t.string  "ContextID",     limit: 15, null: false
    t.integer "ImageID",                  null: false
    t.integer "ContextAutoID",            null: false
  end

  add_index "tblContextImage", ["ContextID"], name: "tblContexttblContextImages", using: :btree
  add_index "tblContextImage", ["ImageID"], name: "ContextImageID", using: :btree
  add_index "tblContextImage", ["ImageID"], name: "tblImagestblContextImages", using: :btree

  create_table "tblContextInclusion", id: false, force: true do |t|
    t.integer "InclusionID",                       null: false
    t.string  "ContextID",              limit: 15
    t.integer "InclusionDescriptionID"
    t.integer "InclusionSizeID"
    t.integer "RankOrder",              limit: 2
    t.integer "PercentageID"
    t.integer "ContextAutoID",                     null: false
  end

  create_table "tblContextInclusionDescription", id: false, force: true do |t|
    t.integer "InclusionDescriptionID",            null: false
    t.string  "InclusionDescription",   limit: 20
  end

  create_table "tblContextInclusionSize", id: false, force: true do |t|
    t.integer "InclusionSizeID",            null: false
    t.string  "InclusionSize",   limit: 16
  end

  create_table "tblContextLevelType", id: false, force: true do |t|
    t.integer "LevelTypeID",            null: false
    t.string  "LevelType",   limit: 15
  end

  add_index "tblContextLevelType", ["LevelTypeID"], name: "LevelTypeID", using: :btree

  create_table "tblContextOpenClose", id: false, force: true do |t|
    t.integer "OpeningClosingID",           null: false
    t.string  "OpeningClosing",   limit: 7
  end

  add_index "tblContextOpenClose", ["OpeningClosingID"], name: "OpeningClosingID", using: :btree

  create_table "tblContextPercentage", id: false, force: true do |t|
    t.integer "PercentageID",            null: false
    t.string  "Percentage",   limit: 50
  end

  create_table "tblContextQuadratBoundary", id: false, force: true do |t|
    t.integer "QuadratBoundaryID",                                     null: false
    t.string  "QuadratID",         limit: 30,                          null: false
    t.decimal "QuadratNorthing",              precision: 18, scale: 4
    t.decimal "QuadratEasting",               precision: 18, scale: 4
    t.string  "ProjectID",         limit: 4,                           null: false
  end

  create_table "tblContextRankOrder", id: false, force: true do |t|
    t.integer "RankOrder", limit: 2, null: false
  end

  create_table "tblContextRecoveryMethod", id: false, force: true do |t|
    t.integer "RecoveryMethodID",  limit: 2,  null: false
    t.string  "RecoveryMethod",    limit: 15
    t.string  "RecoveryMethodTLA", limit: 3
  end

  create_table "tblContextSTPInclusions", id: false, force: true do |t|
    t.integer "STPInclusionID",         null: false
    t.integer "ContextSTPLevelID",      null: false
    t.integer "InclusionDescriptionID"
    t.integer "InclusionSizeID"
    t.integer "PercentageID"
  end

  create_table "tblContextSTPLevel", id: false, force: true do |t|
    t.integer "ContextSTPLevelID",                                     null: false
    t.string  "ContextID",         limit: 15,                          null: false
    t.integer "STPLevel",          limit: 2
    t.decimal "STPClosing",                   precision: 18, scale: 4
    t.integer "ContextAutoID",                                         null: false
  end

  create_table "tblContextSTPSediments", id: false, force: true do |t|
    t.integer "STPSedimentID",         null: false
    t.integer "ContextSTPLevelID",     null: false
    t.integer "FineSedimentTextureID"
    t.integer "MunSedColorID"
    t.integer "PercentageID"
  end

  create_table "tblContextSample", id: false, force: true do |t|
    t.string  "ContextID",           limit: 15,  null: false
    t.integer "RecoveryMethodID",    limit: 2,   null: false
    t.string  "SampleNumber",        limit: 5
    t.string  "ContextSampleID",     limit: 31,  null: false
    t.string  "SampleSize",          limit: 5
    t.integer "ContextSampleTypeID",             null: false
    t.integer "ScreenSizeID"
    t.string  "StorageBoxNumber",    limit: 150
    t.string  "BoxComments",         limit: 500
    t.integer "ContextAutoID",                   null: false
  end

  add_index "tblContextSample", ["ContextID"], name: "SContextID", using: :btree
  add_index "tblContextSample", ["ContextID"], name: "tblContexttblContextSamplesRelated", using: :btree
  add_index "tblContextSample", ["ContextSampleID"], name: "ContextSampleID", using: :btree
  add_index "tblContextSample", ["ContextSampleTypeID"], name: "tblContextSamplesRelatedSampleTypetblContextSamplesRelated", using: :btree
  add_index "tblContextSample", ["RecoveryMethodID"], name: "tblContextRecoveryMethodstblContextSamplesRelated", using: :btree
  add_index "tblContextSample", ["SampleNumber"], name: "SiteSampleID", using: :btree
  add_index "tblContextSample", ["ScreenSizeID"], name: "tblContextScreenSizetblContextSamplesRelated", using: :btree

  create_table "tblContextSampleLocation", id: false, force: true do |t|
    t.integer  "ContextSampleLocationAutoID",                    null: false
    t.string   "ContextSampleID",                    limit: 31,  null: false
    t.integer  "ContextSampleLocationInstitutionID"
    t.integer  "ContextSampleStatusID"
    t.datetime "DateLoaned"
    t.datetime "DateReturned"
    t.text     "SampleNotes"
    t.integer  "BoxID"
    t.string   "BoxNumber",                          limit: 100
  end

  create_table "tblContextSampleLocationInstitution", id: false, force: true do |t|
    t.integer "ContextSampleLocationInstitutionID",            null: false
    t.string  "ContextSampleLocationInstitution",   limit: 50, null: false
  end

  create_table "tblContextSampleLocationStatus", id: false, force: true do |t|
    t.integer "ContextSampleStatusID",            null: false
    t.string  "ContextSampleStatus",   limit: 50, null: false
  end

  create_table "tblContextSampleType", id: false, force: true do |t|
    t.integer "ContextSampleTypeID",            null: false
    t.string  "ContextSampleType",   limit: 15
  end

  create_table "tblContextScreenSize", id: false, force: true do |t|
    t.integer "ScreenSizeID",            null: false
    t.string  "ScreenSize",   limit: 15
  end

  create_table "tblContextStratRel", id: false, force: true do |t|
    t.integer "ContextStratRelID",            null: false
    t.string  "ContextID",         limit: 15
    t.integer "StratRelTypeID"
    t.string  "Context",           limit: 15
    t.integer "ContextAutoID",                null: false
  end

  create_table "tblContextStratRelType", id: false, force: true do |t|
    t.integer "StratRelTypeID",            null: false
    t.string  "StratRelType",   limit: 15
  end

  create_table "tblContextUnitType", id: false, force: true do |t|
    t.integer "UnitTypeID",            null: false
    t.string  "UnitType",   limit: 20
  end

  create_table "tblEditor", id: false, force: true do |t|
    t.integer "EditorID",            null: false
    t.string  "Editor",   limit: 10
  end

  create_table "tblGenArtifact", id: false, force: true do |t|
    t.string   "ArtifactID",                limit: 36,                          null: false
    t.integer  "Quantity",                                                      null: false
    t.integer  "GenArtifactCategoryID"
    t.integer  "GenArtifactFormID"
    t.integer  "GenArtifactCompletenessID"
    t.integer  "Mended"
    t.integer  "PMM"
    t.integer  "NailHeadTypeID"
    t.integer  "NailEndTypeID"
    t.integer  "NailModificationID"
    t.decimal  "NailLength",                           precision: 18, scale: 4
    t.decimal  "Length",                               precision: 18, scale: 4
    t.decimal  "Width",                                precision: 18, scale: 4
    t.decimal  "Height",                               precision: 18, scale: 4
    t.decimal  "Weight",                               precision: 18, scale: 4
    t.string   "Marks",                     limit: 50
    t.string   "DescriptionofMarks",        limit: 50
    t.string   "Conservation",              limit: 15
    t.integer  "EditorIDN",                                                     null: false
    t.datetime "DateAdded",                                                     null: false
    t.integer  "EditorID"
    t.datetime "DateChanged"
    t.text     "Notes"
    t.integer  "GeneralArtifactTag",        limit: 2,                           null: false
    t.integer  "Burned"
    t.integer  "CoinDate"
    t.integer  "BrickSizeID"
    t.integer  "GenerateContextArtifactID",                                     null: false
    t.integer  "DecorationYN"
    t.decimal  "Diameter",                             precision: 18, scale: 4
  end

  create_table "tblGenArtifactBrickSize", id: false, force: true do |t|
    t.integer "BrickSizeID",            null: false
    t.string  "BrickSize",   limit: 50
  end

  create_table "tblGenArtifactCategory", id: false, force: true do |t|
    t.integer "GenArtifactCategoryID",            null: false
    t.string  "GenArtifactCategory",   limit: 17
  end

  create_table "tblGenArtifactCompleteness", id: false, force: true do |t|
    t.integer "GenArtifactCompletenessID",            null: false
    t.string  "GenArtifactCompleteness",   limit: 25
  end

  create_table "tblGenArtifactDecTech", id: false, force: true do |t|
    t.integer "GenArtifactDecTechID",                 null: false
    t.string  "ArtifactID",                limit: 36
    t.integer "GenArtifactDecTechTypeID"
    t.text    "DecorationNotes"
    t.integer "GenerateContextArtifactID",            null: false
    t.integer "GenArtDecTechBasicColorID"
  end

  create_table "tblGenArtifactDecTechType", id: false, force: true do |t|
    t.integer "GenArtifactDecTechTypeID",            null: false
    t.string  "GenArtifactDecTechType",   limit: 50
  end

  create_table "tblGenArtifactForm", id: false, force: true do |t|
    t.integer "GenArtifactFormID",            null: false
    t.string  "GenArtifactForm",   limit: 35
  end

  create_table "tblGenArtifactManuTech", id: false, force: true do |t|
    t.integer "GenArtifactManuTechID",            null: false
    t.string  "GenArtifactManuTech",   limit: 20
  end

  create_table "tblGenArtifactMaterial", id: false, force: true do |t|
    t.string  "ArtifactID",                limit: 36
    t.integer "GenArtifactMaterialTypeID"
    t.integer "GenArtifactMaterialID",                null: false
    t.integer "GenArtifactManuTechID"
    t.integer "GenerateContextArtifactID",            null: false
  end

  create_table "tblGenArtifactMaterialType", id: false, force: true do |t|
    t.integer "GenArtifactMaterialTypeID",            null: false
    t.string  "GenArtifactMaterialType",   limit: 30
  end

  create_table "tblGenArtifactNailEnd", id: false, force: true do |t|
    t.integer "NailEndTypeID",            null: false
    t.string  "NailEndType",   limit: 20
  end

  create_table "tblGenArtifactNailHead", id: false, force: true do |t|
    t.integer "NailHeadTypeID",            null: false
    t.string  "NailHeadType",   limit: 15
  end

  create_table "tblGenArtifactNailModification", id: false, force: true do |t|
    t.integer "NailModificationID",            null: false
    t.string  "NailModification",   limit: 15
  end

  create_table "tblGenerateContextArtifactID", id: false, force: true do |t|
    t.string  "ContextSampleID",           limit: 31
    t.string  "ArtifactID",                limit: 36, null: false
    t.integer "GenerateContextArtifactID",            null: false
  end

  create_table "tblGlass", id: false, force: true do |t|
    t.string   "ArtifactID",                limit: 36,                          null: false
    t.integer  "Quantity",                  limit: 2,                           null: false
    t.integer  "GlassMaterialID"
    t.integer  "GlassVesselCategoryID"
    t.integer  "GlassFormID"
    t.integer  "GlassCompletenessID"
    t.integer  "GlassManuTechID"
    t.integer  "MoldTypeID"
    t.integer  "PMM"
    t.integer  "PontilMarkID"
    t.decimal  "TotalContainerHeight",                 precision: 9,  scale: 4
    t.integer  "StemwareBodyShapeID"
    t.integer  "StemwareFootShapeID"
    t.integer  "StemShapeID"
    t.decimal  "StemLength",                           precision: 9,  scale: 4
    t.integer  "Burned"
    t.integer  "Patination"
    t.integer  "Solarized"
    t.integer  "SherdSize",                 limit: 2
    t.decimal  "SherdThickness",                       precision: 9,  scale: 4
    t.decimal  "LengthofRim",                          precision: 9,  scale: 4
    t.integer  "RimDiameter",               limit: 2
    t.integer  "MendedRimDiameter",         limit: 2
    t.integer  "Mended"
    t.string   "Conservation",              limit: 15
    t.integer  "EditorIDN",                                                     null: false
    t.datetime "DateAdded",                                                     null: false
    t.integer  "EditorID"
    t.datetime "DateChanged"
    t.text     "Notes"
    t.integer  "GlassTag",                  limit: 2,                           null: false
    t.decimal  "SherdWeight",                          precision: 9,  scale: 4
    t.decimal  "MendedSherdWeight",                    precision: 9,  scale: 4
    t.integer  "GenerateContextArtifactID",                                     null: false
    t.decimal  "BaseDiameter",                         precision: 18, scale: 4
    t.decimal  "BaseLength",                           precision: 18, scale: 4
    t.decimal  "MendedBaseDiameter",                   precision: 18, scale: 4
    t.integer  "GlassBasicColorID"
    t.integer  "DecorationYN"
  end

  create_table "tblGlassBottle", id: false, force: true do |t|
    t.integer "GlassBottleID",                        null: false
    t.string  "ArtifactID",                limit: 36
    t.integer "GlassBottleElementID"
    t.integer "GlassBottleShapeID"
    t.integer "GlassBottleManuTechID"
    t.integer "GenerateContextArtifactID",            null: false
  end

  create_table "tblGlassBottleElement", id: false, force: true do |t|
    t.integer "GlassBottleElementID",            null: false
    t.string  "GlassBottleElement",   limit: 50
  end

  add_index "tblGlassBottleElement", ["GlassBottleElementID"], name: "ElementID", using: :btree

  create_table "tblGlassBottleManuTech", id: false, force: true do |t|
    t.integer "GlassBottleManuTechID",            null: false
    t.string  "GlassBottleManuTech",   limit: 30
  end

  add_index "tblGlassBottleManuTech", ["GlassBottleManuTechID"], name: "FinishManufacturingTechniqueID", using: :btree

  create_table "tblGlassBottleShape", id: false, force: true do |t|
    t.integer "GlassBottleShapeID",            null: false
    t.string  "GlassBottleShape",   limit: 25
  end

  add_index "tblGlassBottleShape", ["GlassBottleShapeID"], name: "ShapeID", using: :btree

  create_table "tblGlassColor", id: false, force: true do |t|
    t.integer "GlassColorID",            null: false
    t.string  "GlassColor",   limit: 20
  end

  create_table "tblGlassCompleteness", id: false, force: true do |t|
    t.integer "GlassCompletenessID",            null: false
    t.string  "GlassCompleteness",   limit: 30
  end

  create_table "tblGlassDecTech", id: false, force: true do |t|
    t.string  "ArtifactID",                limit: 36
    t.integer "GlassDecTechTypeID",                   null: false
    t.integer "GlassDecTechStyElemID"
    t.integer "GlassDecTechID",                       null: false
    t.integer "GenerateContextArtifactID",            null: false
    t.integer "GlassDecTechBasicColorID"
  end

  create_table "tblGlassDecTechStyElement", id: false, force: true do |t|
    t.integer "GlassDecTechStyElemID",            null: false
    t.string  "GlassDecTechStyElem",   limit: 15
  end

  create_table "tblGlassDecTechType", id: false, force: true do |t|
    t.integer "GlassDecTypeTypeID",            null: false
    t.string  "GlassDecTechType",   limit: 30
  end

  create_table "tblGlassForm", id: false, force: true do |t|
    t.integer "GlassFormID",            null: false
    t.string  "GlassForm",   limit: 27
  end

  create_table "tblGlassManuTech", id: false, force: true do |t|
    t.integer "GlassManuTechID",            null: false
    t.string  "GlassManuTech",   limit: 25
  end

  create_table "tblGlassMark", id: false, force: true do |t|
    t.string  "ArtifactID",                limit: 36
    t.string  "Mark",                      limit: 50
    t.integer "GlassMarkLocationID"
    t.integer "GlassMarkID",                          null: false
    t.integer "GenerateContextArtifactID",            null: false
  end

  create_table "tblGlassMarkLocation", id: false, force: true do |t|
    t.integer "GlassMarkLocationID",            null: false
    t.string  "GlassMarkLocation",   limit: 25
  end

  create_table "tblGlassMaterial", id: false, force: true do |t|
    t.integer "GlassMaterialID",            null: false
    t.string  "GlassMaterial",   limit: 35
  end

  create_table "tblGlassMends", id: false, force: true do |t|
    t.integer "GlassMendID",                  null: false
    t.string  "ArtifactID",        limit: 36, null: false
    t.string  "MendsToArtifactID", limit: 36, null: false
  end

  create_table "tblGlassMoldType", id: false, force: true do |t|
    t.integer "MoldTypeID",            null: false
    t.string  "MoldType",   limit: 35
  end

  create_table "tblGlassPontilMark", id: false, force: true do |t|
    t.integer "PontilMarkID",            null: false
    t.string  "PontilMark",   limit: 35
  end

  create_table "tblGlassStemShape", id: false, force: true do |t|
    t.integer "StemShapeID",            null: false
    t.string  "StemShape",   limit: 25
  end

  create_table "tblGlassStemwareBodyShape", id: false, force: true do |t|
    t.integer "StemwareBodyShapeID",            null: false
    t.string  "StemwareBodyShape",   limit: 20
  end

  create_table "tblGlassStemwareFootShape", id: false, force: true do |t|
    t.integer "StemwareFootShapeID",            null: false
    t.string  "StemwareFootShape",   limit: 20
  end

  create_table "tblGlassVesselCategory", id: false, force: true do |t|
    t.integer "GlassVesselCategoryID",            null: false
    t.string  "GlassVesselCategory",   limit: 15
  end

  create_table "tblGlossaryCeramicDecTechStyElemImage", id: false, force: true do |t|
    t.integer "CeramicDecTechStyElemID", null: false
    t.integer "ImageID",                 null: false
  end

  create_table "tblGlossaryCeramicDecTechTypeImage", id: false, force: true do |t|
    t.integer "CeramicDecTechTypeID", null: false
    t.integer "ImageID",              null: false
  end

  create_table "tblGlossaryGlassDecTechStyElemImage", id: false, force: true do |t|
    t.integer "GlassDecTechStyElemID", null: false
    t.integer "ImageID",               null: false
  end

  create_table "tblGlossaryGlassDecTechTypeImage", id: false, force: true do |t|
    t.integer "GlassDecTechID", null: false
    t.integer "ImageID",        null: false
  end

  create_table "tblImage", id: false, force: true do |t|
    t.integer  "ImageID",                       null: false
    t.string   "ImageFileLocation", limit: 100, null: false
    t.integer  "ImageTypeID"
    t.integer  "ImageSubtypeID"
    t.integer  "ImageMaterialID"
    t.integer  "ImageFormID"
    t.string   "ImageDescription",  limit: 50
    t.integer  "InstitutionID"
    t.string   "CatalogueNumber",   limit: 50
    t.integer  "EditorIDN"
    t.datetime "DateAdded"
    t.string   "DocumentID",        limit: 11
    t.integer  "ImageFileFormatID"
    t.string   "Institution",       limit: 50
  end

  create_table "tblImageFileFormat", id: false, force: true do |t|
    t.integer "ImageFileFormatID",            null: false
    t.string  "ImageFileFormat",   limit: 50
  end

  create_table "tblImageForm", id: false, force: true do |t|
    t.integer "ImageFormID",             null: false
    t.string  "ImageForm",    limit: 50
    t.integer "ObjectTypeID"
  end

  create_table "tblImageMaterial", id: false, force: true do |t|
    t.integer "ImageMaterialID",            null: false
    t.string  "ImageMaterial",   limit: 50
    t.integer "ObjectType"
  end

  create_table "tblImageSubtype", id: false, force: true do |t|
    t.integer "ImageSubtypeID",            null: false
    t.string  "ImageSubtype",   limit: 10
  end

  create_table "tblImageType", id: false, force: true do |t|
    t.integer "ImageTypeID",            null: false
    t.string  "ImageType",   limit: 50
    t.string  "ImageTable"
  end

  create_table "tblLogin", id: false, force: true do |t|
    t.integer "LoginID",                                              null: false
    t.string  "UserName",        limit: 25,                           null: false
    t.string  "UserPassword",    limit: 250
    t.integer "EditorID",                                             null: false
    t.integer "BackgroundColor",                                      null: false
    t.integer "ForegroundColor",                                      null: false
    t.string  "Font",            limit: 50,                           null: false
    t.decimal "FontSize",                    precision: 18, scale: 0, null: false
    t.string  "FontStyle",       limit: 50
    t.integer "FontBold",        limit: 2,                            null: false
    t.integer "FontItalic",      limit: 2,                            null: false
    t.integer "FontColor",                                            null: false
    t.integer "UserLevel",                                            null: false
    t.integer "Active",                                               null: false
    t.integer "Institution",                                          null: false
  end

  create_table "tblMunsellAppliedColor", id: false, force: true do |t|
    t.integer "MunAppColorID",                             null: false
    t.string  "AppliedColorWrittenDescription", limit: 50
    t.string  "MunsellRangeAppliedColor",       limit: 50
    t.string  "BasicColor",                     limit: 25
    t.string  "ColorType",                      limit: 25
  end

  create_table "tblObject", id: false, force: true do |t|
    t.integer  "ObjectID",                                                      null: false
    t.text     "ObjectDescription"
    t.string   "InstitutionalObjectNumber", limit: 50
    t.text     "Notes"
    t.integer  "EditorIDN",                                                     null: false
    t.datetime "DateAdded",                                                     null: false
    t.string   "ObjectLocation",            limit: 50
    t.string   "InstitutionID",             limit: 50
    t.integer  "EditorID"
    t.datetime "DateChanged"
    t.integer  "ProjectNameID"
    t.string   "ConservationNotes",         limit: 150
    t.integer  "Conserved"
    t.integer  "ObjectTypeID"
    t.integer  "ObjectMaterialID"
    t.integer  "ObjectVesselCategoryID"
    t.integer  "ObjectWareTypeID"
    t.integer  "ObjectManuTechID"
    t.integer  "ObjectFormID"
    t.integer  "ObjectShapeID"
    t.integer  "ObjectCompletenessID"
    t.integer  "ObjectDecTechID"
    t.integer  "ObjectDecPatternID"
    t.text     "DecorationNotes"
    t.decimal  "ObjectRimDiameter",                     precision: 9, scale: 4
    t.decimal  "ObjectBaseDiameter",                    precision: 9, scale: 4
    t.decimal  "ObjectHeight",                          precision: 9, scale: 4
    t.decimal  "ObjectHeightRimToBase",                 precision: 9, scale: 4
    t.decimal  "ObjectWidth",                           precision: 9, scale: 4
    t.decimal  "ObjectLength",                          precision: 9, scale: 4
    t.decimal  "ObjectCapacity",                        precision: 9, scale: 4
    t.decimal  "ObjectWeight",                          precision: 9, scale: 4
    t.string   "ObjectDate",                limit: 25
    t.integer  "ManufactureCountryID"
    t.string   "ExcavatorPhase",            limit: 5
    t.string   "DAACSPhase",                limit: 5
    t.integer  "ObjectLengthComplete"
    t.integer  "ObjectWidthComplete"
    t.integer  "ObjectHeightComplete"
    t.decimal  "ExhibitLength",                         precision: 9, scale: 4
    t.decimal  "ExhibitWidth",                          precision: 9, scale: 4
    t.decimal  "ExhibitHeight",                         precision: 9, scale: 4
    t.integer  "ObjectBasicColorID"
    t.integer  "ObjectDecBasicColorID"
  end

  create_table "tblObjectArtifact", id: false, force: true do |t|
    t.integer "ObjectID"
    t.string  "ArtifactID",                limit: 36, null: false
    t.integer "GenerateContextArtifactID",            null: false
  end

  create_table "tblObjectColor", id: false, force: true do |t|
    t.integer "ObjectColorID",            null: false
    t.string  "ObjectColor",   limit: 50, null: false
  end

  create_table "tblObjectCompleteness", id: false, force: true do |t|
    t.integer "ObjectCompletenessID",            null: false
    t.string  "ObjectCompleteness",   limit: 50, null: false
    t.integer "ObjectTypeID"
  end

  create_table "tblObjectDecPattern", id: false, force: true do |t|
    t.integer "ObjectDecPatternID",            null: false
    t.string  "ObjectDecPattern",   limit: 50, null: false
    t.integer "ObjectTypeID"
  end

  create_table "tblObjectDecTech", id: false, force: true do |t|
    t.integer "ObjectDecTechID",            null: false
    t.string  "ObjectDecTech",   limit: 50, null: false
    t.integer "ObjectTypeID",               null: false
  end

  create_table "tblObjectForm", id: false, force: true do |t|
    t.integer "ObjectFormID",            null: false
    t.string  "ObjectForm",   limit: 50, null: false
    t.integer "ObjectTypeID"
  end

  create_table "tblObjectImage", id: false, force: true do |t|
    t.integer "ObjectID", null: false
    t.integer "ImageID",  null: false
  end

  create_table "tblObjectLocation", id: false, force: true do |t|
    t.integer "ObjectLocationID",              null: false
    t.integer "ObjectID",                      null: false
    t.string  "LoanedTo",           limit: 50, null: false
    t.string  "InstitutionContact", limit: 50
    t.string  "ExhibitName",        limit: 50
    t.string  "DateLoaned",         limit: 25
    t.string  "DateReturned",       limit: 25
    t.string  "ArtifactHandler",    limit: 50
    t.text    "Notes"
    t.string  "LoanLength",         limit: 20
  end

  create_table "tblObjectManuTech", id: false, force: true do |t|
    t.integer "ObjectManuTechID",            null: false
    t.string  "ObjectManuTech",   limit: 50, null: false
    t.integer "ObjectTypeID"
  end

  create_table "tblObjectManufactureCountry", id: false, force: true do |t|
    t.integer "ObjectManufactureCountryID",            null: false
    t.string  "ObjectManufactureCountry",   limit: 50, null: false
  end

  create_table "tblObjectMaterial", id: false, force: true do |t|
    t.integer "ObjectMaterialID",            null: false
    t.string  "ObjectMaterial",   limit: 50, null: false
    t.integer "ObjectTypeID"
  end

  create_table "tblObjectShape", id: false, force: true do |t|
    t.integer "ObjectShapeID",            null: false
    t.string  "ObjectShape",   limit: 50, null: false
    t.integer "ObjectTypeID"
  end

  create_table "tblObjectType", id: false, force: true do |t|
    t.integer "ObjectTypeID",            null: false
    t.string  "ObjectType",   limit: 30, null: false
  end

  create_table "tblObjectVesselCategory", id: false, force: true do |t|
    t.integer "ObjectVesselCategoryID",            null: false
    t.string  "ObjectVesselCategory",   limit: 50, null: false
    t.integer "ObjectTypeID"
  end

  create_table "tblPasteInclusion", id: false, force: true do |t|
    t.integer "PasteInclusionID",            null: false
    t.string  "PasteInclusion",   limit: 30
  end

  create_table "tblPlantation", id: false, force: true do |t|
    t.integer "PlantationID",              null: false
    t.string  "PlantationName", limit: 35, null: false
  end

  create_table "tblProject", id: false, force: true do |t|
    t.string   "ProjectID",                         limit: 4,                           null: false
    t.string   "InstitutionID",                     limit: 50,                          null: false
    t.integer  "ProjectNameID",                                                         null: false
    t.integer  "RegionID",                                                              null: false
    t.integer  "CountyID",                                                              null: false
    t.string   "State",                             limit: 2,                           null: false
    t.integer  "PlaceNameID"
    t.string   "PrincipalInvestigators",            limit: 50
    t.string   "BeginDate",                         limit: 25
    t.string   "EndDate",                           limit: 25
    t.string   "OccupationRange",                   limit: 50
    t.string   "StateSiteNumber",                   limit: 15
    t.integer  "UnitofMeasureID"
    t.integer  "GeoDatumID"
    t.integer  "GeoCoordinateSystemID"
    t.decimal  "NorthingGeoCoordinateofLocalDatum",            precision: 18, scale: 4
    t.decimal  "EastingGeoCoordinateofLocalDatum",             precision: 18, scale: 4
    t.decimal  "VerticalGeoCoordinateofLocalDatum",            precision: 18, scale: 4
    t.integer  "DrainageID"
    t.string   "SiteSoils",                         limit: 50
    t.string   "NearestWaterSource",                limit: 50
    t.string   "DistancefromWaterSource",           limit: 50
    t.integer  "ElevationTypeID"
    t.decimal  "AzimuthOrientation",                           precision: 18, scale: 4
    t.decimal  "TotalAreaExcavated",                           precision: 18, scale: 4
    t.decimal  "TotalConvexHull",                              precision: 18, scale: 4
    t.string   "DatesExcavated",                    limit: 20
    t.text     "ProjectNotes"
    t.text     "SiteAbstract"
    t.integer  "LevelofTreatmentID",                                                    null: false
    t.integer  "EditorIDN",                                                             null: false
    t.datetime "DateAdded",                                                             null: false
    t.integer  "EditorID"
    t.datetime "DateChanged"
    t.integer  "ProjectTag",                        limit: 2,                           null: false
    t.integer  "PlantationID"
    t.integer  "ProjectCountryID"
    t.integer  "ArtifactRepositoryID"
    t.integer  "WebsiteRegionID"
  end

  create_table "tblProjectCountry", id: false, force: true do |t|
    t.integer "ProjectCountryID",            null: false
    t.string  "ProjectCountry",   limit: 25
  end

  create_table "tblProjectCounty", id: false, force: true do |t|
    t.integer "CountyID",            null: false
    t.string  "County",   limit: 30
  end

  create_table "tblProjectDrainage", id: false, force: true do |t|
    t.integer "DrainageID",            null: false
    t.string  "Drainage",   limit: 25
  end

  create_table "tblProjectElevationType", id: false, force: true do |t|
    t.integer "ElevationTypeID",            null: false
    t.string  "ElevationType",   limit: 20
  end

  create_table "tblProjectGeoCoordinateSystem", id: false, force: true do |t|
    t.integer "GeoCoordinateSystemID",            null: false
    t.string  "GeoCoordinateSystem",   limit: 25
  end

  create_table "tblProjectGeoDatum", id: false, force: true do |t|
    t.integer "GeoDatumID",            null: false
    t.string  "GeoDatum",   limit: 15
  end

  create_table "tblProjectInstitution", id: false, force: true do |t|
    t.string "InstitutionID", limit: 50, null: false
    t.string "Institution",   limit: 50
  end

  create_table "tblProjectLevelofTreatment", id: false, force: true do |t|
    t.integer "LevelofTreatmentID",            null: false
    t.string  "LevelofTreatment",   limit: 20
  end

  create_table "tblProjectName", id: false, force: true do |t|
    t.integer "ProjectNameID",             null: false
    t.string  "ProjectName",   limit: 100
  end

  create_table "tblProjectPlaceName", id: false, force: true do |t|
    t.integer "PlaceNameID",            null: false
    t.string  "PlaceName",   limit: 25
  end

  create_table "tblProjectRegion", id: false, force: true do |t|
    t.integer "RegionID",            null: false
    t.string  "Region",   limit: 15
  end

  create_table "tblProjectSiteImage", id: false, force: true do |t|
    t.string  "ProjectID", limit: 4, null: false
    t.integer "ImageID",             null: false
  end

  create_table "tblProjectUnitofMeasure", id: false, force: true do |t|
    t.integer "UnitofMeasureID",              null: false
    t.string  "UnitofMeasurement", limit: 10
  end

  create_table "tblProjectWebsiteRegion", id: false, force: true do |t|
    t.integer "WebsiteRegionID",            null: false
    t.string  "WebsiteRegion",   limit: 15
  end

  create_table "tblSedimentColor", id: false, force: true do |t|
    t.integer "MunSedColorID",                   null: false
    t.string  "MunsellSedimentColor", limit: 15
    t.string  "MunsellDescription",   limit: 50
  end

  create_table "tblTobaccoPipe", id: false, force: true do |t|
    t.string   "ArtifactID",                limit: 36,                          null: false
    t.integer  "Quantity",                                                      null: false
    t.integer  "TobaccoPipeCompletenessID"
    t.integer  "TobaccoPipeMaterialID"
    t.integer  "MunSedColorID"
    t.integer  "PasteInclusionID"
    t.integer  "TobaccoPipeManuTechID"
    t.integer  "GlazeTypeID"
    t.integer  "GlazeMunAppColorID"
    t.integer  "PMM"
    t.integer  "BowlFormID"
    t.integer  "BowlBaseTypeID"
    t.integer  "MouthpieceFormID"
    t.decimal  "StemLength",                            precision: 9, scale: 4
    t.decimal  "ExteriorStemDiameter",                  precision: 9, scale: 4
    t.decimal  "MetricBoreDiameter",                    precision: 9, scale: 4
    t.integer  "BoreDiameter64ths",         limit: 2
    t.decimal  "BowlHeight",                            precision: 9, scale: 4
    t.decimal  "BowlVolume",                            precision: 9, scale: 4
    t.decimal  "MaximumBowlDiameter",                   precision: 9, scale: 4
    t.decimal  "BowlRimDiameter",                       precision: 9, scale: 4
    t.decimal  "Weight",                                precision: 9, scale: 4
    t.integer  "Mended"
    t.string   "Conservation",              limit: 50
    t.text     "Notes"
    t.integer  "EditorIDN",                                                     null: false
    t.datetime "DateAdded",                                                     null: false
    t.integer  "EditorID"
    t.datetime "DateChanged"
    t.integer  "TobaccoPipeTag",            limit: 2,                           null: false
    t.integer  "GenerateContextArtifactID",                                     null: false
    t.string   "PipeMaker",                 limit: 50
    t.string   "ProductionDates",           limit: 20
    t.string   "ManufactureLocation",       limit: 10
    t.string   "CompleteMarkDescription",   limit: 250
    t.integer  "MaximumSherdMeasurement",   limit: 2
    t.integer  "DecorationYN"
    t.integer  "TextMarkYN"
    t.integer  "PasteMunAppColorID"
  end

  create_table "tblTobaccoPipeBowlBaseType", id: false, force: true do |t|
    t.integer "BowlBaseTypeID",            null: false
    t.string  "BowlBaseType",   limit: 15
  end

  create_table "tblTobaccoPipeBowlForm", id: false, force: true do |t|
    t.integer "BowlFormID",            null: false
    t.string  "BowlForm",   limit: 15
  end

  create_table "tblTobaccoPipeCompleteness", id: false, force: true do |t|
    t.integer "TobaccoPipeCompletenessID",            null: false
    t.string  "TobaccoPipeCompleteness",   limit: 40
  end

  create_table "tblTobaccoPipeDecMotif", id: false, force: true do |t|
    t.integer "TobaccoPipeDecMotifID",            null: false
    t.string  "TobaccoPipeDecMotif",   limit: 45
  end

  create_table "tblTobaccoPipeDecoration", id: false, force: true do |t|
    t.string  "ArtifactID",                 limit: 36, null: false
    t.integer "TobaccoPipeDecMotifID",                 null: false
    t.integer "MotifTextLocationID"
    t.integer "TobaccoPipeMotifManuTechID"
    t.text    "Notes"
    t.integer "TobaccoPipeDecID",                      null: false
    t.integer "GenerateContextArtifactID",             null: false
  end

  create_table "tblTobaccoPipeGlazeType", id: false, force: true do |t|
    t.integer "GlazeTypeID",            null: false
    t.string  "GlazeType",   limit: 15
  end

  create_table "tblTobaccoPipeManuTech", id: false, force: true do |t|
    t.integer "TobaccoPipeManuTechID",            null: false
    t.string  "TobaccoPipeManuTech",   limit: 15
  end

  create_table "tblTobaccoPipeMaterial", id: false, force: true do |t|
    t.integer "TobaccoPipeMaterialID",            null: false
    t.string  "TobaccoPipeMaterial",   limit: 25
  end

  create_table "tblTobaccoPipeMotifManuTech", id: false, force: true do |t|
    t.integer "MotifManuTechID",            null: false
    t.string  "MotifManuTech",   limit: 15
  end

  create_table "tblTobaccoPipeMotifTextLocation", id: false, force: true do |t|
    t.integer "MotifTextLocationID",           null: false
    t.string  "MotifTextLocation",   limit: 2
  end

  create_table "tblTobaccoPipeMouthpieceForm", id: false, force: true do |t|
    t.integer "MouthpieceFormID",            null: false
    t.string  "MouthpieceForm",   limit: 15
  end

  create_table "tblTobaccoPipeTextFrameMotif", id: false, force: true do |t|
    t.integer "PipeTextFrameMotifID",            null: false
    t.string  "PipeTextFrameMotif",   limit: 40
  end

  create_table "tblTobaccoPipeTextMark", id: false, force: true do |t|
    t.integer "TobaccoPipeTextMarkID",                null: false
    t.string  "ArtifactID",                limit: 36
    t.integer "TextMarkTypeID"
    t.integer "MotifTextLocationID"
    t.integer "PipeTextFrameMotifID"
    t.string  "FirstName",                 limit: 15
    t.string  "LastName",                  limit: 15
    t.string  "PlaceName",                 limit: 15
    t.string  "SloganOther",               limit: 15
    t.text    "MarkNotes"
    t.integer "GenerateContextArtifactID",            null: false
  end

  create_table "tblTobaccoPipeTextMarkType", id: false, force: true do |t|
    t.integer "TextMarkTypeID",            null: false
    t.string  "TextMarkType",   limit: 20
  end

  create_table "tblUtensil", id: false, force: true do |t|
    t.string   "ArtifactID",                limit: 36,                         null: false
    t.integer  "Quantity",                  limit: 2,                          null: false
    t.integer  "CompletenessID"
    t.integer  "UtensilFormID"
    t.integer  "UtensilPlatingID"
    t.integer  "HandleDecorationID"
    t.integer  "PMM"
    t.integer  "ForkTineCountID"
    t.integer  "SpoonRatTail"
    t.decimal  "ArtifactLength",                       precision: 9, scale: 4
    t.decimal  "ArtifactWidth",                        precision: 9, scale: 4
    t.decimal  "ArtifactWeight",                       precision: 9, scale: 4
    t.integer  "Burned"
    t.string   "Marks",                     limit: 50
    t.string   "Conservation",              limit: 15
    t.integer  "Mended"
    t.integer  "EditorIDN",                                                    null: false
    t.datetime "DateAdded",                                                    null: false
    t.integer  "EditorID"
    t.datetime "DateChanged"
    t.text     "Notes"
    t.integer  "UtensilTag",                limit: 2,                          null: false
    t.integer  "GenerateContextArtifactID",                                    null: false
    t.integer  "DecorationYN"
  end

  create_table "tblUtensilForkTineCount", id: false, force: true do |t|
    t.integer "ForkTineCountID",            null: false
    t.string  "ForkTineCount",   limit: 15
  end

  create_table "tblUtensilForm", id: false, force: true do |t|
    t.integer "UtensilFormID",            null: false
    t.string  "UtensilForm",   limit: 15
  end

  create_table "tblUtensilHandleDecoration", id: false, force: true do |t|
    t.integer "HandleDecorationID",            null: false
    t.string  "HandleDecoration",   limit: 15
  end

  create_table "tblUtensilManuTech", id: false, force: true do |t|
    t.integer "UtensilManuTechID",            null: false
    t.string  "UtensilManuTech",   limit: 15
  end

  create_table "tblUtensilMaterial", id: false, force: true do |t|
    t.integer "UtensilMaterialID",            null: false
    t.string  "UtensilMaterial",   limit: 15
  end

  create_table "tblUtensilPart", id: false, force: true do |t|
    t.integer "UtensilPartID",            null: false
    t.string  "UtensilPart",   limit: 20
  end

  create_table "tblUtensilPlating", id: false, force: true do |t|
    t.integer "UtensilPlatingID",            null: false
    t.string  "UtensilPlating",   limit: 15
  end

  create_table "tblUtensilShape", id: false, force: true do |t|
    t.integer "UtensilShapeID",            null: false
    t.string  "UtensilShape",   limit: 15
  end

  create_table "tblUtensilSpecific", id: false, force: true do |t|
    t.integer "UtensilSpecificID",                                            null: false
    t.string  "ArtifactID",                limit: 36
    t.integer "UtensilPartID"
    t.integer "UtensilShapeID"
    t.integer "UtensilManuTechID"
    t.integer "UtensilMaterialID"
    t.decimal "PartLength",                           precision: 9, scale: 4
    t.decimal "PartWidth",                            precision: 9, scale: 4
    t.decimal "PartHeight",                           precision: 9, scale: 4
    t.integer "GenerateContextArtifactID",                                    null: false
  end

  create_table "tblYesNo", id: false, force: true do |t|
    t.integer "YesNoID",           null: false
    t.string  "YesNo",   limit: 3
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "userid"
    t.string   "organization_id",        limit: nil
    t.integer  "editor_id"
    t.integer  "user_level"
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
