#!thrift -java -php -phps

/**
 * This file contains all the service and data object definitions which will be used to generate thrift classes.
*/

namespace java com.capillary.shopbook.pointsengine.endpoint.api.external
namespace php pointsengine_rules

exception PointsEngineRuleServiceException {
    1: required string errorMessage;
    2: optional i32 statusCode;
}

enum SortingOrder {
  ASC,
  DESC
}

enum SortCriterion {
  LAST_UPDATED_ON
}

struct PageRequest {
  1: required i32 pageNum;
  2: required i32 pageSize;
  3: optional SortCriterion sortBy;
  4: optional SortingOrder sortOrder;
}

enum VersionStatus{
    DRAFT,
    LIVE,
    SNAPSHOT
}

struct AttributionInfo {
    1: required i64 createdOn,
    2: required i64 createdBy,
    3: required i64 updatedOn,
    4: required i64 updatedBy,
    5: optional i64 publishedOn,
    6: optional i64 publishedBy
}

struct PromotionMetadata {
    1: required string key;
    2: required string value;
    3: optional bool isBrandDefined;
}

struct StrategyInfo {
    1: required i32 id;
    2: required i32 programId;
    3: required string name;
    4: required string description;
    5: required i32 strategyTypeId;
    6: required string propertyValues;
    7: required string owner;
    8: optional bool updatedViaNewUI;
 }
 enum RestrictionType {
	NON_PERIOD_BASED, PERIOD_BASED
}
enum IssualExpiryType {
	PROMOTION, CUSTOM
}
enum RedemptionRestrictionType {
	MAX_ALLOWED_POINTS_PER_EVENT,
	MAX_ALLOWED_TIMES_PER_CUSTOMER,
	MAX_ALLOWED_POINTS_PER_CUSTOMER,
	MAX_ALLOWED_TIMES_PER_PROMOTION,
	MAX_ALLOWED_POINTS_PER_PROMOTION,
	MAX_REDEMPTIONS_PER_EARN_PER_CUSTOMER
}
enum DetailedRestrictionType {
	MAX_NUMBER_OF_ISSUALS_PER_CUSTOMER,
	MAX_NUMBER_OF_EARNS_PER_CUSTOMER, MAX_POINTS_PER_EARN_PER_CUSTOMER,
	MAX_NUMBER_OF_EARN_PER_PROMOTION
}
enum ExpiryRestrictionType {
	ISSUAL_PROMOTION_EXPIRY_BASED_ON, EARN_PROMOTION_EXPIRY_BASED_ON
}
enum RedemptionRestrictionPeriodType {
	MOVING_WINDOW
}
enum RedemptionRestrictionPeriodUnit {
DAILY,WEEKLY,MONTHLY
}
struct RedemptionRestrictions {
	1:required RedemptionRestrictionType name;
	2:optional i32 value;
	3:optional RestrictionType type;
	4:optional RedemptionRestrictionPeriodType periodType;
	5:optional RedemptionRestrictionPeriodUnit periodUnit;
}

struct DetailedRestrictions {
	1:required DetailedRestrictionType name;
	2:optional i32 value;
}

struct ExpiryRestrictions {
	1:required ExpiryRestrictionType name;
	2:optional i32 value;
	3:optional IssualExpiryType type;
}


struct Restrictions {
	1:optional list<RedemptionRestrictions> redemptionRestrictions;
	2:optional list<DetailedRestrictions> issualRestrictions;
	3:optional list<DetailedRestrictions> earnRestrictions;
	4:optional list<ExpiryRestrictions> expiryRestrictions;
}

enum ScopeType {
	SUPPLEMENTARY_PROGRAM,
	TIER,
	PROGRAM
}

enum LoyaltyEarningType {
        ISSUE_AND_EARN ,
        DIRECT_EARN
}

struct RedemptionScope{
	1:optional ScopeType type;
	2:optional list<i32> ids;
}

struct ExpiryReminderConfiguration{
	1:optional list<i32> remindBeforeDays;
	2:optional string smsTemplate;
	3:optional string smsDomain;
	4:optional string smsSenderId;
	5:optional string smsCdmaSenderId;
	6:optional string mailSubject;
	7:optional string mailBody;
	8:optional string emailDomain;
	9:optional string emailSenderId;
	10:optional string emailSenderLabel;
	11:optional string weChatId;
	12:optional list<string> wechatTemplate;
	13:optional string weChatBrandId;
	14:optional string weChatOriginalId;
	15:optional string mobilepush_acc_id;
	16:optional string mobilepush_template_id;
	17:optional string androidMobilePushTitle;
	18:optional string iosMobilePushTitle;
	19:optional string androidMobilePushMessageBlob;
	20:optional string iosMobilePushMessageBlob;

}

struct LoyaltyConfigMetaData {
	1:optional Restrictions restrictions;
	2:optional list<RedemptionScope> scope;
    3:optional bool isStackable;
	4:optional bool isConsideredForRanking;
	5:optional LoyaltyEarningType loyaltyEarningType;
	6:optional ExpiryReminderConfiguration expiryReminder;
    7:optional bool isExclusive;
    8:optional bool isAlwaysApply;
    9:optional list<i64> targetGroupIds;
    10:optional list<i64> targetRuleIds;
    11:optional map<string, list<i64>> linkedTargetGroupVsTargetRuleIdMap;
    12:optional string cappingStatus;
    13:optional bool skipEarnedDateCheckOnRedeem;
}

