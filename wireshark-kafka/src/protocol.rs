#![allow(unused)]

use wireshark_ffi::bindings::*;
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
// ApiKey 4 (LeaderAndIsr)
//
protocol!(LeaderAndIsrRequest => {
    controller_id : {hf_kafka_controller_id : i32},
    controller_epoch: {hf_kafka_controller_epoch: i32},
    broker_epoch/2 : {hf_kafka_broker_epoch : i64},
    topic_states/2 : [LeaderAndIsrRequestTopicState ETT_LEADER_AND_ISR_TOPIC_STATE],
    partition_states/(-2) : [LeaderAndIsrRequestPartitionStates ETT_LEADER_AND_ISR_PARTITION_STATES ],
    live_leaders : [LeaderAndIsrRequestLiveLeaders ETT_LEADER_AND_ISR_LIVE_LEADERS]
});

protocol!(LeaderAndIsrRequestTopicState => {
    topic : {hf_kafka_topic_name: String, ETT_LEADER_AND_ISR_TOPIC},
    partition_states : [LeaderAndIsrPartitionState2 ETT_LEADER_AND_ISR_PARTITION_STATES]
});

protocol!(LeaderAndIsrPartitionState2 => {
    partition: {hf_kafka_partition: i32},
    controller_epoch: {hf_kafka_controller_epoch: i32},
    leader : {hf_kafka_leader : i32},
    leader_epoch : {hf_kafka_leader_epoch: i32},
    isr : [Isr ETT_LEADER_AND_ISR_REQUEST_ISRS],
    zk_version : {hf_kafka_zk_version: i32},
    replicas : [Replicas ETT_LEADER_AND_ISR_REPLICAS],
    is_new/1 : {hf_kafka_leader_and_isr_is_new : bool}
});

protocol!(LeaderAndIsrRequestPartitionStates => {
    topic : {hf_kafka_topic_name: String, ETT_LEADER_AND_ISR_REQUEST_PARTITION_STATE_TOPIC},
    partition: {hf_kafka_partition: i32},
    controller_epoch: {hf_kafka_controller_epoch: i32},
    leader : {hf_kafka_leader : i32},
    leader_epoch : {hf_kafka_leader_epoch: i32},
    isr : [Isr ETT_LEADER_AND_ISR_REQUEST_ISRS],
    zk_version : {hf_kafka_zk_version: i32},
    replicas : [Replicas ETT_LEADER_AND_ISR_REPLICAS],
    is_new/1 : {hf_kafka_leader_and_isr_is_new : bool}
});

protocol!(LeaderAndIsrRequestLiveLeaders => {
    id : {hf_kafka_broker_id: i32},
    host: {hf_kafka_host: String, ETT_LEADER_AND_ISR_HOST},
    port: {hf_kafka_port: i32}
});

protocol!(Replicas => {
    replica : {hf_kafka_replica : i32}
});

// Response
protocol!(LeaderAndIsrResponse => {
    error_code: {hf_kafka_error: i16},
    partitions : [LeaderAndIsrResponsePartition ETT_LEADER_AND_ISR_RESPONSE_PARTITION]
});

