use wireshark_ffi::bindings::*;
use std::os::raw::{c_char, c_int, c_void};
use lazy_static::lazy_static;
use crate::dissects::*;
use crate::utils::i8_str;
use crate::fields::*;

//
// Api Key 0: Produce
//
protocol!(ProduceRequest => {
    transactional_id/3 : {hf_kafka_transactional_id: String, ETT_TRANSACTIONAL_ID},
    acks: {hf_kafka_acks: i16},
    timeout: {hf_kafka_timeout: i32},
    topic_data: [TopicData ETT_TOPIC_DATA]
});

protocol!(TopicData => {
    topic: {hf_kafka_topic_name: String, ETT_PRODUCE_REQUEST_TOPIC},
    data: [TopicData2 ETT_TOPIC_DATA2]
});

protocol!(TopicData2 => {
    partition: {hf_kafka_partition: i32},
    record_set: {dissect_record_batch: fn}
});

// ProduceResponse
protocol!(ProduceResponse => {
    responses: [ProduceResponseItem ETT_PRODUCE_RESPONSE],
    throttle_time/1 : {hf_kafka_throttle_time_ms: i32}
});

protocol!(ProduceResponseItem => {
    topic: {hf_kafka_topic_name: String, ETT_PRODUCE_RESPONSE_TOPIC_NAME},
    partition_responses: [PartitionResponse ETT_PARTITION_RESPONSE]
});

protocol!(PartitionResponse => {
    partition : {hf_kafka_partition: i32},
    error_code : {hf_kafka_error: i16},
    base_offset : {hf_kafka_produce_response_baseoffset: i64},
    // TODO: when CreateTime is used, it will be -1 (year 2106), show it in special way
    log_append_time/2 : {hf_kafka_log_append_time: i64},
    log_start_offset/5 : {hf_kafka_produce_log_start_offset: i64}
});

//
// Api Key 1: Fetch
//
protocol!(FetchRequest => {
    replica_id : {hf_kafka_replica_id : i32},
    max_wait_time: {hf_kafka_max_wait_time: i32},
    min_bytes: {hf_kafka_min_bytes: i32},
    max_bytes/3 : {hf_kafka_max_bytes: i32},
    isolation_level/4: {hf_kafka_isolation_level: u8},
    session_id/7 : {hf_kafka_fetch_request_session_id: i32},
    session_epoch/7 : {hf_kafka_session_epoch: i32},
    topics: [FetchRequestTopic ETT_FETCH_REQ_TOPICS],
    forgotten_topics_data/7: [ForgottenTopicsData ETT_FORGOTTEN_TOPICS_DATA]
});

protocol!(ForgottenTopicsData => {
    topic: {hf_kafka_topic_name: String, ETT_FORGOTTEN_TOPIC_TOPIC_NAME},
    partitions: [ForgottenTopicsPartition ETT_FORGOTTEN_TOPIC_PARTITIONS]
});

protocol!(ForgottenTopicsPartition => {
    partition : {hf_kafka_partition: i32}
});

protocol!(FetchRequestTopic => {
    topic: {hf_kafka_topic_name: String, ETT_FETCH_REQUEST_TOPIC_NAME},
    partitions: [FetchRequestPartition ETT_FETCH_REQUEST_PARTITIONS]
});

protocol!(FetchRequestPartition => {
    partition : {hf_kafka_partition: i32},
    current_leader_epoch/9 : {hf_kafka_current_leader_epoch: i32},
    fetch_offset : {hf_kafka_fetch_request_fetch_offset: i64},
    log_start_offset/5 : {hf_kafka_fetch_request_log_start_offset : i64},
    partition_max_bytes : {hf_kafka_partition_max_bytes: i32}
});

// FetchResponse
protocol!(FetchResponse => {
    throttle_time/1 : {hf_kafka_throttle_time_ms: i32},
    error/7: {hf_kafka_error: i16},
    session_id/7: {hf_kafka_fetch_response_session_id: i32},
    responses: [FetchResponseItem ETT_FETCH_RESPONSES]
});