enum PointsOfferType {
	GENERIC,
	LOYALTY,
	LOYALTY_EARNING
}
/* If any changes in PromotionInfo, please keep campaigns team in loop */
struct PromotionInfo {
    1: required i32 id;
    2: required i32 programId;
    3: required string name;
    4: required string description;
    5: required string eventName;
    6: required bool isActive;
    7: required bool isExclusive;
    8: required string type;
    9: required string promotionEvaluationType;
    10: required i64 startDate;
    11: required i64 endDate;
    12: required string startRuleIdentifier;
    13: optional i32 sourceId;
    14: optional string promotionSourceType;
    15: optional i32 eventsPerMemberLimit;
    16: optional i32 pointsPerMemberLimit;
    17: optional i32 pointsPerPromotionLimit;
    18: optional i32 pointsPerEventLimit;
    19: optional bool useProportions;
    20: optional bool updatedViaNewUI;
    21: optional string promoIdentifer;
    22: optional list<PromotionMetadata> promotionMetadata;
	23: optional LoyaltyConfigMetaData loyaltyConfigMetaData;
	24: optional PointsOfferType promotionType;
}

struct FilterInfoV2 {
    1: required i32 id;
    2: required i32 orgID;
    3: required i32 ruleID;
    4: required string name;
    5: required string className;
    6: required bool isInclude;
    7: required map <string, list<string>> propertyToValues;
}

struct CappingInfoV2 {
    1: required i32 id;
    2: required i32 orgId;
    3: required string name;
    4: required string className;
    5: required string propertyValuesJson;
}

enum RulesetTypeV2 {
    BASE
    PROMOTION
    FORWARD
    GLOBAL_PROMOTION
}

struct DataTypeV2 {
    1: required string typeName;
    //A comma separated list of allowed values in the enum
    2: optional map <string, string> allowedValues;
    3: optional bool isMultiSelect;
}

struct ActionInfoV2 {
    1: required i32 id;
    2: required string actionName;
    3: required string actionClass;
    4: required map <string, string> mandatoryPropertiesValues;
    5: required map <string, map <string, string>> mandatoryComplexPropertiesValues;
    6: optional string description;
    7: optional list<StrategyInfo> embeddedStrategies;
}

struct RuleInfoV2 {
    1: required i32 id;
    2: required string exp;
    3: required string expJSON;
    4: required string jsonType;
    5: required bool isActive;
    6: required i32 priority;
    7: required i64 startDate;
    8: required i64 endDate;
    9: required i64 createdOn;
    10: required map <string,list<ActionInfoV2>> caseToActions;
    11: required string ruleScope;
    12: required i32 createdBy;
    13: required i32 modifiedBy;
    14: optional i64 modifiedOn;
    15: optional string name = "";
    16: optional string description = "";
    17: optional DataTypeV2 expDataType;
    18: optional list <FilterInfoV2> filterInfo;
    19: optional i32 ruleSetId;
    20: optional bool updatedViaNewUI;
    21: optional string eventName = "";
}

struct RulesetInfoV2 {
    1: required i32 id;
    2: required string orgName;
    4: required i32 contextID;
    3: required i32 orgID;
    5: required string contextType;
    6: required list<RuleInfoV2> rules;
    7: required string ruleScope;
    8: required i64 startDate;
    9: required i64 endDate;
    10: required i64 createdOn
    11: required i32 createdBy;
    12: required i32 modifiedBy;
    13: optional i64 modifiedOn;
    14: optional string name = "";
    15: optional string packageName = "";
    16: optional string description = "";
    17: optional bool isPrivate = false;
    18: optional list<FilterInfoV2> filterInfo;
    19: optional string eventType;
    20: optional list<CappingInfoV2> cappingInfo;
    21: optional bool updatedViaNewUI;
    22: optional RulesetTypeV2 rulesetType;
    23: optional string label;
    24: optional bool isRulesetForGlobalPromotion;
    25: optional list<i32> programIds;
    26: optional string eventName = "";
}


struct PromotionAndRulesetInfo {
    1: required i32 id;
    2: required i32 programId;
    3: required string name;
    4: required string description;
    5: required string eventName;
    6: required bool isActive;
    7: required bool isExclusive;
    8: required string type;
    9: required string promotionEvaluationType;
    10: required i64 startDate;
    11: required i64 endDate;
    12: required string startRuleIdentifier;
    13: optional i32 sourceId;
    14: optional string promotionSourceType;
    15: optional i32 eventsPerMemberLimit;
    16: optional i32 pointsPerMemberLimit;
    17: optional i32 pointsPerPromotionLimit;
    18: optional i32 pointsPerEventLimit;
    19: optional bool useProportions;
    20: optional bool updatedViaNewUI;
    21: optional string promoIdentifer;
    22: optional list<PromotionMetadata> promotionMetadata;
    23: optional LoyaltyConfigMetaData loyaltyConfigMetaData;
    24: optional PointsOfferType promotionType;
    25: optional list<RulesetInfoV2> rulesetInfo;
}


struct SlabInfo {

    1: required i32 id;
    2: required i32 programId;
    3: required i32 serialNumber;
    4: required string name;
    5: required string description;
    6: optional string colorCode;
    7: optional bool updatedViaNewUI;
}

struct BoolRes {
    1: optional bool success;
    2: optional PointsEngineRuleServiceException ex;
}

struct PartnerProgramTier{
        1: required i32 tierNumber;
        2: required string tierName;
}

enum PartnerProgramCycleType {
DAYS
MONTHS
}

struct PartnerProgramMembershipCycle{
	1: required PartnerProgramCycleType cycleType;
        2: required i32 cycleValue;
}

enum PartnerProgramType {
EXTERNAL
SUPPLEMENTARY
}