protocol!(LeaderAndIsrResponsePartition => {
    topic : {hf_kafka_topic_name: String, ETT_LEADER_AND_ISR_RESPONSE_TOPIC},
    partition: {hf_kafka_partition: i32},
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 5 (StopReplica)
//
protocol!(StopReplicaRequest => {
    controller_id : {hf_kafka_controller_id: i32},
    controller_epoch: {hf_kafka_controller_epoch: i32},
    broker_epoch/1 : {hf_kafka_broker_epoch : i64},
    delete_partitions : {hf_kafka_stop_replica_delete_partitions : bool},
    partitions : [StopReplicaRequestPartition ETT_STOP_REPLICA_REQUEST_PARTITIONS]
});

protocol!(StopReplicaRequestPartition => {
    topic : {hf_kafka_topic_name: String, ETT_STOP_REPLICA_PARTITION_TOPIC},
    partition/(-1) : {hf_kafka_partition: i32},
    partition_ids/1 : [StopReplicaRequestPartitionId ETT_STOP_REPLICA_PARTITION_IDS]
});

protocol!(StopReplicaRequestPartitionId => {
    partition: {hf_kafka_partition: i32}
});

// Response
protocol!(StopReplicaResponse => {
    error_code: {hf_kafka_error: i16},
    partitions : [StopReplicaResponsePartition ETT_STOP_REPLICA_RESPONSE_PARTITIONS]
});

protocol!(StopReplicaResponsePartition => {
    topic : {hf_kafka_topic_name: String, ETT_STOP_REPLICA_RESPONSE_PARTITION_TOPIC},
    partition : {hf_kafka_partition: i32},
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 6 (UpdateMetadata)
//

protocol!(UpdateMetadataRequest => {
    controller_id : {hf_kafka_controller_id: i32},
    controller_epoch: {hf_kafka_controller_epoch: i32},
    partition_states : [UpdateMetadataRequestPartitionState ETT_UPDATE_METADATA_REQUEST_PARTITION_STATES],
    broker_epoch/5 : {hf_kafka_broker_epoch : i64},
    topic/5 : {hf_kafka_topic_name: String, ETT_UPDATE_METADATA_REQUEST_TOPIC},
    live_brokers : [UpdateMetadataRequestLiveBroker ETT_UPDATE_METADATA_LIVE_BROKERS]
});

protocol!(UpdateMetadataRequestPartitionState => {
    topic/(-5) : {hf_kafka_topic_name: String, ETT_UPDATE_METADATA_PARTITION_TOPIC},
    partition : {hf_kafka_partition: i32},
    controller_epoch: {hf_kafka_controller_epoch: i32},
    leader : {hf_kafka_leader : i32},
    leader_epoch : {hf_kafka_leader_epoch: i32},
    isr : [Isr ETT_LEADER_AND_ISR_REQUEST_ISRS],
    zk_version : {hf_kafka_zk_version: i32},
    replicas : [Replicas ETT_UPDATE_METADATA_REQUEST_REPLICAS],
    offline_replicas/4 : [Replicas ETT_UPDATE_METADATA_REQUEST_OFFLINE_REPLICAS]
});

protocol!(UpdateMetadataRequestLiveBroker => {
    id : {hf_kafka_broker_id: i32},
    host/(-1) : {hf_kafka_host: String, ETT_UPDATE_METADATA_HOST},
    port/(-1) : {hf_kafka_port: i32},
    end_points/1 : [UpdateMetadataUpdateRequestEndPoint ETT_UPDATE_METADATA_END_POINT],
    rack/2 : {hf_kafka_update_meatadat_rack : String, ETT_RACK_UPDATE_METADATA}
});

protocol!(UpdateMetadataUpdateRequestEndPoint => {
    port: {hf_kafka_port: i32},
    host: {hf_kafka_host: String, ETT_LEADER_AND_ISR_HOST},
    listener_name/3 : {hf_kafka_listener_name : String, ETT_LISTENER_NAME},
    security_protocol_type : {hf_kafka_security_protocol : i16}
});

// Response
protocol!(UpdateMetadataResponse => {
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 7 (ControlledShutdown)
//
protocol!(ControlledShutdownRequest => {
    broker_id : {hf_kafka_controlled_shutdown_broker_id: i32},
    broker_epoch/2 : {hf_kafka_broker_epoch : i64}
});

// Response
protocol!(ControlledShutdownResponse => {
    error_code: {hf_kafka_error: i16},
    partitions_remaining : [ControlledShutdownPartitionRemaining ETT_CONTROLLED_SHUTDOWN_PARTITION_REMAINING]
});

protocol!(ControlledShutdownPartitionRemaining => {
    topic : {hf_kafka_topic_name: String, ETT_CONTROLLED_SHUTDOWN_RESPONSE_TOPIC},
    partition: {hf_kafka_partition: i32}
});

//
// ApiKey 8 (OffsetCommit)
//
protocol!(OffsetCommitRequest => {
    group_id : {hf_kafka_group_id: String, ETT_GROUP_ID},
    generation_id/1: {hf_kafka_generation_id: i32},
    member_id/1: {hf_kafka_member_id: String, ETT_MEMBER_ID},
    retention_time/(2-5) : {hf_kafka_offset_commit_retention_time : i64},
    topics : [OffsetCommitRequestTopic ETT_OFFSET_COMMIT_REQUEST_TOPIC]
});

protocol!(OffsetCommitRequestTopic => {
    topic : {hf_kafka_topic_name: String, ETT_METADATA_TOPIC},
    partitions : [OffsetCommitRequestPartition ETT_OFFSET_COMMIT_REQUEST_PARTITIONS]
});

protocol!(OffsetCommitRequestPartition => {
    partition: {hf_kafka_partition: i32},
    offset : {hf_kafka_offset : i64},
    timestamp/(1-2): {hf_kafka_commit_offset_timestamp : i64},
    leader_epoch/6 : {hf_kafka_offset_commit_leader_epoch : i32},
    metadata : {hf_kafka_offset_commit_metadata : String, ETT_OFFSET_COMMIT_METADATA}
});

// Response
protocol!(OffsetCommitResponse => {
    throttle_time_ms/3 : {hf_kafka_throttle_time_ms: i32},
    responses : [OffsetCommitResponseItem ETT_OFFSET_COMMIT_RESPONSES]
});

protocol!(OffsetCommitResponseItem => {
    topic : {hf_kafka_topic_name: String, ETT_OFFSET_COMMIT_RESPONSE_TOPIC},
    partition_responses : [OffsetCommitResponsePartition ETT_OFFSET_COMMIT_RESPONSE_PARTITIONS ]
});

protocol!(OffsetCommitResponsePartition => {
    partition: {hf_kafka_partition: i32},
    error_code: {hf_kafka_error: i16}
});

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
// ApiKey 15 (DescribeGroups)
//
protocol!(DescribeGroupsRequest => {
    group_ids : [GroupId ETT_GROUP_IDS]
});

protocol!(GroupId => {
    group_id: {hf_kafka_group_id: String, ETT_GROUP_ID}
});

// Response
protocol!(DescribeGroupsResponse => {
    throttle_time_ms/1 : {hf_kafka_throttle_time_ms: i32},
    groups: [DescribeGroupItem ETT_DESCRIBE_GROUP_ITEM]
});

protocol!(DescribeGroupItem => {
    error_code: {hf_kafka_error: i16},
    group_id: {hf_kafka_group_id: String, ETT_DESCRIBE_GROUP_GROUP_ID},
    state : {haf_kafka_describe_group_state : String, ETT_DESCRIBE_GROUP_STATE},
    protocol_type : {hf_kafka_describe_group_protocol_type: String, ETT_DESCRIBE_GROUP_PROTOCOL_TYPE},
    protocol : {hf_kafka_describe_group_protocol: String, ETT_DESCRIBE_GROUP_PROTOCOL},
    members : [DescribeGroupsMembers ETT_DESCRIBE_GROUPS_MEMBERS]
});

protocol!(DescribeGroupsMembers => {
    member_id: {hf_kafka_member_id: String, ETT_MEMBER_ID},
    client_id : {hf_kafka_client_id : String, ETT_DESCRIBE_MEMBER_CLIENT_ID},
    client_host : {hf_kafka_client_host : String, ETT_DESCRIBE_MEMBER_CLIENT_HOST},
    member_metadata : { dissect_bytes(hf_kafka_member_metadata) },
    member_assignment : { dissect_bytes(hf_kafka_member_assignment) }
});

//
// ApiKey 16 (ListGroups)
//
protocol!(ListGroupsResponse => {
    throttle_time_ms/1 : {hf_kafka_throttle_time_ms: i32},
    error_code: {hf_kafka_error: i16},
    groups : [ListGroupsGroup ETT_LIST_GROUPS_GROUPS]
});

protocol!(ListGroupsGroup => {
    group_id: {hf_kafka_group_id: String, ETT_DESCRIBE_GROUP_GROUP_ID},
    protocol : {hf_kafka_describe_group_protocol: String, ETT_DESCRIBE_GROUP_PROTOCOL}
});

//
// ApiKey 17 (SaslHandshake)
//
protocol!(SaslHandshakeRequest => {
    mechanism : {hf_kafka_sasl_mechanism : String, ETT_SASL_HANDSHAKE_REQUEST_MECHANISM}
});

// Response

protocol!(SaslHandshakeResponse => {
    error_code: {hf_kafka_error: i16},
    enabled_mechanism : [SaslHandshakeEnabledMechanism ETT_SASL_HANDSHAKE_REQUEST_ENABLED_MECHANISMS]
});

protocol!(SaslHandshakeEnabledMechanism => {
    enabled_mechanism : {hf_kafka_sasl_enabled_mechanism : String, ETT_SASL_HANDSHAKE_REQUEST_ENABLED_MECHANISM}
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

//
// ApiKey 19 (CreateTopicRequest)
//
protocol!(CreateTopicRequest => {
    create_topic_requests : [CreateTopicRequestItem ETT_CREATE_TOPIC_REQUEST],
    timeout : {hf_kafka_timeout : i32},
    validate_only/1 :{hf_kafka_create_topic_validate_only : bool}
});

protocol!(CreateTopicRequestItem => {
    topic : {hf_kafka_topic_name : String, ETT_CREATE_TOPIC_REQUEST_TOPIC},
    num_partitions : {hf_kafka_create_topic_num_partitions : i32},
    replication_factor : {hf_kafka_create_topic_replication_factor : i16},
    replica_assignments : [CreateTopicReplicaAssignment ETT_REPLICA_ASSIGNMENT],
    config_entries : [CreateTopicsConfig ETT_CREATE_TOPIC_CONFIG]
});

protocol!(CreateTopicReplicaAssignment => {
    partition : {hf_kafka_partition : i32},
    replicas : [CreateTopicReplica ETT_CREATE_TOPIC_REPLICAS]
});

protocol!(CreateTopicReplica => {
    replicas : {hf_kafka_create_topic_replicas : i32}
});

protocol!(CreateTopicsConfig => {
    config_name : {hf_kafka_create_topic_config_name : String, ETT_CREATE_TOPIC_CONFIG_NAME},
    config_value : {hf_kafka_create_topic_config_value : String, ETT_CREATE_TOPIC_CONFIG_VALUE}
});

// Response
protocol!(CreateTopicResponse => {
    throttle_time_ms/2 : {hf_kafka_throttle_time_ms: i32},
    topic_error : [CreateTopicError ETT_CREATE_TOPIC_ERROR]
});

protocol!(CreateTopicError => {
    topic : {hf_kafka_topic_name : String, ETT_CREATE_TOPIC_REQUEST_TOPIC},
    error_code: {hf_kafka_error: i16},
    error_message/1 : {hf_kafka_error_message : String, ETT_CREATE_TOPIC_ERROR_MESSAGE}
});

//
// ApiKey 20 (DeleteTopics)
//
protocol!(DeleteTopicsRequest => {
    topics : [DeleteTopicsTopic ETT_DELETE_TOPICS_REQUEST_TOPICS],
    timeout : {hf_kafka_timeout : i32}
});

protocol!(DeleteTopicsTopic => {
    topic : {hf_kafka_topic_name : String, ETT_DELETE_TOPICS_REQUEST_TOPIC}
});

// Response
protocol!(DeleteTopicsResponse => {
    throttle_time_ms/1 : {hf_kafka_throttle_time_ms: i32},
    topic_error_codes : [DeleteTopicsErrorCode ETT_DELETE_TOPICS_ERROR_CODES]
});

protocol!(DeleteTopicsErrorCode => {
    topic : {hf_kafka_topic_name : String, ETT_DELETE_TOPICS_RESPONSE_TOPIC},
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 21 (DeleteRecords)
//
protocol!(DeleteRecordsRequest => {
    topics : [DeleteRecordsTopic ETT_DELETE_RECORDS_REQUEST_TOPICS],
    timeout : {hf_kafka_timeout : i32}
});

protocol!(DeleteRecordsTopic => {
    topic : {hf_kafka_topic_name : String, ETT_DELETE_RECORDS_REQUEST_TOPIC},
    partitions : [DeleteRecordsRequestPartition ETT_DELETE_RECORDS_REQUEST_PARTITIONS]
});

protocol!(DeleteRecordsRequestPartition => {
    partition : {hf_kafka_partition : i32},
    offset : {hf_kafka_offset : i64}
});

// Response
protocol!(DeleteRecordsResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    topics : [DeleteRecordsResponseTopic ETT_DELETE_RECORDS_RESPONSE_TOPICS]
});

protocol!(DeleteRecordsResponseTopic => {
    topic : {hf_kafka_topic_name : String, ETT_DELETE_RECORDS_RESPONSE_TOPIC},
    partitions : [DeleteRecordsResponsePartition ETT_DELETE_RECORDS_RESPONSE_PARTITIONS]
});

protocol!(DeleteRecordsResponsePartition => {
    partition : {hf_kafka_partition : i32},
    low_watermark : {hf_kafka_offset : i64},
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 22 (InitProducerId)
//
protocol!(InitProducerIdRequest => {
    transactional_id : {hf_kafka_transactional_id : String, ETT_INIT_PRODUCER_ID_TRANSACTIONAL_ID},
    transaction_timeout_ms : {hf_kafka_transaction_timeout_ms : i32}
});

protocol!(InitProducerIdResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    error_code: {hf_kafka_error: i16},
    producer_id : {hf_kafka_producer_id : i64},
    producer_epoch : {hf_kafka_producer_epoch : i16}
});

//
// ApiKey 23 (OffsetForLeaderEpoch)
//
protocol!(OffsetForLeaderEpoch => {
    topics : [OffsetForLeaderEpochTopic ETT_OFFSET_FOR_LEADER_EPOCH_TOPICS]
});

protocol!(OffsetForLeaderEpochTopic => {
    topic : {hf_kafka_topic_name : String, ETT_OFFSET_FOR_LEADER_EPOCH_TOPIC},
    partitions : [OffsetForLeaderEpochPartition ETT_OFFSET_FOR_LEADER_EPOCH]
});

protocol!(OffsetForLeaderEpochPartition => {
    partition : {hf_kafka_partition : i32},
    current_leader_epoch/1 : {hf_kafka_offset_for_leader_epoch_current_epoch : i32},
    leader_epoch : {hf_kafka_offset_for_leader_epoch_epoch : i32}
});

// Response
protocol!(OffsetForLeaderEpochResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    topics : [OffsetForLeaderEpochResponseTopic ETT_OFFSET_FOR_LEADER_EPOCH_RESPONSE_TOPICS]
});

protocol!(OffsetForLeaderEpochResponseTopic => {
    topic : {hf_kafka_topic_name : String, ETT_OFFSET_FOR_LEADER_EPOCH_RESPONSE_TOPIC},
    partitions : [OffsetForLeaderEpochResponsePartition ETT_OFFSET_FOR_LEADER_EPOCH_RESPONSE_PARTITIONS]
});

protocol!(OffsetForLeaderEpochResponsePartition => {
    error_code: {hf_kafka_error: i16},
    partition : {hf_kafka_partition : i32},
    leader_epoch/1 : {hf_kafka_offset_for_leader_epoch_epoch : i32},
    end_offset : {hf_kafka_offset : i64}
});

//
// ApiKey 24 (AddPartitionsToTxn)
//
protocol!(AddPartitionsToTxnRequests => {
    transactional_id : {hf_kafka_transactional_id : String, ETT_ADD_PARTITIONS_TO_TXN_REQUEST_TRANSACTIONAL_ID},
    producer_id : {hf_kafka_producer_id : i64},
    producer_epoch : {hf_kafka_producer_epoch : i16},
    topics : [AddPartitionsToTxnRequestTopic ETT_ADD_PARTITIONS_TO_TXN_REQUEST_TOPICS]
});

protocol!(AddPartitionsToTxnRequestTopic => {
    topic : {hf_kafka_topic_name : String, ETT_ADD_PARTITIONS_TO_TXN_REQUEST_TOPIC},
    partitions : [AddPartitionsToTxnRequestPartition ETT_ADDPARTITIONSTOTXNREQUESTTOPIC]
});

protocol!(AddPartitionsToTxnRequestPartition => {
    partition : {hf_kafka_partition : i32}
});

// Response
protocol!(AddPartitionsToTxnResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    errors : [AddPartitionsToTxnResponseError ETT_ADDPARTITIONSTOTXNRESPONSEERRORS]
});

protocol!(AddPartitionsToTxnResponseError => {
    topic : {hf_kafka_topic_name : String, ETT_ADDPARTITIONSTOTXNRESPONSEERROR_TOPIC},
    partition_errors : [AddPartitionsToTxnResponsePartitionError ETT_ADDPARTITIONSTOTXNRESPONSEPARTITIONERRORS]
});

protocol!(AddPartitionsToTxnResponsePartitionError => {
    partition : {hf_kafka_partition : i32},
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 25 (AddOffsetsToTxn)
//
protocol!(AddOffsetsToTxnRequest => {
    transactional_id : {hf_kafka_transactional_id : String, ETT_ADDOFFSETSTOTXNREQUEST_TRANSACTIONAL_ID},
    producer_id : {hf_kafka_producer_id : i64},
    producer_epoch : {hf_kafka_producer_epoch : i16},
    group_id : {hf_kafka_group_id : String, ETT_ADDOFFSETSTOTXNREQUEST_GROUP_ID}
});

protocol!(AddOffsetsToTxnResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 26 (EndTxn)
//
protocol!(EndTxnRequest => {
    transactional_id : {hf_kafka_transactional_id : String, ETT_ADDOFFSETSTOTXNREQUEST_TRANSACTIONAL_ID},
    producer_id : {hf_kafka_producer_id : i64},
    producer_epoch : {hf_kafka_producer_epoch : i16},
    transaction_result : {hf_kafka_transaction_result : bool}
});

protocol!(EndTxnResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 27 (WriteTxnMarkers)
//
protocol!(WriteTxnMarkersRequest => {
    transaction_markers : [WriteTxnMarkersRequestTransactionMarkers ETT_WRITETXNMARKERS_TRANSACTION_MARKERS]
});

protocol!(WriteTxnMarkersRequestTransactionMarkers => {
    producer_id : {hf_kafka_producer_id : i64},
    producer_epoch : {hf_kafka_producer_epoch : i16},
    transaction_result : {hf_kafka_transaction_result : bool},
    topics : [WriteTxnMarkersRequestTopic ETT_WRITETXNMARKERSREQUEST_TOPICS],
    coordinator_epach : {hf_kafka_coordinator_epoch : i32}
});

protocol!(WriteTxnMarkersRequestTopic => {
    topic : {hf_kafka_topic_name : String, ETT_WRITETXNMARKERSREQUESTTOPIC_TOPIC},
    partitions : [WriteTxnMarkersRequestTopicPartition ETT_WRITETXNMARKERSREQUESTTOPICPARTITIONS]
});

protocol!(WriteTxnMarkersRequestTopicPartition => {
    partition : {hf_kafka_partition : i32}
});

// Response

protocol!(WriteTxnMarkersResponse => {
    transaction_markers : [WriteTxnMarkersResponseTxMarker ETT_WRITETXNMARKERSRESPONSE_TXMARKERS]
});

protocol!(WriteTxnMarkersResponseTxMarker => {
    producer_id : {hf_kafka_producer_id : i64},
    topics : [WriteTxnMarkersResponseTopic ETT_WRITETXNMARKERSRESPONSE_TOPIC]
});

protocol!(WriteTxnMarkersResponseTopic => {
    topic : {hf_kafka_topic_name : String, ETT_WRITETXNMARKERSRESPONSETOPICS_TOPICS},
    partitions : [WriteTxnMarkersResponseTopicPartition ETT_WRITETXNMARKERSRESPONSETOPIC_PARTITIONS]
});

protocol!(WriteTxnMarkersResponseTopicPartition => {
    partition : {hf_kafka_partition : i32},
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 28 (TxnOffsetCommit)
//
protocol!(TxnOffsetCommitRequest => {
    transactional_id : {hf_kafka_transactional_id: String, ETT_TRANSACTIONAL_ID},
    group_id : {hf_kafka_group_id : String, ETT_TXNOFFSETCOMMITREQUEST_GROUP_ID},
    producer_id : {hf_kafka_producer_id : i64},
    producer_epoch : {hf_kafka_producer_epoch : i16},
    topics : [TxnOffsetCommitRequestTopic ETT_TXNOFFSETCOMMITREQUEST_TOPIC]
});

protocol!(TxnOffsetCommitRequestTopic => {
    topic : {hf_kafka_topic_name : String, ETT_TXNOFFSETCOMMITREQUESTTOPIC_TOPICS},
    partitions : [TxnOffsetCommitRequestTopicPartition ETT_TXNOFFSETCOMMITREQUESTTOPIC_PARTITIONS]
});

protocol!(TxnOffsetCommitRequestTopicPartition => {
    partition : {hf_kafka_partition : i32},
    offset : {hf_kafka_offset : i64},
    leader_epoch/2 : {hf_kafka_leader_epoch : i32},
    metadata : {hf_kafka_offset : String, ETT_TXNOFFSETCOMMITREQUESTTOPICPARTITION_METADATA}
});

// Response
protocol!(TxnOffsetCommitResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    topics : [TxnOffsetCommitResponseTopic ETT_TXNOFFSETCOMMITRESPONSE_TOPICS]
});

protocol!(TxnOffsetCommitResponseTopic => {
    topic : {hf_kafka_topic_name : String, ETT_TXNOFFSETCOMMITRESPONSETOPIC_TOPICS},
    partitions : [TxnOffsetCommitResponsePartition ETT_TXNOFFSETCOMMITRESPONSE_PARTITIONS]
});

protocol!(TxnOffsetCommitResponsePartition => {
    partition : {hf_kafka_partition : i32},
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 29 (DescribeAcls)
protocol!(DescribeAclsRequest => {
    resource_type : {hf_kafka_resource_type : u8 },
    resource_name : {hf_kafka_resource_name : String, ETT_DESCRIBEACLSREQUEST_RESOURCE_NAME},
    // Probably PatterType?
    // https://github.com/apache/kafka/blob/c758122ce59674ec3e33618d896e4e5cdbb45e87/clients/src/main/java/org/apache/kafka/common/resource/PatternType.java#L32
    resource_pattern_type_filter/1 : {hf_kafka_resource_pattern_type_filter : u8},
    principal : {hf_kafka_principal : String, ETT_DESCRIBEACLSREQUEST_PRINCIPAL},
    host : {hf_kafka_host : String, ETT_DESCRIBEACLSREQUEST_HOST},
    operation : {hf_kafka_acl_operation : u8},
    permission_type : {hf_kafka_acl_permission_type : u8}
});

// Response
protocol!(DescribeAclsResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    error_code: {hf_kafka_error: i16},
    error_message/1 : {hf_kafka_error_message : String, ETT_DESCRIBEACLSRESPONSE_ERROR_MESSAGE},
    resources : [DescribeAclsResponseResource ETT_DESCRIBEACLSRESPONSE_RESOURCES]
});

protocol!(DescribeAclsResponseResource => {
    resource_type : {hf_kafka_resource_type : u8 },
    resource_name : {hf_kafka_resource_name : String, ETT_DESCRIBEACLSRESPONSE_RESOURCE_NAME},
    resource_pattern_type/1 : {hf_kafka_resource_pattern_type : u8},
    acls : [DescribeAclsResponseAcl ETT_DESCRIBEACLSRESPONSERESOURCE_ACLS]
});

protocol!(DescribeAclsResponseAcl => {
    principal : {hf_kafka_principal : String, ETT_DESCRIBEACLSRESPONSEACL_PRINCIPAL},
    host : {hf_kafka_host : String, ETT_DESCRIBEACLSRESPONSEACL_HOST},
    operation : {hf_kafka_acl_operation : u8},
    permission_type : {hf_kafka_acl_permission_type : u8}
});

//
// ApiKey 30 (CreateAcls)
//
protocol!(CreateAclsRequest => {
    creations : [CreateAclsRequestCreation ETT_CREATEACLSREQUEST_CREATIONS]
});

protocol!(CreateAclsRequestCreation => {
    resource_type : {hf_kafka_resource_type : u8 },
    resource_name : {hf_kafka_resource_name : String, ETT_DESCRIBEACLSRESPONSE_RESOURCE_NAME},
    resource_pattern_type/1 : {hf_kafka_resource_pattern_type : u8},
    principal : {hf_kafka_principal : String, ETT_DESCRIBEACLSRESPONSEACL_PRINCIPAL},
    host : {hf_kafka_host : String, ETT_DESCRIBEACLSRESPONSEACL_HOST},
    operation : {hf_kafka_acl_operation : u8},
    permission_type : {hf_kafka_acl_permission_type : u8}
});

// Response
protocol!(CreateAclsResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    creation_responses : [CreateAclsResponseCreationResponse ETT_CREATEACLSRESPONSE_CREATIONRESPONSE]
});

protocol!(CreateAclsResponseCreationResponse => {
    error_code: {hf_kafka_error: i16},
    error_message : {hf_kafka_error_message : String, ETT_CREATEACLSRESPONSECREATIONRESPONSE_ERROR_MESSAGE}
});

//
// ApiKey 31 (DeleteAcls)
//
protocol!(DeleteAclsRequest => {
    filters : [DeleteAclsRequestFilter ETT_DELETEACLSREQUEST_FILTERS]
});

protocol!(DeleteAclsRequestFilter => {
    resource_type : {hf_kafka_resource_type : u8 },
    resource_name : {hf_kafka_resource_name : String, ETT_DESCRIBEACLSRESPONSE_RESOURCE_NAME},
    resource_pattern_type_filter/1 : {hf_kafka_resource_pattern_type_filter : u8},
    principal : {hf_kafka_principal : String, ETT_DESCRIBEACLSRESPONSEACL_PRINCIPAL},
    host : {hf_kafka_host : String, ETT_DESCRIBEACLSRESPONSEACL_HOST},
    operation : {hf_kafka_acl_operation : u8},
    permission_type : {hf_kafka_acl_permission_type : u8}
});

// Response
protocol!(DeleteAclsResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    filter_responses : [DeleteAclsResponseFilterResponse ETT_DELETEACLSRESPONSE_FILTER_RESPONSE]
});

protocol!(DeleteAclsResponseFilterResponse => {
    error_code: {hf_kafka_error: i16},
    error_message : {hf_kafka_error_message : String, ETT_DELETEACLSRESPONSEFILTERRESPONSE_ERROR_MESSAGE},
    resource_type : {hf_kafka_resource_type : u8 },
    resource_name : {hf_kafka_resource_name : String, ETT_DELETEACLSRESPONSEFILTERRESPONSE_RESOURCE_NAME},
    resource_pattern_type/1 : {hf_kafka_resource_pattern_type : u8},
    principal : {hf_kafka_principal : String, ETT_DELETEACLSRESPONSEFILTERRESPONSE_PRINCIPAL},
    host : {hf_kafka_host : String, ETT_DELETEACLSRESPONSEFILTERRESPONSE_HOST},
    operation : {hf_kafka_acl_operation : u8},
    permission_type : {hf_kafka_acl_permission_type : u8}
});

//
// ApiKey 32 (DescribeConfigs)
//
protocol!(DescribeConfigsRequest => {
    resources : [DescribeConfigsRequestResource ETT_DESCRIBECONFIGSREQUESTRESOURCES],
    include_synonyms/1 : {hf_kafka_include_synonymous : bool}
});

protocol!(DescribeConfigsRequestResource => {
    resource_type : {hf_kafka_resource_type : u8 },
    resource_name : {hf_kafka_resource_name : String, ETT_DESCRIBECONFIGSREQUESTRESOURCE_RESOURCE_NAME},
    config_name : {hf_kafka_config_name : String, ETT_DESCRIBECONFIGSREQUESTRESOURCE_CONFIG_NAME}
});

// Response
protocol!(DescribeConfigsResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    resources : [DescribeConfigsResponseResource ETT_DESCRIBECONFIGSRESPONSE_RESOURCES]
});

protocol!(DescribeConfigsResponseResource => {
    error_code: {hf_kafka_error: i16},
    error_message : {hf_kafka_error_message : String, ETT_DESCRIBECONFIGSRESPONSERESOURCE_ERROR_MESSAGE},
    resource_type : {hf_kafka_resource_type : u8 },
    resource_name : {hf_kafka_resource_name : String, ETT_DESCRIBECONFIGSRESPONSERESOURCE_RESOURCE_NAME},
    config_entries : [DescribeConfigsResponseResourceConfigEntry ETT_DESCRIBECONFIGSRESPONSERESOURCE_CONFIG_ENTRIES]
});

protocol!(DescribeConfigsResponseResourceConfigEntry => {
    config_name : {hf_kafka_config_name : String, ETT_DESCRIBECONFIGSRESPONSERESOURCECONFIGENTRY_NAME },
    config_value : {hf_kafka_config_value : String, ETT_DESCRIBECONFIGSRESPONSERESOURCECONFIGENTRY_VALUE },
    read_only : {hf_kafka_config_read_only : bool},
    is_default/(-1) : {hf_kafka_config_is_default : bool},
    config_source/1 : {hf_kafka_config_source : u8},
    is_sensitive : {hf_kafka_config_is_sensitive : bool},
    config_synonyms/1 : [DescribeConfigsResponseSynonym ETT_DESCRIBECONFIGSRESPONSE_SYNONYMS]
});

protocol!(DescribeConfigsResponseSynonym => {
    config_name : {hf_kafka_config_name : String, ETT_DESCRIBECONFIGSRESPONSESYNONYM_NAME },
    config_value : {hf_kafka_config_value : String, ETT_DESCRIBECONFIGSRESPONSESYNONYM_VALUE },
    config_source : {hf_kafka_config_source : u8}
});

//
// ApiKey 33 (AlterConfigs)
//
protocol!(AlterConfigsRequest => {
    resources : [AlterConfigsRequestResource ETT_ALTERCONFIGSREQUEST_RESOURCES],
    validate_only : {hf_kafka_config_validate_only : bool}
});

protocol!(AlterConfigsRequestResource => {
    resource_type : {hf_kafka_resource_type : u8 },
    resource_name : {hf_kafka_resource_name : String, ETT_DESCRIBECONFIGSRESPONSERESOURCE_RESOURCE_NAME},
    config_entries : [AlterConfigsRequestConfigEntry ETT_ALTERCONFIGSREQUEST_CONFIG_ENTRY]
});

protocol!(AlterConfigsRequestConfigEntry => {
    config_name : {hf_kafka_config_name : String, ETT_ALTERCONFIGSREQUESTCONFIGENTRY_NAME },
    config_value : {hf_kafka_config_value : String, ETT_ALTERCONFIGSREQUESTCONFIGENTRY_VALUE }
});

// Response
protocol!(AlterConfigsResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    resources : [AlterConfigsResponseResource ETT_ALTERCONFIGSRESPONSE_RESOURCES]
});

protocol!(AlterConfigsResponseResource => {
    error_code: {hf_kafka_error: i16},
    error_message : {hf_kafka_error_message : String, ETT_ALTERCONFIGSRESPONSERESOURCE_ERROR_MESSAGE},
    resource_type : {hf_kafka_resource_type : u8 },
    resource_name : {hf_kafka_resource_name : String, ETT_ALTERCONFIGSRESPONSERESOURCE_RESOURCE_NAME}
});

//
// ApiKey 34 (AlterReplicaLogDirs)
//
protocol!(AlterReplicaLogDirsRequest => {
    log_dirs : [AlterReplicaLogDirsRequestItem ETT_ALTERREPLICALOGDIRSREQUEST_ITEMS]
});

protocol!(AlterReplicaLogDirsRequestItem => {
    log_dir : {hf_kafka_log_dir : String, ETT_ALTERREPLICALOGDIRSREQUESTITEM_LOG_DIR},
    topics : [AlterReplicaLogDirsRequestItemTopic ETT_ALTERREPLICALOGDIRSREQUESTITEM_TOPICS]
});

protocol!(AlterReplicaLogDirsRequestItemTopic => {
    topic : {hf_kafka_topic_name : String, ETT_ALTERREPLICALOGDIRSREQUESTITEMTOPIC_TOPIC},
    partitions : [AlterReplicaLogDirsRequestItemTopicPartition ETT_ALTERREPLICALOGDIRSREQUESTITEMTOPIC_PARTITIONS]
});

protocol!(AlterReplicaLogDirsRequestItemTopicPartition => {
    partition : {hf_kafka_partition : i32}
});

// Response
protocol!(AlterReplicaLogDirsResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    topics : [AlterReplicaLogDirsResponseTopic ETT_ALTERREPLICALOGDIRSRESPONSE_TOPICS]
});

protocol!(AlterReplicaLogDirsResponseTopic => {
    topic : {hf_kafka_topic_name : String, ETT_ALTERREPLICALOGDIRSRESPONSETOPIC_TOPICS},
    partitions : [AlterReplicaLogDirsResponseTopicPartition ETT_ALTERREPLICALOGDIRSRESPONSETOPIC_PARTITIONS]
});

protocol!(AlterReplicaLogDirsResponseTopicPartition => {
    partition : {hf_kafka_partition : i32},
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 35 (DescribeLogDirs)
//
protocol!(DescribeLogDirsRequest => {
    topics : [DescribeLogDirsTopic ETT_DESCRIBELOGDIRS_TOPICS]
});

protocol!(DescribeLogDirsTopic => {
    topic : {hf_kafka_topic_name : String, ETT_DESCRIBELOGDIRSTOPIC_TOPIC},
    partitions : [DescribeLogDirsTopicPartition ETT_DESCRIBELOGDIRSTOPIC_PARTITIONS]
});

protocol!(DescribeLogDirsTopicPartition => {
    partition : {hf_kafka_partition : i32}
});

// Response
protocol!(DescribeLogDirsResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    log_dirs : [DescribeLogDirsResponseLogDir ETT_DESCRIBELOGDIRSRESPONSE_LOG_DIR]
});

protocol!(DescribeLogDirsResponseLogDir => {
    error_code: {hf_kafka_error: i16},
    log_dir : {hf_kafka_log_dir : String, ETT_DESCRIBELOGDIRSRESPONSELOGDIR_LOG_DIR},
    topics : [DescribeLogDirsResponseLogDirTopic ETT_DESCRIBELOGDIRSRESPONSELOGDIR_TOPICS]
});

protocol!(DescribeLogDirsResponseLogDirTopic => {
    topic : {hf_kafka_topic_name : String, ETT_DESCRIBELOGDIRSRESPONSELOGDIRTOPIC_TOPIC},
    partitions : [DescribeLogDirsResponseLogDirTopicPartition ETT_DESCRIBELOGDIRSRESPONSELOGDIRTOPIC_PARTITIONS]
});

protocol!(DescribeLogDirsResponseLogDirTopicPartition => {
    partition : {hf_kafka_partition : i32},
    size : {hf_kafka_log_dir_size : i64},
    offset_lag : {hf_kafka_log_dir_offset_lag : i64},
    is_future : {hf_kafka_log_dir_is_future : bool}
});

//
// ApiKey 36 (SaslAuthenticate)
//
protocol!(SaslAuthenticateRequest => {
    sasl_auth_bytes : {dissect_bytes(hf_kafka_sasl_auth_bytes)}
});

// Response
protocol!(SaslAuthenticateResponse => {
    error_code: {hf_kafka_error: i16},
    error_message : {hf_kafka_error_message : String, ETT_SASLAUTHENTICATERESPONSE_ERROR_MESSAGE},
    sasl_auth_bytes : {dissect_bytes(hf_kafka_sasl_auth_bytes)},
    session_lifetime_ms/1 : {hf_kafka_sasl_session_lifetime_ms : i64}
});

//
// ApiKey 37 (CreatePartitions)
//
protocol!(CreatePartitionsRequest => {
    topic_partitions : [CreatePartitionsRequestTopic ETT_CREATEPARTITIONSREQUEST_TOPICS],
    timeout : {hf_kafka_create_partitions_timeout : i32},
    validate_only : {hf_kafka_create_partitions_validate_only : bool}
});

protocol!(CreatePartitionsRequestTopic => {
    topic : {hf_kafka_topic_name : String, ETT_CREATEPARTITIONSREQUESTTOPIC_TOPIC},
    new_partitions_count : {hf_kafka_create_topics_count : i32},
    assignment : [CreatePartitionsRequestTopicAssignment ETT_CREATEPARTITIONSREQUESTTOPIC_ASSIGNMENTS]
});

protocol!(CreatePartitionsRequestTopicAssignment => {
    broker : {hf_kafka_create_partitions_broker : i32}
});

// Response
protocol!(CreatePartitionsResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    topic_errors : [CreatePartitionsResponseTopicError ETT_CREATEPARTITIONSRESPONSE_TOPIC_ERRORS]
});

protocol!(CreatePartitionsResponseTopicError => {
    topic : {hf_kafka_topic_name : String, ETT_CREATEPARTITIONSRESPONSETOPICERROR_TOPICS},
    error_code: {hf_kafka_error: i16},
    error_message : {hf_kafka_error_message : String, ETT_CREATEPARTITIONSRESPONSETOPICERROR_ERROR_MESSAGE}
});

//
// ApiKey 38 (CreateDelegationToken)
//
protocol!(CreateDelegationTokenRequest => {
    renewers : [CreateDelegationTokenRequestRenewer ETT_CREATEDELEGATIONTOKENREQUEST_RENEWER],
    max_life_time : {hf_kafka_delegation_token_max_life_time : i64}
});

protocol!(CreateDelegationTokenRequestRenewer => {
    principal_type : {hf_kafka_delegation_token_principal_type : String, ETT_CREATEDELEGATIONTOKENREQUESTRENEWER_PRINCIPAL_TYPE},
    name : {hf_kafka_delegation_token_name : String, ETT_CREATEDELEGATIONTOKENREQUESTRENEWER_NAME}
});

// Response
protocol!(CreateDelegationTokenResponse => {
    error_code: {hf_kafka_error: i16},
    owner_principal_type : {hf_kafka_delegation_token_principal_type : String, ETT_CREATEDELEGATIONTOKENRESPONSE_OWNER_PRINCIPAL_TYPE},
    owner_name : {hf_kafka_delegation_token_name : String, ETT_CREATEDELEGATIONTOKENRESPONSE_OWNER_NAME},
    issue_timestamp : {hf_kafka_delegation_token_issue_timestamp : i64},
    expiry_timestamp : {hf_kafka_delegation_token_expiry_timestamp : i64},
    max_timestamp : {hf_kafka_delegation_token_max_timestamp : i64},
    token_id : {hf_kafka_delegation_token_token_id : String, ETT_CREATEDELEGATIONTOKENRESPONSE_TOKEN_ID},
    hmac : {dissect_bytes(hf_kafka_delegation_token_hmac)},
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32}
});

//
// ApiKey 39 (RenewDelegationToken)
//
protocol!(RenewDelegationTokenRequest => {
    hmac : {dissect_bytes(hf_kafka_delegation_token_hmac)},
    renew_time_period : {hf_kafka_delegation_token_renew_time_period : i64}
});

protocol!(RenewDelegationTokenResponse => {
    error_code: {hf_kafka_error: i16},
    expiry_timestamp : {hf_kafka_delegation_token_expiry_timestamp : i64},
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32}
});

//
// ApiKey 40 (ExpireDelegationToken)
//
protocol!(ExpireDelegationTokenRequest => {
    hmac : {dissect_bytes(hf_kafka_delegation_token_hmac)},
    expiry_time_period : {hf_kafka_delegation_token_expiry_time_period : i64}
});

protocol!(ExpireDelegationTokenResponse => {
    error_code: {hf_kafka_error: i16},
    expiry_timestamp : {hf_kafka_delegation_token_expiry_timestamp : i64},
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32}
});

//
// ApiKey 41 (DescribeDelegationToken)
//
protocol!(DescribeDelegationTokenRequest => {
    owners : [DescribeDelegationTokenRequestOwner ETT_DESCRIBEDELEGATIONTOKENREQUES_OWNERS]
});

protocol!(DescribeDelegationTokenRequestOwner => {
    principal_type : {hf_kafka_delegation_token_principal_type : String, ETT_DESCRIBEDELEGATIONTOKENREQUESTOWNER_PRINCIPAL_TYPE},
    name : {hf_kafka_delegation_token_name : String, ETT_DESCRIBEDELEGATIONTOKENREQUESTOWNER_NAME}
});

// Response
protocol!(DescribeDelegationTokenResponse => {
    error_code: {hf_kafka_error: i16},
    token_details : [DescribeDelegationTokenResponseTokenDetail ETT_DESCRIBEDELEGATIONTOKENRESPONSE_TOKEN_DETAILS],
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32}
});

protocol!(DescribeDelegationTokenResponseTokenDetail => {
    principal_type : {hf_kafka_delegation_token_principal_type : String, ETT_DESCRIBEDELEGATIONTOKENREQUESTOWNER_PRINCIPAL_TYPE},
    name : {hf_kafka_delegation_token_name : String, ETT_DESCRIBEDELEGATIONTOKENREQUESTOWNER_NAME},
    issue_timestamp : {hf_kafka_delegation_token_issue_timestamp : i64},
    expiry_timestamp : {hf_kafka_delegation_token_expiry_timestamp : i64},
    max_timestamp : {hf_kafka_delegation_token_max_timestamp : i64},
    token_id : {hf_kafka_delegation_token_token_id : String, ETT_DESCRIBEDELEGATIONTOKENRESPONSETOKENDETAIL_TOKEN_ID},
    hmac : {dissect_bytes(hf_kafka_delegation_token_hmac)},
    renewers : [DescribeDelegationTokenResponseTokenDetailRenewer ETT_DESCRIBEDELEGATIONTOKENRESPONSETOKENDETAIL_RENEWERS]
});

protocol!(DescribeDelegationTokenResponseTokenDetailRenewer => {
    principal_type : {hf_kafka_delegation_token_principal_type : String, ETT_DESCRIBEDELEGATIONTOKENRESPONSETOKENDETAILRENEWER_PRINCIPAL_TYPE},
    name : {hf_kafka_delegation_token_name : String, ETT_DESCRIBEDELEGATIONTOKENRESPONSETOKENDETAILRENEWER_NAME}
});

//
// ApiKey 42 (DeleteGroups)
//
protocol!(DeleteGroupsRequest => {
    groups : [DeleteGroupsGroup ETT_DELETEGROUPS_GROUPS]
});

protocol!(DeleteGroupsGroup => {
    group : {hf_kafka_group_id : String, ETT_DELETEGROUPSGROUP_GROUP}
});

// Response
protocol!(DeleteGroupsResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    group_error_codes : [DeleteGroupsResponseErrorCode ETT_DELETEGROUPSRESPONSE_ERROR_CODES]
});

protocol!(DeleteGroupsResponseErrorCode => {
    group_id : {hf_kafka_group_id : String, ETT_DELETEGROUPSRESPONSEERRORCODE_GROUP_ID},
    error_code: {hf_kafka_error: i16}
});

//
// ApiKey 43 (ElectPreferredLeaders)
//
protocol!(ElectPreferredLeadersRequest => {
    topic_partitions : [ElectPreferredLeadersRequestTopic ETT_ELECTPREFERREDLEADERSREQUEST_TOPICS],
    timeout_ms : {hf_kafka_timeout : i32}
});

protocol!(ElectPreferredLeadersRequestTopic => {
    topic : {hf_kafka_topic_name : String, ETT_ELECTPREFERREDLEADERSREQUESTTOPIC_TOPIC},
    partitions : [ElectPreferredLeadersRequestTopicPartition ETT_ELECTPREFERREDLEADERSREQUESTTOPICPARTITIONS]
});

protocol!(ElectPreferredLeadersRequestTopicPartition => {
    partition : {hf_kafka_partition : i32}
});

// Response
protocol!(ElectPreferredLeadersResponse => {
    throttle_time_ms : {hf_kafka_throttle_time_ms: i32},
    replica_election_results : [ElectPreferredLeadersResponseReplicaElectionResult ETT_ELECTPREFERREDLEADERSRESPONSE_REPLICA_ELECTION_RESULTS]
});

protocol!(ElectPreferredLeadersResponseReplicaElectionResult => {
    topic : {hf_kafka_topic_name : String, ETT_ELECTPREFERREDLEADERSRESPONSEREPLICAELECTIONRESULT_TOPIC},
    partition_results : [ElectPreferredLeadersResponsePartitionResult ETT_ELECTPREFERREDLEADERSRESPONSE_PARTITION_RESULTS]
});

protocol!(ElectPreferredLeadersResponsePartitionResult => {
    partition_id : {hf_kafka_partition : i32},
    error_code: {hf_kafka_error: i16},
    error_message : {hf_kafka_error_message : String, ETT_ELECTPREFERREDLEADERSRESPONSEPARTITIONRESULT_ERROR_MESSAGE}
});