protocol!(FetchResponseItem => {
    topic: {hf_kafka_topic_name: String, ETT_FETCH_RESPOSE_TOPIC_NAME},
    partition_responses : [FetchResponsePartition ETT_FETCH_RESPONSE_PARTITIONS]
});

protocol!(FetchResponsePartition => {
    partition : {hf_kafka_partition: i32},
    error_code : {hf_kafka_error: i16},
    high_watermark: {hf_kafka_high_watermark: i64},
    last_stable_offset/4 : {hf_kafka_last_stable_offset: i64},
    log_start_offset/5: {hf_kafka_fetch_response_log_start_offset: i64},
    aborted_transactions/4 : [AbortedTransactions ETT_ABORTED_TRANSACTIONS],
    record_set: {dissect_record_batch: fn}
});

protocol!(AbortedTransactions => {
    producer_id: {hf_kafka_aborted_tx_producer_id: i64},
    first_offset: {hf_kafka_aborted_tx_first_offset: i64}
});

//
// ApiKey 2 (ListOffsets)
//
protocol!(ListOffsetsRequest => {
    replica_id: {hf_kafka_list_offset_request_replica_id: i32},
    isolation_level/2 : {hf_kafka_isolation_level: u8},
    topics: [ListOffsetsTopic ETT_LIST_OFFSET_TOPICS]
});

protocol!(ListOffsetsTopic => {
    topic: {hf_kafka_topic_name: String, ETT_LIST_OFFSET_REQUEST_TOPIC},
    partitions: [ListOffsetPartition ETT_LIST_OFFSET_PARTITION]
});

protocol!(ListOffsetPartition => {
    partition: {hf_kafka_list_offset_request_partition: i32},
    current_leader_epoch/4 : {hf_kafka_current_leader_epoch: i32},
    timestamp: {hf_kafka_list_offset_request_timestamp: i64},
    max_num_offsets/(-1): {hf_kafka_list_offset_request_max_num_offsets: i32}
});

// Response
protocol!(ListOffsetResponse => {
    throttle_time/2 : {hf_kafka_throttle_time_ms: i32},
    responses: [ListOffsetResponseItem ETT_LIST_OFFSET_RESPONSES]
});

protocol!(ListOffsetResponseItem => {
    topic: {hf_kafka_topic_name: String, ETT_LIST_OFFSET_REQUEST_TOPIC},
    partition_responses: [ListOffsetPartitionResponse ETT_LIST_OFFSET_PARTITION_RESPONSE]
});

protocol!(ListOffsetPartitionResponse => {
    partition: {hf_kafka_partition: i32},
    error_code: {hf_kafka_error: i16},
    offsets/(-1): [ListOffsetPartitionOffset ETT_LIST_OFFSET_PARTITION_OFFSETS],
    timestamp/1: {hf_kafka_list_offset_response_timestamp: i64},
    offset/1: {hf_kafka_list_offset_response_offset: i64},
    leader_epoch/4 : {hf_kafka_list_offset_leader_epoch: i32}
});

protocol!(ListOffsetPartitionOffset => {
    offset: {hf_kafka_list_offset_response_offset: i64}
});

//
// ApiKey 3 (Metadata)
//
protocol!(MetadataRequest => {
    topics: [MetadataRequestTopics ETT_METADATA_REQUEST_TOPICS],
    allow_auto_topic_creation/4 : {hf_kafka_allow_auto_topic_creation: bool}
});

protocol!(MetadataRequestTopics => {
    topic: {hf_kafka_topic_name: String, ETT_METADATA_TOPIC}
});

protocol!(MetadataResponse => {
    throttle_time_ms/3 : {hf_kafka_throttle_time_ms: i32},
    Brokers: [Broker ETT_TOPICS],
    cluster_id/2 : {hf_kafka_cluster_id: String, ETT_CLUSTER_ID},
    controller_id/1 : {hf_kafka_controller_id: i32},
    topic_metadata : [TopicMetadata ETT_METADATA_TOPIC]
});