struct PartnerProgramInfo{
        1: required i32 partnerProgramId;
        2: required string partnerProgramName;
        3: required string description;
        4: required bool isTierBased;
        5: optional list<PartnerProgramTier> partnerProgramTiers;
        6: required double programToPartnerProgramPointsRatio;
	7: optional string partnerProgramUniqueIdentifier;
	8: required PartnerProgramType partnerProgramType;
	9: optional PartnerProgramMembershipCycle partnerProgramMembershipCycle;
        10: required bool isSyncWithLoyaltyTierOnDowngrade;
        11: optional map <string, string> loyaltySyncTiers;
	12: optional bool updatedViaNewUI;
	13: optional i64 expiryDate;
	14: optional i32 backupProgramId;
}

struct ExpiryReminderForPartnerProgramInfo{
        1: required i32 partnerProgramId;
        2: required string partnerProgramName;
        3: required i32 daysBeforeExpiryReminder;
        4: optional string communicationPropertyValues;
        5: optional i32 autoIncId;
}

struct OrgEntityInfo{
  1: required i32 entityId;
  2: required string entityName;
  3: optional map<string, string> properties;
}

enum MappedEntityType{
  CONCEPTS
  ZONES
  CARD_SERIES
}

struct OrgEnitiesConfigData{
  1: required i32 programId;
  2: required MappedEntityType mappedEntityType;
  3: required list<OrgEntityInfo> orgEntityInfos;
}

struct ProgramInfo {

    1: required i32 id;
    2: required string name;
    3: required string description;
    4: required bool isActive;
    5: required i64 lastActivated;
    6: required i32 slabUpgradePointCategoryId;
    7: required i32 slabUpgradeStategyId;
    8: required string slabUpgradeMode;
    9: required string slabUpgradeRuleIdentifier;
    10: required i32 redeemablePointCategoryId;
    11: required double pointsCurrencyRatio;
    12: required i32 roundDecimals;
    13: optional string reminderBeforeDaysCsv;
    14: optional i32 reminderMinExpirypoints;
    15: optional string reminderSmsTemplate;
    16: optional string reminderMailSubject;
    17: optional string reminderMailBody;
    18: required bool isDefault;
    19: optional list<PartnerProgramInfo> partnerProgramInfo;
    20: optional bool updatedViaNewUI;
    21: optional string contactInfo;
    22: optional list<OrgEnitiesConfigData> mappedOrgEntities;
    23: optional i64 lastReconfiguredTime;
    24: optional i64 lastReconfguredByUserId;
}

struct TenderCombinationAttribute {
    1: required i32 id;
    2: required i32 orgId;
    3: required i32 tenderCombinationId;
    4: required i32 tenderAttributeId;
    5: required i32 tenderAttributeValueId;
}

struct TenderCombination {
    1: required i32 id;
    2: required i32 orgId;
    3: required i32 programId;
    4: required i32 tenderId;
    5: required string label;
    6: required i32 priority;
    7: required i32 modifiedBy;
    8: required bool earning;
    9: optional i64 modifiedOn;
    10: optional string description = "";
    11: optional bool isValid = false;
    12: optional list <TenderCombinationAttribute> attributeInfo;
    13: optional bool updatedViaNewUI;
}

struct CardSeriesInfo {
  1: required i32 id;
  2: required i32 orgId;
  3: required string name;
  4: required string code;
  5: required i32 programId;
  6: required string programName;
}

struct CardSeriesList {
	1: required list<i32> cardSeriesIds;
	2: required i32 orgId;
}

struct CardSeriesProgramMappingInfo {
  1: required i32 seriesId;
  2: required i32 orgId;
  3: required i32 programId;
  4: optional string name;
}

struct TrackerConditionExpression{
    1: required string aggrFunc;
    2: required bool uniqueValue;
    3: required string operator;
    4: required i32 threasholdValue1;
    5: optional i32 threasholdValue2 = 0;
    6: optional i32 minimumThreasholdValue = 0;
}

enum TrackingPeriodType {
DAYS
MONTHS
}

struct TrackerCondition{
    1: required i32 id;
    2: required i32 orgId;
    3: required i32 programId;
    4: required i32 strategyId;
    5: required string name;
    6: required i32 rank;
    7: required i32 period;
    8: required i64 maxTimesSuccessSignals;
    9: required TrackerConditionExpression expression;
    10: required i32 modifiedBy;
    11: required i64 modifiedOn;
    12: required i32 rulesetId;
    13: required i32 pointsCategoryId;
    14: optional bool isActive = false;
    15: optional TrackingPeriodType trackingPeriodType;
    16: optional bool updatedViaNewUI;
}

enum PointsCategoryType{
  REGULAR_POINTS,
  TRACKERS,
  PROMISED_POINTS,
  EXTERNAL_TRIGGER_BASED_POINTS
}

struct PointsCategory{
    1: required i32 id;
    2: required i32 orgId;
    3: required i32 programId;
    4: required string name;
    5: required string description;
    6: required i32 modifiedBy;
    7: required i64 modifiedOn;
    8: required PointsCategoryType pointsCategoryType;
}

struct ProgramFilter{
	1: required i32 orgId;
	2: required i32 tillId;
}

struct OrgProgramFilter{
        1: required i32 orgId;
        2: optional list<i32> programIds;
}

enum RankingStrategy{
	MAX_POINTS,
	EARLY_EXPIRY,
	MANUAL_WEIGHTAGE
}

struct StackingConfigs{
	1:optional bool stackingAtBillLevel;
	2:optional bool stackingAtLineItemLevel;
}

struct PromotionRankingStackingStrategy{
	1:optional bool isRankingEnabled;
	2:optional list<RankingStrategy> rankingOrder;
	3:optional bool isStackingEnabled;
	4:optional StackingConfigs stackingConfigs;
}

struct ProgramSettings{
	1: required i32 programId;
	2: required bool isTierSyncEnabled;
	3: required bool isPointsContributionEnabled;
	4: required bool isPointsContributionForTransactionEventsEnabled;
	5: required bool isPointsContributionForGenericEventsEnabled;
	6: required bool isPointsContributionForRegistrationEventEnabled;
	7: required bool isPointsContributionForCustomerUpdateEventEnabled;
	8: required bool isPointsContributionForTargetCompletedEventEnabled;
	9: required bool isPointsContributionForPointsTransferEventEnabled;
	10: required bool isPointsContributionForCustomerMergeEventEnabled;
	11: required bool isPointsContributionForDelayedAccrualEventEnabled;
	12: required bool isPointsContributionForGoodwillPointsAllocationEventEnabled;
	13: required bool isPointsContributionForGroupJoinEventEnabled;
	14: optional bool isOneCustomerOneSppSchemeEnabled;
	15: optional bool isAutoDelinkCustomerEnabled;
	16: optional bool updatedViaNewUI;

	17: optional i64 indToIndMaxPointsInTransactionLimit;
    18: optional i64 indToIndDailyPointTransferLimit;
    19: optional i64 indToIndWeeklyPointTransferLimit;
    20: optional i64 indToIndMonthlyPointTransferLimit;
    21: optional i64 indToIndDailyPointsTransferFrequencyLimit;
    22: optional i64 indToIndWeeklyPointTransferFrequencyLimit;
    23: optional i64 indToIndMonthlyPointTransferFrequencyLimit;

    24: optional i64 indToGrpMaxPointsInTransactionLimit;
    25: optional i64 indToGrpDailyPointTransferLimit;
    26: optional i64 indToGrpWeeklyPointTransferLimit;
    27: optional i64 indToGrpMonthlyPointTransferLimit;
    28: optional i64 indToGrpDailyPointsTransferFrequencyLimit;
    29: optional i64 indToGrpWeeklyPointTransferFrequencyLimit;
    30: optional i64 indToGrpMonthlyPointTransferFrequencyLimit;

    31: optional i64 grpToGrpMaxPointsInTransactionLimit;
    32: optional i64 grpToGrpDailyPointTransferLimit;
    33: optional i64 grpToGrpWeeklyPointTransferLimit;
    34: optional i64 grpToGrpMonthlyPointTransferLimit;
    35: optional i64 grpToGrpDailyPointsTransferFrequencyLimit;
    36: optional i64 grpToGrpWeeklyPointTransferFrequencyLimit;
    37: optional i64 grpToGrpMonthlyPointTransferFrequencyLimit;

    38: optional i64 grpToIndMaxPointsInTransactionLimit;
    39: optional i64 grpToIndDailyPointTransferLimit;
    40: optional i64 grpToIndWeeklyPointTransferLimit;
    41: optional i64 grpToIndMonthlyPointTransferLimit;
    42: optional i64 grpToIndDailyPointsTransferFrequencyLimit;
    43: optional i64 grpToIndWeeklyPointTransferFrequencyLimit;
    44: optional i64 grpToIndMonthlyPointTransferFrequencyLimit;
	45: optional bool isPromisedPointsBasedOnEventDate;
	46: optional PromotionRankingStackingStrategy promotionRankingStackingStrategy;
	47: optional bool isRollingExpiryIncludeZeroPoints;
}

struct PromotionsFilter{
	1:required i32 orgId;
	2:required i32 programId;
	3:optional string sourceType;
	4:optional i64 startDate;
	5:optional bool includeExpired; // default set to false, so returns only active ones if nothing is set
	6:optional i64 endDate;
}

struct PromotionsAndRulesetInfoFilter{
    1:required i32 orgId;
    2:required i32 programId;
    3:optional string sourceType;
    4:optional i64 startDate;
    5:optional bool includeExpired; // default set to false, so returns only active ones if nothing is set
    6:optional i64 endDate;
    7:optional string status;
}

struct PromotionQueryParams{
    1:required i32 orgId;
    2:required i32 programId;
    3:required i32 promotionId;
}

struct ExpiryExtensionConfig {
	1: required i32 orgId;
	2: required bool enabled;
	3: optional string periodType;
	4: optional i32 periodValue;
	5: optional list<string> enabledEvents;
	6: optional list<string> supportedEvents;
	7: optional i32 addedBy;
	8: optional i64 addedOn;
	9: optional i64 strategyId;
}

struct CampaignStrategy {
  1: required i32 orgId;
  2: required i32 programId;
  3: required string programName;
  4: optional map <i32, string> allocationStrategy;
  5: optional map <i32, string> expiryStrategy;
}

enum BenefitType{
	POINTS,
	VOUCHER
}

enum LinkedProgramType{
	PARTNER,
	LOYALTY
}

struct BenefitsConfigData {
	1: required i32 orgId;
	2: required i32 programId;
	3: required string benefitName;
	4: required BenefitType benefitType;
	5: required LinkedProgramType linkedProgramType;
	6: required string description;
	7: required i32 promotionId;
	8: required bool isActive;
	9: required i32 maxUsageLimit;
	10: required i32 createdBy;
	11: required string createdOn;
	12: optional i32 id;
	13: optional bool updatedViaNewUI;
	14: optional i64 createdOnInMillis;
}

struct TPromotionLimits {
    1: optional i32 numberOfTimesPerCustomer;
    2: optional i64 pointsPerCustomer;
    3: optional i64 totalPointsInPromotion;
    4: optional i64 totalPointsPerEventLimit;
}

struct PromotionAdvancedSettings {
    1: optional string promotionIdentifier;
    2: optional TPromotionLimits promotionLimits;
    3: optional list<PromotionMetadata> promotionMetadata;
}

struct GetBackupPartnerProgramRequest {
    1: required i32 orgId;
    2: required i32 loyaltyProgramId;
    3: required i64 partnerProgramExpiryDate;
    4: optional i32 partnerProgramId;
    5: optional i32 limit;
    6: optional i32 offset;
}