protocol!(TopicMetadata => {
    error_code : {hf_kafka_error: i16},
    topic : {hf_kafka_topic_name: String, ETT_METADATA_TOPIC},
    is_internal/1 : {hf_kafka_is_internal: bool },
    partition_metadata : [PartitionMetadata ETT_PARTITION_METADATA]
});

protocol!(PartitionMetadata => {
    error_code : {hf_kafka_error: i16},
    partition : {hf_kafka_partition: i32},
    leader : {hf_kafka_metadata_leader: i32},
    leader_epoch/7 : {hf_kafka_metadata_leader_epoch: i32},
    replicas: [Replica ETT_REPLICAS],
    isr: [Isr ETT_ISR],
    offline_replicas/5 : [OfflineReplicas ETT_OFLINE_REPLICAS]
});

protocol!(Broker => {
    node_id: {hf_kafka_node_id: i32},
    host: {hf_kafka_host: String, ett_broker_host},
    port: {hf_kafka_port: i32},
    rack/1 : {hf_kafka_rack: String, ETT_RACK}
});

protocol!(Replica => {
    replica: {hf_kafka_metadata_replicas: i32}
});

protocol!(Isr => {
    isr: {hf_kafka_metadata_isr: i32}
});

protocol!(OfflineReplicas => {
    offline_replica: {hf_kafka_offline_replica: i32}
});

//
// TODO: ApiKey 4-8
//

//
// ApiKey 9 (OffsetFetch)
//
protocol!(OffsetFetchRequest => {
    group_id : {hf_kafka_group_id: String, ETT_GROUP_ID},
    topics : [OffsetFetchTopic ETT_OFFSET_FETCH_TOPICS]
});

protocol!(OffsetFetchTopic => {
    topic : {hf_kafka_topic_name: String, ETT_OFFSET_FETCH_TOPIC},
    partitions : [OffsetFetchPartitions ETT_OFFSET_FETCH_PARTITIONS]
});

protocol!(OffsetFetchPartitions => {
    partition: {hf_kafka_partition: i32}
});

// Response
protocol!(OffsetFetchResponse => {
    throttle_time_ms/3 : {hf_kafka_throttle_time_ms: i32},
    responses : [OffsetFetchItem ETT_OFFSET_FETCH_RESPONSES],
    error_code/2: {hf_kafka_error: i16}
});

protocol!(OffsetFetchItem => {
    topic : {hf_kafka_topic_name: String, ETT_OFFSET_FETCH_ITEM_TOPIC},
    partition_responses : [OffsetFetchTopicPartition ETT_OFFSET_FETCH_TOPIC_PARTITION]
});