enum OwnerType{
  PARTNER
  PROGRAM
}

struct LiabilityOwnerInfo {
  1: optional i32 id;
  2: required i32 orgId;
  3: required i32 ownerId;
  4: required string ownerName;
  5: required OwnerType ownerType;
  6: required i32 createdBy;
  7: optional bool isActive;
  8: optional string createdOn;
}

enum ComponentType {
  PROGRAM
  PROMOTION
}

struct LiabilityOwnerSplitInfo {
  1: required i32 orgId;
  2: required i32 liabilityOwnerId;
  3: required i32 componentId;
  4: required ComponentType componentType;
  5: required i32 createdBy;
  6: required double ratio;
  7: optional string liabilityOwnerName;
  8: optional bool isActive;
  9: optional OwnerType liabilityOwnerType;
}

struct ChangeInfo {
  1: required i64 modifiedOn;
  2: required i32 modifiedByUserId;
  3: required string details;
}

struct CappingConfig {
	1: required i32 id;
	2: required i32 orgId;
	3: required i32 programId;
	4: required string name;
	5: required string className;
	6: required string propertyValuesJson;
    7: required i32 contextId;
    8: required string contextType;
	9: required string eventName;
	10: required bool isActive;
	11: required i64 createdOn;
	12: required i64 updatedOn;
	13: required i32 createdBy;
	14: required i32 updatedBy;
	15: optional string eventSubTypeId;
}

struct CappingConfigFilter {
	1: required i32 orgId;
	2: required i32 programId;
	3: required string eventName;
	4: optional bool isActive;
}
enum FieldTypes {
	PROMOTION
	REDEMPTION_PURPOSE
}

enum ValueTypes {
	DOUBLE
	STRING
	STRING_LIST
	DATE_TIME
	ENUM
}

struct CustomFieldEnumValue{
	1: optional i32 id;
	2: required string enumValue;
	3: required bool isActive;
}

struct CustomFieldsInfo {
    1: optional i32 id;
	2: required i32 orgId;
	3: required string fieldName;
	4: required FieldTypes fieldType;
	5: required ValueTypes valueType;
	6: required i32 createdBy;
	7: optional list<CustomFieldEnumValue> enumValues;
	8: required bool isActive;
}

enum AuditTrailSortByField{
	MODIFIED_ON,
	MODIFIED_BY
}

enum AuditTrackedClass{
	AdminUserModel,
	CampaignMetadata,
	Campaigns,
	ConfigKeyValue,
	ContextReconfigured,
	LiabilitySplitRatio_PROMOTION,
	LiabilitySplitRatio_PROGRAM,
	OrganizationModel,
	OrgEntityModel,
	PartnerProgram,
	Program,
	ProgramConfigChangeLog,
	ProgramSlab,
	Promotion,
	Reconfigure,
	Ruleset,
	Strategy,
	TrackerCondition
}
struct GetAuditTrailRequest {
	1: required i32 orgId,
	2: required AuditTrackedClass trackedClass,
	3: optional i32 limit;
	4: optional i32 offset;
	5: optional AuditTrailSortByField sortBy;
	6: optional string sortOrder;
	7: required i32 trackeditem;
}

struct AuditLogResponse{
	1: required i32 currentAuditId;
	2: required string currentValue;
	3: required i32 previousAuditId;
	4: required string previousValue;
	5: required i32 modifiedBy;
	6: required i64 modifiedOn;
}

struct AuditTrailResponse {
	1: required i32 orgId,
	2: required AuditTrackedClass trackedClass,
	3: required i32 trackedItem;
	4: required list<AuditLogResponse> logs;
}

struct AlternateCurrencyMetadata{
	1: required string description;
	2: required string image;
	3: required bool isRedeemable;
	4: optional bool isReturnable;
}

enum ACCategoryType{
	REGULAR
	PROMISED
	EXTERNAL_TRIGGER_BASED
}

struct AlternateCategoryPointCategory{
    1: required i32 categoryId; //refers to pointCategoryId of alternate currency
	2: required ACCategoryType categoryType; //refers to categoryType of alternate currency
	3: required string categoryName; //refers to pointCategoryType of alternate currency
}


struct AlternateCurrencyData{
	1: required i32 orgId;
	2: required i32 programId;
	3: optional string identifier;
	4: required i64 userId;
	5: required string name;
	6: required AlternateCurrencyMetadata metaData;
	7: required i64 startDate;
	8: required i64 endDate;
	9: required bool isActive;
	10: optional VersionStatus status;
	11: optional AttributionInfo attributionInfo;
	12: optional list<AlternateCategoryPointCategory> alternateCategoryPointCategory;
}

enum LimitEntityScope {
  PROGRAM,PROMOTION
}

enum LimitPeriodType {
  MOVING_WINDOW, FIXED_CALENDAR_WINDOW, NON_PERIOD_BASED,FIXED_WINDOW
}

enum LimitPeriodUnit {
  DAYS,WEEKS,MONTHS
}

enum LimitActionType {
  AWARD_CURRENCY, AWARD_BADGE
}

enum LimitType {
  SUM, COUNT
}

enum LimitGranularity {
  OVERALL,USER,PER_ACTIVITY
}
enum WeekDay {
  SUNDAY,MONDAY,TUESDAY,WEDNESDAY,THURSDAY,FRIDAY,SATURDAY
}

struct LimitPeriodConfigData {
	1: optional i64 id;
	2: required i64 orgId;
	3: required LimitPeriodType periodType;
	4: optional LimitPeriodUnit unit;
	5: optional WeekDay periodStartDay;
	6: optional i32 periodValue;
	7: optional i64 startDate;
	8: optional i64 endDate;
}

struct LimitConfigData {
	1: optional i64 id;
	2: required i64 orgId;
	3: required bool isActive;
	4: required LimitEntityScope entityScope;
	5: required LimitGranularity granularity;
    6: required i64 entityId;
	7: required LimitActionType actionType;
    8: required i64 actionSubTypeId;
	9: required string limitValue;
	10: required LimitType limitType;
    11: required LimitPeriodConfigData limitPeriod;
}

enum PeConfigType {
	ALTERNATE_CURRENCIES,
    PROMOTION
}

struct PublishPeConfigParams{
	1: required i32 orgId,
	2: required i32 userId,
	3: required i32 programId,
	4: required string identifier,
	5: required PeConfigType configType
}

struct AlternateCurrencyFilter {
    1: required i32 orgId,
    2: optional i32 programId,
    3: optional string identifier,
    4: optional string name,
    5: optional VersionStatus alternateCurrencyStatus,
    6: optional bool includeInactive = false,
    7: optional PageRequest page,
    8: optional bool includePointCategories
}

enum EntityValidationType {
  ALLOCATION_STRATEGY = 1,
  EXPIRY_STRATEGY = 2,
  PROMOTION = 3,
  EVENT_NAME = 4,
  ALTERNATE_CURRENCY = 5,
  SOURCE_VALUE_ROUNDING = 6,
  POINTS_ROUNDING = 7,
  CURRENCY_TYPE = 8,
  EVENT_SOURCE = 9,
  SOURCE_VALUE = 10
}

struct ProgramValidateEntity {
  1: required string entity,
  2: required EntityValidationType entityType
}

struct ProgramEntitiesValidateRequest{
    1: required i32 orgId,
    2: required i32 programId,
    3: required i64 entityId, // can be used for CUSTOMER and USERGROUP2
    4: required list<ProgramValidateEntity> programValidateEntity;
}

struct ProgramEntitiesValidateResponse{
    1: required bool isSuccess,
    2: optional list<string> errors
}