protocol!(OffsetFetchTopicPartition => {
    partition: {hf_kafka_partition: i32},
    offset : {hf_kafka_offset : i64},
    leader_epoch/5 : {hf_kafka_offset_fetch_leader_epoch: i32},
    metadata : {hf_kafka_fetch_response_metadata : String, ETT_FETCH_RESPONSE_METADATA},
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 10 (FindCoordinator)
//
protocol!(FindCoordinatorRequest => {
    group_id/(-1) : {hf_kafka_group_id: String, ETT_GROUP_ID},
    coordinator_key/1: {hf_kafka_find_coordinator_key: String, ETT_FIND_COORDINATOR_KEY},
    coordinator_type/1: {hf_kafka_find_coordinator_type: u8}
});

protocol!(FindCoordinatorResponse => {
    throttle_time_ms/1 : {hf_kafka_throttle_time_ms: i32},
    error_code: {hf_kafka_error: i16},
    errpr_message/1: {hf_kafka_find_coordinator_error_message: String, ETT_FIND_COORDINATOR_ERROR_MESSAGE},
    node_id: {hf_kafka_find_coordinator_node_id: i32},
    host: {hf_kafka_find_coordinator_host: String, ETT_FIND_COORDINATOR_HOST},
    port: {hf_kafka_find_coordinator_port: i32}
});

//
// ApiKey 11 (JoinGroup)
//
protocol!(JoinGroupRequest => {
    group_id : {hf_kafka_group_id: String, ETT_GROUP_ID},
    session_timeout: {hf_kafka_session_timeout: i32},
    rebalance_timeout/1 : {hf_kafka_rebalance_timeout: i32},
    member_id: {hf_kafka_member_id: String, ETT_MEMBER_ID},
    protocol_type: {hf_kafka_protocol_type: String, ETT_PROTOCOL_TYPE},
    group_protocols: [GroupProtocol ETT_GROUP_PROTOCOLS]
});

protocol!(GroupProtocol => {
    protocol_name: {hf_kafka_protocol_name: String, ETT_PROTOCOL_NAME},
    protocol_metadata: { dissect_bytes(hf_kafka_protocol_metadata) }
});

// Response
protocol!(JoinGroupResponse => {
    throttle_time_ms/2 : {hf_kafka_throttle_time_ms: i32},
    error_code: {hf_kafka_error: i16},
    generation_id: {hf_kafka_generation_id: i32},
    group_protocol: {hf_kafka_group_protocol: String, ETT_GROUP_PROTOCOL},
    leader_id: {hf_kafka_leader_id: String, ETT_LEADER_ID},
    member_id: {hf_kafka_member_id: String, ETT_MEMBER_ID},
    members: [JoinGroupMember ETT_JOIN_GROUP_MEMBER]
});

protocol!(JoinGroupMember => {
    member_id: {hf_kafka_member_id: String, ETT_MEMBER_ID},
    member_metadata: { dissect_bytes(hf_kafka_member_metadata) }
});

//
// ApiKey 12 (Hartbeat)
//
protocol!(HartbeatRequest => {
    group_id : {hf_kafka_group_id: String, ETT_GROUP_ID},
    generation_id: {hf_kafka_generation_id: i32},
    member_id: {hf_kafka_member_id: String, ETT_MEMBER_ID}
});

protocol!(HartbeatResponse => {
    throttle_time_ms/1 : {hf_kafka_throttle_time_ms: i32},
    error_code: {hf_kafka_error: i16}
});

//
// ApiGroup 13 (LeaveGroup)
//
protocol!(LeaveGroupRequest => {
    group_id : {hf_kafka_group_id: String, ETT_GROUP_ID},
    member_id: {hf_kafka_member_id: String, ETT_MEMBER_ID}
});

protocol!(LeaveGroupResponse => {
    throttle_time_ms/1 : {hf_kafka_throttle_time_ms: i32},
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 14 (SyncGroup)
//
protocol!(SyncGroupRequest => {
    group_id : {hf_kafka_group_id: String, ETT_GROUP_ID},
    generation_id: {hf_kafka_generation_id: i32},
    member_id: {hf_kafka_member_id: String, ETT_MEMBER_ID},
    group_assignment: [SyncGroupAssignment ETT_SYNC_GROUP_ASSIGNMENT]
});

protocol!(SyncGroupAssignment => {
    member_id: {hf_kafka_member_id: String, ETT_MEMBER_ID},
    member_assignment: { dissect_bytes(hf_kafka_member_assignment) }
});

protocol!(SyncGroupResponse => {
    throttle_time_ms/1 : {hf_kafka_throttle_time_ms: i32},
    error_code: {hf_kafka_error: i16},
    member_assignment: { dissect_bytes(hf_kafka_member_assignment) }
});


//
// ApiKey 18 (ApiVersion). Note: Request is empty (no fields)
//
protocol!(ApiVersionResponse => {
    error_code: {hf_kafka_error: i16},
    api_versions: [ApiVersion ETT_API_API_VERSIONS],
    throttle_time_ms/1 : {hf_kafka_throttle_time_ms: i32}
});

protocol!(ApiVersion => {
    api_key : {hf_kafka_api_key: i16},
    min_version: {hf_kafka_min_version: i16},
    max_version: {hf_kafka_max_version: i16}
});