service PointsEngineRuleService {

	BoolRes publishPeConfig(1: PublishPeConfigParams publishPeConfig, 2: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

	AlternateCurrencyData createOrUpdateAlternateCurrency(1:AlternateCurrencyData alternateCurrencyEventData, 2: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

    list<AlternateCurrencyData> getAllAlternateCurrency( 1: AlternateCurrencyFilter alternateCurrencyFilter, 2: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

	/*
	 * Get the information of Program based on tillId
	 */
	 ProgramInfo getProgramByTill(1:ProgramFilter programFilter, 2:string serverReqID) throws (1: PointsEngineRuleServiceException ex);

      /*
       * creates / update non redeemable points category
       */
      PointsCategory createOrUpdatePointsCategory(1:PointsCategory pointsCategory, 2:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

      /*
       * retrives points category for given id
       */
      PointsCategory getPointsCategory(1:i32 orgId, 2:i32 programId, 3: i32 categoryId, 4:string serverReqId ) throws (1: PointsEngineRuleServiceException ex);

      /*
       * Save all given Tracker Condition
       */
      TrackerCondition createOrUpdateTrackerCondition(1:TrackerCondition trackerCondition, 2:string serverReqId) throws ( 1: PointsEngineRuleServiceException ex);

      /*
       * get all tracker condition
       */
      list<TrackerCondition> getTrackerConditionForTrackerStrategy(1:i32 orgId, 2:i32 programId, 3:i32 strategyId, 4:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

      /*
       * get all slabs info based on program id
       */
      list <SlabInfo> getAllSlabs(1:i32 programId, 2:i32 orgId, 3:string serverReqId) throws ( 1: PointsEngineRuleServiceException ex);

      /*
       * get all strategies info based on program id
       */
      list <StrategyInfo> getAllConfiguredStrategies(1:i32 programId, 2:i32 orgId, 3:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

      /*
       * get all strategies info based on program id and strategyTypeId
       */
      list <StrategyInfo> getAllStrategiesByStrategyTypeId(1:i32 programId, 2:i32 orgId, 3:i32 strategyTypeId, 4:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);


      /*
       * get Strategy info based on strategy id
       */
      StrategyInfo getStrategy(1:i32 strategyId, 2:i32 programId, 3:i32 orgId, 4:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

      /*
       * create/update strategy
       * return Strategy info created/updated
       */
      StrategyInfo createOrUpdateStrategy(1:StrategyInfo strategyInfo, 2:i32 programId, 3:i32 orgId, 4:i32 lastModifiedBy, 5:i64 lastModifiedOn, 6:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

      /*
       * creation of slab along with updation strategies
       * return SlabInfo info created
       */
      SlabInfo createSlabAndUpdateStrategies(1:i32 programId, 2:i32 orgId, 3:SlabInfo slabInfo, 4:list<StrategyInfo> strategyInfos, 5:i32 lastModifiedBy, 6:i64 lastModifiedOn, 7:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

      /*
       * get all promotions info based on program id
       */
	list <PromotionInfo> getPromotionsByProgramId(1:i32 programId, 2:i32 orgId, 3:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

	/*
       * get all promotions info based on ruleset name
       */
	list <PromotionInfo> getPromotionsByRulesetName(1:i32 programId, 2:i32 orgId, 3:string rulesetName, 4:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

	/*
       * get all promotions info based on event type id
       */
	list <PromotionInfo> getPromotionsByProgramAndEventType(1:i32 programId, 2:i32 orgId, 3:string eventName, 4:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

      /*
       * get Promotion info based on strategy id
       */
      PromotionInfo getPromotion(1:i32 promotionId, 2:i32 programId, 3:i32 orgId, 4:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

        list <PromotionInfo> getPromotionsFiltered(1:PromotionsFilter promotionsFilter, 2:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

      PromotionInfo getPromotionByIdentifier(1:string promotionIdentifier, 2:i32 programId, 3:i32 orgId, 4:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

      /*
       * create/update promotion
       * return Promotion info created/updated
       */
      PromotionInfo createOrUpdatePromotion(1:PromotionInfo promotionInfo, 2:i32 programId, 3:i32 orgId, 4:i32 lastModifiedBy, 5:i64 lastModifiedOn, 6:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

       /*
       * get Promotion and ruleset information by query params.
       */
      list <PromotionAndRulesetInfo> getPromotionV2(1:PromotionQueryParams promotionQueryParams, 2:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

      /*
      * get promotion and ruleset information by promotion ruleset info filtered.
      */      
      list <PromotionAndRulesetInfo> getPromotionsAndRulesetInfoFiltered(1:PromotionsAndRulesetInfoFilter promotionsAndRulesetInfoFilter, 2:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

      /*
      * create/update promotion v2
      * return Promotion and rule set info created/updated
      */
      PromotionAndRulesetInfo createOrUpdatePromotionV2(1:PromotionAndRulesetInfo promotionInfo, 2:i32 programId, 3:i32 orgId, 4:i32 lastModifiedBy, 5:i64 lastModifiedOn, 6:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

      /*
      * create/update promotion v3 - identical to v2 but with different name
      * return Promotion and rule set info created/updated
      */
      PromotionAndRulesetInfo createOrUpdatePromotionV3(1:PromotionAndRulesetInfo promotionInfo, 2:i32 programId, 3:i32 orgId, 4:i32 lastModifiedBy, 5:i64 lastModifiedOn, 6:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

      /* create/update Limits
      * return Limits created/updated
      */
      LimitConfigData createOrUpdateLimit(1:LimitConfigData limit, 2:i64 orgId, 3:i64 lastModifiedBy, 4:i64 lastModifiedOn, 5:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

     /*
      * returns Promotion and rule set info against promotionId
      */

      PromotionAndRulesetInfo getPromotionAndRulesetInfo(1:i32 orgId, 2:i32 programId, 3:i32 promotionId, 4:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);


	  /*
	   * cleanup for promotion ruleset status
	  */
		BoolRes updatePromotionRulesetStatus(1:i32 orgId, 2: list<i32> programIds, 3:string sourceType, 4:string serverReqId) throws (1: PointsEngineRuleServiceException ex);
      /*
       * get All events
       * return map of < eventId, eventName >
       */
      map <i32, string> getAllEvents( 1:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

      /*
       * get All Strategy Types
       * return map of < strategyTypeId, strategyTypeName >
       */
      map <i32, string> getStrategyTypes( 1:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

      /*
       * get programId based on orgId
       */
	i32 getProgramId(1:i32 orgId, 2:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

     /**
      *  update ProgramInfo
      */
     ProgramInfo updateProgram( 1:ProgramInfo program, 2:i32 orgId, 3:i32 lastModifiedBy, 4:i64 lastModifiedOn, 5:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

	/**
	 * Create if slab not exist, otherwise update
	 */
	SlabInfo createOrUpdateSlab(1:SlabInfo slabInfo, 2:i32 orgId, 3:i32 lastModifiedBy, 4:i64 lastModifiedOn, 5:string serverReqId) throws ( 1: PointsEngineRuleServiceException ex);


  /**
   * Create if card series mapping not exist, otherwise update
   */
  list<CardSeriesProgramMappingInfo> createProgramCardSeriesMapping(1: i32 orgId, 2: i32 programId,3: list<i32> cardSeriesIds, 4: string serverReqId) throws ( 1: PointsEngineRuleServiceException ex);

	/**
	 * Get the active programInfo
	 */
	ProgramInfo getProgram(1:i32 programId, 2:i32 orgId, 3:string serverReqId ) throws ( 1: PointsEngineRuleServiceException ex);

	/**
	 * Get the all programInfo including inactive programs
	 */
	list<ProgramInfo> getAllPrograms(1:i32 orgId, 2:string serverReqId ) throws ( 1: PointsEngineRuleServiceException ex);

	/**
	 * Get the card series linked programInfo
	 */
	map <i32, ProgramInfo> getCardSeriesLinkedProgram(1:CardSeriesList cardSeriesList, 2:string serverReqId ) throws ( 1: PointsEngineRuleServiceException ex);

	/**
	 * Rollout new UI for an org
	 */
	bool rolloutNewUI(1:i32 orgId, 2:string serverReqId)  throws (1: PointsEngineRuleServiceException ex);

        //Tender combinations
        TenderCombination getTenderCombination(1:i32 orgID, 2:i32 tenderCombinationId, 3:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

	list<TenderCombination> getAllTenderCombinations(1:i32 orgID, 2:i32 programId,3:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

        TenderCombination createTenderCombination(1:i32 orgID, 2:TenderCombination tenderCombination, 3:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

        TenderCombination editTenderCombination(1:i32 orgID, 2:TenderCombination tenderCombination, 3:string serverReqId) throws (1: PointsEngineRuleServiceException ex);


  list<CardSeriesInfo> getAllAvailableCardSeriesForOrg(1:i32 orgID, 2:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

  list<CardSeriesInfo> getCardSeriesForProgram(1:i32 orgID, 2:i32 programId, 3:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

	/**
	* returns map of program id vs card series info based on org program filter
	*/
	map<i32,list<CardSeriesInfo>> getAllCardSeries(1:OrgProgramFilter orgProgramFilter, 2:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

	/**
         * Get the all partnerProgramInfo based on programId
         */
	list<PartnerProgramInfo> getAllPartnerPrograms(1:i32 programId, 2:i32 orgId, 3:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

	/*
       	* create/update partner program
       	* return PartnerProgramInfo created/updated
       	*/
	PartnerProgramInfo createOrUpdatePartnerProgram(1:PartnerProgramInfo partnerProgramInfo, 2:i32 programId, 3:i32 orgId, 4:i32 lastModifiedBy, 5:i64 lastModifiedOn, 6:string serverReqId) throws (1: PointsEngineRuleServiceException ex);


  /*
        * create/update expiry reminder details for supp partner program
        * return ExpiryReminderForPartnerProgramInfo created/updated
        */
  ExpiryReminderForPartnerProgramInfo createOrUpdateExpiryReminderForPartnerProgram(1:ExpiryReminderForPartnerProgramInfo expiryReminderPartnerProgramInfo, 2:i32 programId, 3:i32 orgId, 4:i32 lastModifiedBy, 5:i64 lastModifiedOn, 6:string serverReqId) throws (1: PointsEngineRuleServiceException ex);


  /**
         * Get the all expiry reminder configured for partner program based on programId
         */
  list<ExpiryReminderForPartnerProgramInfo> getAllExpiryReminderConfiguredPartnerPrograms(1:i32 programId, 2:i32 orgId, 3:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

	/*
        * Get program settings based on programId
        */
	ProgramSettings getProgramSettings(1:i32 programId, 2:i32 orgId, 3:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

	/*
        * update program settings
        * return ProgramSettings updated
        */
        ProgramSettings updateProgramSettings(1:ProgramSettings programSettings, 2:i32 orgId, 3:i32 lastModifiedBy, 4:i64 lastModifiedOn, 5:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

	ExpiryExtensionConfig getExpiryExtensionConfig(1:i32 orgId, 2:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

	ExpiryExtensionConfig saveExpiryExtensionConfig(1:ExpiryExtensionConfig expiryExtensionConfig, 2:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

  list<CampaignStrategy> getStrategiesForCampaign(1:i32 orgId, 2:i32 programId, 3:string serverReqId) throws (1: PointsEngineRuleServiceException ex);

  BenefitsConfigData createOrUpdateBenefits(1: BenefitsConfigData configData, 2: string serverReqId) throws (1 :PointsEngineRuleServiceException ex);

  list<BenefitsConfigData> getConfiguredBenefits(1: i32 orgId,2: i32 programId,3: LinkedProgramType type, 4: string serverReqId) throws (1 :PointsEngineRuleServiceException ex);

  BenefitsConfigData getBenefitsById(1: i32 orgId,2: i32 id ,3: string serverReqId) throws (1 :PointsEngineRuleServiceException ex);

  list<BenefitsConfigData> getAllConfiguredBenefits(1: i32 orgId,2: string serverReqId) throws (1 :PointsEngineRuleServiceException ex);

  PartnerProgramInfo getPartnerProgramById(1: i32 orgId,2: i32 id ,3: string serverReqId) throws (1 :PointsEngineRuleServiceException ex);

  list<OrgEnitiesConfigData> getProgramOrgEntityMapping(1: i32 orgId, 2: string serverReqId) throws (1 :PointsEngineRuleServiceException ex);

  PromotionAdvancedSettings updatePromotionAdvancedSettings(1: i32 orgId, 2: i32 programId, 3: i32 promotionId, 4: PromotionAdvancedSettings advancedSettings, 5: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

  PromotionAdvancedSettings getPromotionAdvancedSettings(1: i32 orgId, 2: i32 programId, 3: i32 promotionId, 5: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

  list<PartnerProgramInfo> getBackupPartnerPrograms(1:GetBackupPartnerProgramRequest request, 2: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

  list<LiabilityOwnerInfo> createAllLiabilityOwnersForType(1: i32 orgId, 2: list<OwnerType> ownerTypes, 3:i32 createdBy, 4: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

  list<LiabilityOwnerInfo> createLiabilityOwner(1: i32 orgId, 2: list<LiabilityOwnerInfo> liabilityOwnerTypes, 3: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

  list<LiabilityOwnerInfo> getLiabilityOwners(1: i32 orgId, 2: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

  list<LiabilityOwnerSplitInfo> createLiabilityOwnerSplit(1: i32 orgId, 2: list<LiabilityOwnerSplitInfo> ownerInfos, 3: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

  list<LiabilityOwnerSplitInfo> getLiabilityOwnersForComponent(1: i32 orgId, 2: i32 componentId, 3: ComponentType componentType, 4: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

  list<ChangeInfo> getChangeLogDetails(1:i32 orgId, 2:ComponentType componentType, 3:i32 componentId, 4:string requestId) throws (1: PointsEngineRuleServiceException ex);

  CappingConfig createOrUpdateCappingConfig(1:CappingConfig cappingConfig, 2:string requestId) throws (1: PointsEngineRuleServiceException ex);

  CappingConfig getCappingConfig(1:CappingConfigFilter cappingConfigFilter, 2:string requestId) throws (1: PointsEngineRuleServiceException ex);

  CustomFieldsInfo createOrUpdateCustomFields(1: i32 orgId, 2: CustomFieldsInfo customFieldsInfo, 3: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

  list<CustomFieldsInfo> getCustomFields(1: i32 orgId, 2: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

  AuditTrailResponse getAuditLogDetails(1: GetAuditTrailRequest  auditTrailRequest 2:string requestId) throws (1: PointsEngineRuleServiceException ex);

  /*
   * Validates multiple program entities in a batch operation
   * Returns validation results with success status and error details
   */
  ProgramEntitiesValidateResponse validateProgramEntities(1: ProgramEntitiesValidateRequest programValidateRequest, 2: string serverReqId) throws (1: PointsEngineRuleServiceException ex);

}
