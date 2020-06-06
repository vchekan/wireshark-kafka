cat > ProduceRequest.txt <<EOF
acks timeout [topic_data]
  acks => INT16
  timeout => INT32
  topic_data => topic [data]
    topic => STRING
    data => partition record_set
      partition => INT32
      record_set => RECORDS


EOF
git add ProduceRequest.txt && git commit -m "ProduceRequest v0"

cat > ProduceRequest.txt <<EOF
acks timeout [topic_data]
  acks => INT16
  timeout => INT32
  topic_data => topic [data]
    topic => STRING
    data => partition record_set
      partition => INT32
      record_set => RECORDS


EOF
git add ProduceRequest.txt && git commit -m "ProduceRequest v1"

cat > ProduceRequest.txt <<EOF
acks timeout [topic_data]
  acks => INT16
  timeout => INT32
  topic_data => topic [data]
    topic => STRING
    data => partition record_set
      partition => INT32
      record_set => RECORDS


EOF
git add ProduceRequest.txt && git commit -m "ProduceRequest v2"

cat > ProduceRequest.txt <<EOF
transactional_id acks timeout [topic_data]
  transactional_id => NULLABLE_STRING
  acks => INT16
  timeout => INT32
  topic_data => topic [data]
    topic => STRING
    data => partition record_set
      partition => INT32
      record_set => RECORDS


EOF
git add ProduceRequest.txt && git commit -m "ProduceRequest v3"

cat > ProduceRequest.txt <<EOF
transactional_id acks timeout [topic_data]
  transactional_id => NULLABLE_STRING
  acks => INT16
  timeout => INT32
  topic_data => topic [data]
    topic => STRING
    data => partition record_set
      partition => INT32
      record_set => RECORDS


EOF
git add ProduceRequest.txt && git commit -m "ProduceRequest v4"

cat > ProduceRequest.txt <<EOF
transactional_id acks timeout [topic_data]
  transactional_id => NULLABLE_STRING
  acks => INT16
  timeout => INT32
  topic_data => topic [data]
    topic => STRING
    data => partition record_set
      partition => INT32
      record_set => RECORDS


EOF
git add ProduceRequest.txt && git commit -m "ProduceRequest v5"

cat > ProduceRequest.txt <<EOF
transactional_id acks timeout [topic_data]
  transactional_id => NULLABLE_STRING
  acks => INT16
  timeout => INT32
  topic_data => topic [data]
    topic => STRING
    data => partition record_set
      partition => INT32
      record_set => RECORDS


EOF
git add ProduceRequest.txt && git commit -m "ProduceRequest v6"

cat > ProduceRequest.txt <<EOF
transactional_id acks timeout [topic_data]
  transactional_id => NULLABLE_STRING
  acks => INT16
  timeout => INT32
  topic_data => topic [data]
    topic => STRING
    data => partition record_set
      partition => INT32
      record_set => RECORDS


EOF
git add ProduceRequest.txt && git commit -m "ProduceRequest v7"

cat > ProduceResponse.txt <<EOF
[responses]
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code base_offset
      partition => INT32
      error_code => INT16
      base_offset => INT64


EOF
git add ProduceResponse.txt && git commit -m "ProduceResponse v0"

cat > ProduceResponse.txt <<EOF
[responses] throttle_time_ms
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code base_offset
      partition => INT32
      error_code => INT16
      base_offset => INT64
  throttle_time_ms => INT32


EOF
git add ProduceResponse.txt && git commit -m "ProduceResponse v1"

cat > ProduceResponse.txt <<EOF
[responses] throttle_time_ms
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code base_offset log_append_time
      partition => INT32
      error_code => INT16
      base_offset => INT64
      log_append_time => INT64
  throttle_time_ms => INT32


EOF
git add ProduceResponse.txt && git commit -m "ProduceResponse v2"

cat > ProduceResponse.txt <<EOF
[responses] throttle_time_ms
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code base_offset log_append_time
      partition => INT32
      error_code => INT16
      base_offset => INT64
      log_append_time => INT64
  throttle_time_ms => INT32


EOF
git add ProduceResponse.txt && git commit -m "ProduceResponse v3"

cat > ProduceResponse.txt <<EOF
[responses] throttle_time_ms
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code base_offset log_append_time
      partition => INT32
      error_code => INT16
      base_offset => INT64
      log_append_time => INT64
  throttle_time_ms => INT32


EOF
git add ProduceResponse.txt && git commit -m "ProduceResponse v4"

cat > ProduceResponse.txt <<EOF
[responses] throttle_time_ms
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code base_offset log_append_time log_start_offset
      partition => INT32
      error_code => INT16
      base_offset => INT64
      log_append_time => INT64
      log_start_offset => INT64
  throttle_time_ms => INT32


EOF
git add ProduceResponse.txt && git commit -m "ProduceResponse v5"

cat > ProduceResponse.txt <<EOF
[responses] throttle_time_ms
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code base_offset log_append_time log_start_offset
      partition => INT32
      error_code => INT16
      base_offset => INT64
      log_append_time => INT64
      log_start_offset => INT64
  throttle_time_ms => INT32


EOF
git add ProduceResponse.txt && git commit -m "ProduceResponse v6"

cat > ProduceResponse.txt <<EOF
[responses] throttle_time_ms
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code base_offset log_append_time log_start_offset
      partition => INT32
      error_code => INT16
      base_offset => INT64
      log_append_time => INT64
      log_start_offset => INT64
  throttle_time_ms => INT32


EOF
git add ProduceResponse.txt && git commit -m "ProduceResponse v7"

cat > FetchRequest.txt <<EOF
replica_id max_wait_time min_bytes [topics]
  replica_id => INT32
  max_wait_time => INT32
  min_bytes => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition fetch_offset partition_max_bytes
      partition => INT32
      fetch_offset => INT64
      partition_max_bytes => INT32


EOF
git add FetchRequest.txt && git commit -m "FetchRequest v0"

cat > FetchRequest.txt <<EOF
replica_id max_wait_time min_bytes [topics]
  replica_id => INT32
  max_wait_time => INT32
  min_bytes => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition fetch_offset partition_max_bytes
      partition => INT32
      fetch_offset => INT64
      partition_max_bytes => INT32


EOF
git add FetchRequest.txt && git commit -m "FetchRequest v1"

cat > FetchRequest.txt <<EOF
replica_id max_wait_time min_bytes [topics]
  replica_id => INT32
  max_wait_time => INT32
  min_bytes => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition fetch_offset partition_max_bytes
      partition => INT32
      fetch_offset => INT64
      partition_max_bytes => INT32


EOF
git add FetchRequest.txt && git commit -m "FetchRequest v2"

cat > FetchRequest.txt <<EOF
replica_id max_wait_time min_bytes max_bytes [topics]
  replica_id => INT32
  max_wait_time => INT32
  min_bytes => INT32
  max_bytes => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition fetch_offset partition_max_bytes
      partition => INT32
      fetch_offset => INT64
      partition_max_bytes => INT32


EOF
git add FetchRequest.txt && git commit -m "FetchRequest v3"

cat > FetchRequest.txt <<EOF
replica_id max_wait_time min_bytes max_bytes isolation_level [topics]
  replica_id => INT32
  max_wait_time => INT32
  min_bytes => INT32
  max_bytes => INT32
  isolation_level => INT8
  topics => topic [partitions]
    topic => STRING
    partitions => partition fetch_offset partition_max_bytes
      partition => INT32
      fetch_offset => INT64
      partition_max_bytes => INT32


EOF
git add FetchRequest.txt && git commit -m "FetchRequest v4"

cat > FetchRequest.txt <<EOF
replica_id max_wait_time min_bytes max_bytes isolation_level [topics]
  replica_id => INT32
  max_wait_time => INT32
  min_bytes => INT32
  max_bytes => INT32
  isolation_level => INT8
  topics => topic [partitions]
    topic => STRING
    partitions => partition fetch_offset log_start_offset partition_max_bytes
      partition => INT32
      fetch_offset => INT64
      log_start_offset => INT64
      partition_max_bytes => INT32


EOF
git add FetchRequest.txt && git commit -m "FetchRequest v5"

cat > FetchRequest.txt <<EOF
replica_id max_wait_time min_bytes max_bytes isolation_level [topics]
  replica_id => INT32
  max_wait_time => INT32
  min_bytes => INT32
  max_bytes => INT32
  isolation_level => INT8
  topics => topic [partitions]
    topic => STRING
    partitions => partition fetch_offset log_start_offset partition_max_bytes
      partition => INT32
      fetch_offset => INT64
      log_start_offset => INT64
      partition_max_bytes => INT32


EOF
git add FetchRequest.txt && git commit -m "FetchRequest v6"

cat > FetchRequest.txt <<EOF
replica_id max_wait_time min_bytes max_bytes isolation_level session_id session_epoch [topics] [forgotten_topics_data]
  replica_id => INT32
  max_wait_time => INT32
  min_bytes => INT32
  max_bytes => INT32
  isolation_level => INT8
  session_id => INT32
  session_epoch => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition fetch_offset log_start_offset partition_max_bytes
      partition => INT32
      fetch_offset => INT64
      log_start_offset => INT64
      partition_max_bytes => INT32
  forgotten_topics_data => topic [partitions]
    topic => STRING
    partitions => INT32


EOF
git add FetchRequest.txt && git commit -m "FetchRequest v7"

cat > FetchRequest.txt <<EOF
replica_id max_wait_time min_bytes max_bytes isolation_level session_id session_epoch [topics] [forgotten_topics_data]
  replica_id => INT32
  max_wait_time => INT32
  min_bytes => INT32
  max_bytes => INT32
  isolation_level => INT8
  session_id => INT32
  session_epoch => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition fetch_offset log_start_offset partition_max_bytes
      partition => INT32
      fetch_offset => INT64
      log_start_offset => INT64
      partition_max_bytes => INT32
  forgotten_topics_data => topic [partitions]
    topic => STRING
    partitions => INT32


EOF
git add FetchRequest.txt && git commit -m "FetchRequest v8"

cat > FetchRequest.txt <<EOF
replica_id max_wait_time min_bytes max_bytes isolation_level session_id session_epoch [topics] [forgotten_topics_data]
  replica_id => INT32
  max_wait_time => INT32
  min_bytes => INT32
  max_bytes => INT32
  isolation_level => INT8
  session_id => INT32
  session_epoch => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition current_leader_epoch fetch_offset log_start_offset partition_max_bytes
      partition => INT32
      current_leader_epoch => INT32
      fetch_offset => INT64
      log_start_offset => INT64
      partition_max_bytes => INT32
  forgotten_topics_data => topic [partitions]
    topic => STRING
    partitions => INT32


EOF
git add FetchRequest.txt && git commit -m "FetchRequest v9"

cat > FetchRequest.txt <<EOF
replica_id max_wait_time min_bytes max_bytes isolation_level session_id session_epoch [topics] [forgotten_topics_data]
  replica_id => INT32
  max_wait_time => INT32
  min_bytes => INT32
  max_bytes => INT32
  isolation_level => INT8
  session_id => INT32
  session_epoch => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition current_leader_epoch fetch_offset log_start_offset partition_max_bytes
      partition => INT32
      current_leader_epoch => INT32
      fetch_offset => INT64
      log_start_offset => INT64
      partition_max_bytes => INT32
  forgotten_topics_data => topic [partitions]
    topic => STRING
    partitions => INT32


EOF
git add FetchRequest.txt && git commit -m "FetchRequest v10"

cat > FetchResponse.txt <<EOF
[responses]
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition_header record_set
      partition_header => partition error_code high_watermark
        partition => INT32
        error_code => INT16
        high_watermark => INT64
      record_set => RECORDS


EOF
git add FetchResponse.txt && git commit -m "FetchResponse v0"

cat > FetchResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition_header record_set
      partition_header => partition error_code high_watermark
        partition => INT32
        error_code => INT16
        high_watermark => INT64
      record_set => RECORDS


EOF
git add FetchResponse.txt && git commit -m "FetchResponse v1"

cat > FetchResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition_header record_set
      partition_header => partition error_code high_watermark
        partition => INT32
        error_code => INT16
        high_watermark => INT64
      record_set => RECORDS


EOF
git add FetchResponse.txt && git commit -m "FetchResponse v2"

cat > FetchResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition_header record_set
      partition_header => partition error_code high_watermark
        partition => INT32
        error_code => INT16
        high_watermark => INT64
      record_set => RECORDS


EOF
git add FetchResponse.txt && git commit -m "FetchResponse v3"

cat > FetchResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition_header record_set
      partition_header => partition error_code high_watermark last_stable_offset [aborted_transactions]
        partition => INT32
        error_code => INT16
        high_watermark => INT64
        last_stable_offset => INT64
        aborted_transactions => producer_id first_offset
          producer_id => INT64
          first_offset => INT64
      record_set => RECORDS


EOF
git add FetchResponse.txt && git commit -m "FetchResponse v4"

cat > FetchResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition_header record_set
      partition_header => partition error_code high_watermark last_stable_offset log_start_offset [aborted_transactions]
        partition => INT32
        error_code => INT16
        high_watermark => INT64
        last_stable_offset => INT64
        log_start_offset => INT64
        aborted_transactions => producer_id first_offset
          producer_id => INT64
          first_offset => INT64
      record_set => RECORDS


EOF
git add FetchResponse.txt && git commit -m "FetchResponse v5"

cat > FetchResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition_header record_set
      partition_header => partition error_code high_watermark last_stable_offset log_start_offset [aborted_transactions]
        partition => INT32
        error_code => INT16
        high_watermark => INT64
        last_stable_offset => INT64
        log_start_offset => INT64
        aborted_transactions => producer_id first_offset
          producer_id => INT64
          first_offset => INT64
      record_set => RECORDS


EOF
git add FetchResponse.txt && git commit -m "FetchResponse v6"

cat > FetchResponse.txt <<EOF
throttle_time_ms error_code session_id [responses]
  throttle_time_ms => INT32
  error_code => INT16
  session_id => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition_header record_set
      partition_header => partition error_code high_watermark last_stable_offset log_start_offset [aborted_transactions]
        partition => INT32
        error_code => INT16
        high_watermark => INT64
        last_stable_offset => INT64
        log_start_offset => INT64
        aborted_transactions => producer_id first_offset
          producer_id => INT64
          first_offset => INT64
      record_set => RECORDS


EOF
git add FetchResponse.txt && git commit -m "FetchResponse v7"

cat > FetchResponse.txt <<EOF
throttle_time_ms error_code session_id [responses]
  throttle_time_ms => INT32
  error_code => INT16
  session_id => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition_header record_set
      partition_header => partition error_code high_watermark last_stable_offset log_start_offset [aborted_transactions]
        partition => INT32
        error_code => INT16
        high_watermark => INT64
        last_stable_offset => INT64
        log_start_offset => INT64
        aborted_transactions => producer_id first_offset
          producer_id => INT64
          first_offset => INT64
      record_set => RECORDS


EOF
git add FetchResponse.txt && git commit -m "FetchResponse v8"

cat > FetchResponse.txt <<EOF
throttle_time_ms error_code session_id [responses]
  throttle_time_ms => INT32
  error_code => INT16
  session_id => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition_header record_set
      partition_header => partition error_code high_watermark last_stable_offset log_start_offset [aborted_transactions]
        partition => INT32
        error_code => INT16
        high_watermark => INT64
        last_stable_offset => INT64
        log_start_offset => INT64
        aborted_transactions => producer_id first_offset
          producer_id => INT64
          first_offset => INT64
      record_set => RECORDS


EOF
git add FetchResponse.txt && git commit -m "FetchResponse v9"

cat > FetchResponse.txt <<EOF
throttle_time_ms error_code session_id [responses]
  throttle_time_ms => INT32
  error_code => INT16
  session_id => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition_header record_set
      partition_header => partition error_code high_watermark last_stable_offset log_start_offset [aborted_transactions]
        partition => INT32
        error_code => INT16
        high_watermark => INT64
        last_stable_offset => INT64
        log_start_offset => INT64
        aborted_transactions => producer_id first_offset
          producer_id => INT64
          first_offset => INT64
      record_set => RECORDS


EOF
git add FetchResponse.txt && git commit -m "FetchResponse v10"

cat > ListOffsetsRequest.txt <<EOF
replica_id [topics]
  replica_id => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition timestamp max_num_offsets
      partition => INT32
      timestamp => INT64
      max_num_offsets => INT32


EOF
git add ListOffsetsRequest.txt && git commit -m "ListOffsetsRequest v0"

cat > ListOffsetsRequest.txt <<EOF
replica_id [topics]
  replica_id => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition timestamp
      partition => INT32
      timestamp => INT64


EOF
git add ListOffsetsRequest.txt && git commit -m "ListOffsetsRequest v1"

cat > ListOffsetsRequest.txt <<EOF
replica_id isolation_level [topics]
  replica_id => INT32
  isolation_level => INT8
  topics => topic [partitions]
    topic => STRING
    partitions => partition timestamp
      partition => INT32
      timestamp => INT64


EOF
git add ListOffsetsRequest.txt && git commit -m "ListOffsetsRequest v2"

cat > ListOffsetsRequest.txt <<EOF
replica_id isolation_level [topics]
  replica_id => INT32
  isolation_level => INT8
  topics => topic [partitions]
    topic => STRING
    partitions => partition timestamp
      partition => INT32
      timestamp => INT64


EOF
git add ListOffsetsRequest.txt && git commit -m "ListOffsetsRequest v3"

cat > ListOffsetsRequest.txt <<EOF
replica_id isolation_level [topics]
  replica_id => INT32
  isolation_level => INT8
  topics => topic [partitions]
    topic => STRING
    partitions => partition current_leader_epoch timestamp
      partition => INT32
      current_leader_epoch => INT32
      timestamp => INT64


EOF
git add ListOffsetsRequest.txt && git commit -m "ListOffsetsRequest v4"

cat > ListOffsetsRequest.txt <<EOF
replica_id isolation_level [topics]
  replica_id => INT32
  isolation_level => INT8
  topics => topic [partitions]
    topic => STRING
    partitions => partition current_leader_epoch timestamp
      partition => INT32
      current_leader_epoch => INT32
      timestamp => INT64


EOF
git add ListOffsetsRequest.txt && git commit -m "ListOffsetsRequest v5"

cat > ListOffsetsResponse.txt <<EOF
[responses]
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code [offsets']
      partition => INT32
      error_code => INT16
      offsets' => INT64


EOF
git add ListOffsetsResponse.txt && git commit -m "ListOffsetsResponse v0"

cat > ListOffsetsResponse.txt <<EOF
[responses]
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code timestamp offset
      partition => INT32
      error_code => INT16
      timestamp => INT64
      offset => INT64


EOF
git add ListOffsetsResponse.txt && git commit -m "ListOffsetsResponse v1"

cat > ListOffsetsResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code timestamp offset
      partition => INT32
      error_code => INT16
      timestamp => INT64
      offset => INT64


EOF
git add ListOffsetsResponse.txt && git commit -m "ListOffsetsResponse v2"

cat > ListOffsetsResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code timestamp offset
      partition => INT32
      error_code => INT16
      timestamp => INT64
      offset => INT64


EOF
git add ListOffsetsResponse.txt && git commit -m "ListOffsetsResponse v3"

cat > ListOffsetsResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code timestamp offset leader_epoch
      partition => INT32
      error_code => INT16
      timestamp => INT64
      offset => INT64
      leader_epoch => INT32


EOF
git add ListOffsetsResponse.txt && git commit -m "ListOffsetsResponse v4"

cat > ListOffsetsResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code timestamp offset leader_epoch
      partition => INT32
      error_code => INT16
      timestamp => INT64
      offset => INT64
      leader_epoch => INT32


EOF
git add ListOffsetsResponse.txt && git commit -m "ListOffsetsResponse v5"

cat > MetadataRequest.txt <<EOF
[topics]
  topics => STRING


EOF
git add MetadataRequest.txt && git commit -m "MetadataRequest v0"

cat > MetadataRequest.txt <<EOF
[topics]
  topics => STRING


EOF
git add MetadataRequest.txt && git commit -m "MetadataRequest v1"

cat > MetadataRequest.txt <<EOF
[topics]
  topics => STRING


EOF
git add MetadataRequest.txt && git commit -m "MetadataRequest v2"

cat > MetadataRequest.txt <<EOF
[topics]
  topics => STRING


EOF
git add MetadataRequest.txt && git commit -m "MetadataRequest v3"

cat > MetadataRequest.txt <<EOF
[topics] allow_auto_topic_creation
  topics => STRING
  allow_auto_topic_creation => BOOLEAN


EOF
git add MetadataRequest.txt && git commit -m "MetadataRequest v4"

cat > MetadataRequest.txt <<EOF
[topics] allow_auto_topic_creation
  topics => STRING
  allow_auto_topic_creation => BOOLEAN


EOF
git add MetadataRequest.txt && git commit -m "MetadataRequest v5"

cat > MetadataRequest.txt <<EOF
[topics] allow_auto_topic_creation
  topics => STRING
  allow_auto_topic_creation => BOOLEAN


EOF
git add MetadataRequest.txt && git commit -m "MetadataRequest v6"

cat > MetadataRequest.txt <<EOF
[topics] allow_auto_topic_creation
  topics => STRING
  allow_auto_topic_creation => BOOLEAN


EOF
git add MetadataRequest.txt && git commit -m "MetadataRequest v7"

cat > MetadataResponse.txt <<EOF
[brokers] [topic_metadata]
  brokers => node_id host port
    node_id => INT32
    host => STRING
    port => INT32
  topic_metadata => error_code topic [partition_metadata]
    error_code => INT16
    topic => STRING
    partition_metadata => error_code partition leader [replicas] [isr]
      error_code => INT16
      partition => INT32
      leader => INT32
      replicas => INT32
      isr => INT32


EOF
git add MetadataResponse.txt && git commit -m "MetadataResponse v0"

cat > MetadataResponse.txt <<EOF
[brokers] controller_id [topic_metadata]
  brokers => node_id host port rack
    node_id => INT32
    host => STRING
    port => INT32
    rack => NULLABLE_STRING
  controller_id => INT32
  topic_metadata => error_code topic is_internal [partition_metadata]
    error_code => INT16
    topic => STRING
    is_internal => BOOLEAN
    partition_metadata => error_code partition leader [replicas] [isr]
      error_code => INT16
      partition => INT32
      leader => INT32
      replicas => INT32
      isr => INT32


EOF
git add MetadataResponse.txt && git commit -m "MetadataResponse v1"

cat > MetadataResponse.txt <<EOF
[brokers] cluster_id controller_id [topic_metadata]
  brokers => node_id host port rack
    node_id => INT32
    host => STRING
    port => INT32
    rack => NULLABLE_STRING
  cluster_id => NULLABLE_STRING
  controller_id => INT32
  topic_metadata => error_code topic is_internal [partition_metadata]
    error_code => INT16
    topic => STRING
    is_internal => BOOLEAN
    partition_metadata => error_code partition leader [replicas] [isr]
      error_code => INT16
      partition => INT32
      leader => INT32
      replicas => INT32
      isr => INT32


EOF
git add MetadataResponse.txt && git commit -m "MetadataResponse v2"

cat > MetadataResponse.txt <<EOF
throttle_time_ms [brokers] cluster_id controller_id [topic_metadata]
  throttle_time_ms => INT32
  brokers => node_id host port rack
    node_id => INT32
    host => STRING
    port => INT32
    rack => NULLABLE_STRING
  cluster_id => NULLABLE_STRING
  controller_id => INT32
  topic_metadata => error_code topic is_internal [partition_metadata]
    error_code => INT16
    topic => STRING
    is_internal => BOOLEAN
    partition_metadata => error_code partition leader [replicas] [isr]
      error_code => INT16
      partition => INT32
      leader => INT32
      replicas => INT32
      isr => INT32


EOF
git add MetadataResponse.txt && git commit -m "MetadataResponse v3"

cat > MetadataResponse.txt <<EOF
throttle_time_ms [brokers] cluster_id controller_id [topic_metadata]
  throttle_time_ms => INT32
  brokers => node_id host port rack
    node_id => INT32
    host => STRING
    port => INT32
    rack => NULLABLE_STRING
  cluster_id => NULLABLE_STRING
  controller_id => INT32
  topic_metadata => error_code topic is_internal [partition_metadata]
    error_code => INT16
    topic => STRING
    is_internal => BOOLEAN
    partition_metadata => error_code partition leader [replicas] [isr]
      error_code => INT16
      partition => INT32
      leader => INT32
      replicas => INT32
      isr => INT32


EOF
git add MetadataResponse.txt && git commit -m "MetadataResponse v4"

cat > MetadataResponse.txt <<EOF
throttle_time_ms [brokers] cluster_id controller_id [topic_metadata]
  throttle_time_ms => INT32
  brokers => node_id host port rack
    node_id => INT32
    host => STRING
    port => INT32
    rack => NULLABLE_STRING
  cluster_id => NULLABLE_STRING
  controller_id => INT32
  topic_metadata => error_code topic is_internal [partition_metadata]
    error_code => INT16
    topic => STRING
    is_internal => BOOLEAN
    partition_metadata => error_code partition leader [replicas] [isr] [offline_replicas]
      error_code => INT16
      partition => INT32
      leader => INT32
      replicas => INT32
      isr => INT32
      offline_replicas => INT32


EOF
git add MetadataResponse.txt && git commit -m "MetadataResponse v5"

cat > MetadataResponse.txt <<EOF
throttle_time_ms [brokers] cluster_id controller_id [topic_metadata]
  throttle_time_ms => INT32
  brokers => node_id host port rack
    node_id => INT32
    host => STRING
    port => INT32
    rack => NULLABLE_STRING
  cluster_id => NULLABLE_STRING
  controller_id => INT32
  topic_metadata => error_code topic is_internal [partition_metadata]
    error_code => INT16
    topic => STRING
    is_internal => BOOLEAN
    partition_metadata => error_code partition leader [replicas] [isr] [offline_replicas]
      error_code => INT16
      partition => INT32
      leader => INT32
      replicas => INT32
      isr => INT32
      offline_replicas => INT32


EOF
git add MetadataResponse.txt && git commit -m "MetadataResponse v6"

cat > MetadataResponse.txt <<EOF
throttle_time_ms [brokers] cluster_id controller_id [topic_metadata]
  throttle_time_ms => INT32
  brokers => node_id host port rack
    node_id => INT32
    host => STRING
    port => INT32
    rack => NULLABLE_STRING
  cluster_id => NULLABLE_STRING
  controller_id => INT32
  topic_metadata => error_code topic is_internal [partition_metadata]
    error_code => INT16
    topic => STRING
    is_internal => BOOLEAN
    partition_metadata => error_code partition leader leader_epoch [replicas] [isr] [offline_replicas]
      error_code => INT16
      partition => INT32
      leader => INT32
      leader_epoch => INT32
      replicas => INT32
      isr => INT32
      offline_replicas => INT32


EOF
git add MetadataResponse.txt && git commit -m "MetadataResponse v7"

cat > LeaderAndIsrRequest.txt <<EOF
controller_id controller_epoch [partition_states] [live_leaders]
  controller_id => INT32
  controller_epoch => INT32
  partition_states => topic partition controller_epoch leader leader_epoch [isr] zk_version [replicas]
    topic => STRING
    partition => INT32
    controller_epoch => INT32
    leader => INT32
    leader_epoch => INT32
    isr => INT32
    zk_version => INT32
    replicas => INT32
  live_leaders => id host port
    id => INT32
    host => STRING
    port => INT32


EOF
git add LeaderAndIsrRequest.txt && git commit -m "LeaderAndIsrRequest v0"

cat > LeaderAndIsrRequest.txt <<EOF
controller_id controller_epoch [partition_states] [live_leaders]
  controller_id => INT32
  controller_epoch => INT32
  partition_states => topic partition controller_epoch leader leader_epoch [isr] zk_version [replicas] is_new
    topic => STRING
    partition => INT32
    controller_epoch => INT32
    leader => INT32
    leader_epoch => INT32
    isr => INT32
    zk_version => INT32
    replicas => INT32
    is_new => BOOLEAN
  live_leaders => id host port
    id => INT32
    host => STRING
    port => INT32


EOF
git add LeaderAndIsrRequest.txt && git commit -m "LeaderAndIsrRequest v1"

cat > LeaderAndIsrRequest.txt <<EOF
controller_id controller_epoch broker_epoch [topic_states] [live_leaders]
  controller_id => INT32
  controller_epoch => INT32
  broker_epoch => INT64
  topic_states => topic [partition_states]
    topic => STRING
    partition_states => partition controller_epoch leader leader_epoch [isr] zk_version [replicas] is_new
      partition => INT32
      controller_epoch => INT32
      leader => INT32
      leader_epoch => INT32
      isr => INT32
      zk_version => INT32
      replicas => INT32
      is_new => BOOLEAN
  live_leaders => id host port
    id => INT32
    host => STRING
    port => INT32


EOF
git add LeaderAndIsrRequest.txt && git commit -m "LeaderAndIsrRequest v2"

cat > LeaderAndIsrResponse.txt <<EOF
error_code [partitions]
  error_code => INT16
  partitions => topic partition error_code
    topic => STRING
    partition => INT32
    error_code => INT16


EOF
git add LeaderAndIsrResponse.txt && git commit -m "LeaderAndIsrResponse v0"

cat > LeaderAndIsrResponse.txt <<EOF
error_code [partitions]
  error_code => INT16
  partitions => topic partition error_code
    topic => STRING
    partition => INT32
    error_code => INT16


EOF
git add LeaderAndIsrResponse.txt && git commit -m "LeaderAndIsrResponse v1"

cat > LeaderAndIsrResponse.txt <<EOF
error_code [partitions]
  error_code => INT16
  partitions => topic partition error_code
    topic => STRING
    partition => INT32
    error_code => INT16


EOF
git add LeaderAndIsrResponse.txt && git commit -m "LeaderAndIsrResponse v2"

cat > StopReplicaRequest.txt <<EOF
controller_id controller_epoch delete_partitions [partitions]
  controller_id => INT32
  controller_epoch => INT32
  delete_partitions => BOOLEAN
  partitions => topic partition
    topic => STRING
    partition => INT32


EOF
git add StopReplicaRequest.txt && git commit -m "StopReplicaRequest v0"

cat > StopReplicaRequest.txt <<EOF
controller_id controller_epoch broker_epoch delete_partitions [partitions]
  controller_id => INT32
  controller_epoch => INT32
  broker_epoch => INT64
  delete_partitions => BOOLEAN
  partitions => topic [partition_ids]
    topic => STRING
    partition_ids => INT32


EOF
git add StopReplicaRequest.txt && git commit -m "StopReplicaRequest v1"

cat > StopReplicaResponse.txt <<EOF
error_code [partitions]
  error_code => INT16
  partitions => topic partition error_code
    topic => STRING
    partition => INT32
    error_code => INT16


EOF
git add StopReplicaResponse.txt && git commit -m "StopReplicaResponse v0"

cat > StopReplicaResponse.txt <<EOF
error_code [partitions]
  error_code => INT16
  partitions => topic partition error_code
    topic => STRING
    partition => INT32
    error_code => INT16


EOF
git add StopReplicaResponse.txt && git commit -m "StopReplicaResponse v1"

cat > UpdateMetadataRequest.txt <<EOF
controller_id controller_epoch [partition_states] [live_brokers]
  controller_id => INT32
  controller_epoch => INT32
  partition_states => topic partition controller_epoch leader leader_epoch [isr] zk_version [replicas]
    topic => STRING
    partition => INT32
    controller_epoch => INT32
    leader => INT32
    leader_epoch => INT32
    isr => INT32
    zk_version => INT32
    replicas => INT32
  live_brokers => id host port
    id => INT32
    host => STRING
    port => INT32


EOF
git add UpdateMetadataRequest.txt && git commit -m "UpdateMetadataRequest v0"

cat > UpdateMetadataRequest.txt <<EOF
controller_id controller_epoch [partition_states] [live_brokers]
  controller_id => INT32
  controller_epoch => INT32
  partition_states => topic partition controller_epoch leader leader_epoch [isr] zk_version [replicas]
    topic => STRING
    partition => INT32
    controller_epoch => INT32
    leader => INT32
    leader_epoch => INT32
    isr => INT32
    zk_version => INT32
    replicas => INT32
  live_brokers => id [end_points]
    id => INT32
    end_points => port host security_protocol_type
      port => INT32
      host => STRING
      security_protocol_type => INT16


EOF
git add UpdateMetadataRequest.txt && git commit -m "UpdateMetadataRequest v1"

cat > UpdateMetadataRequest.txt <<EOF
controller_id controller_epoch [partition_states] [live_brokers]
  controller_id => INT32
  controller_epoch => INT32
  partition_states => topic partition controller_epoch leader leader_epoch [isr] zk_version [replicas]
    topic => STRING
    partition => INT32
    controller_epoch => INT32
    leader => INT32
    leader_epoch => INT32
    isr => INT32
    zk_version => INT32
    replicas => INT32
  live_brokers => id [end_points] rack
    id => INT32
    end_points => port host security_protocol_type
      port => INT32
      host => STRING
      security_protocol_type => INT16
    rack => NULLABLE_STRING


EOF
git add UpdateMetadataRequest.txt && git commit -m "UpdateMetadataRequest v2"

cat > UpdateMetadataRequest.txt <<EOF
controller_id controller_epoch [partition_states] [live_brokers]
  controller_id => INT32
  controller_epoch => INT32
  partition_states => topic partition controller_epoch leader leader_epoch [isr] zk_version [replicas]
    topic => STRING
    partition => INT32
    controller_epoch => INT32
    leader => INT32
    leader_epoch => INT32
    isr => INT32
    zk_version => INT32
    replicas => INT32
  live_brokers => id [end_points] rack
    id => INT32
    end_points => port host listener_name security_protocol_type
      port => INT32
      host => STRING
      listener_name => STRING
      security_protocol_type => INT16
    rack => NULLABLE_STRING


EOF
git add UpdateMetadataRequest.txt && git commit -m "UpdateMetadataRequest v3"

cat > UpdateMetadataRequest.txt <<EOF
controller_id controller_epoch [partition_states] [live_brokers]
  controller_id => INT32
  controller_epoch => INT32
  partition_states => topic partition controller_epoch leader leader_epoch [isr] zk_version [replicas] [offline_replicas]
    topic => STRING
    partition => INT32
    controller_epoch => INT32
    leader => INT32
    leader_epoch => INT32
    isr => INT32
    zk_version => INT32
    replicas => INT32
    offline_replicas => INT32
  live_brokers => id [end_points] rack
    id => INT32
    end_points => port host listener_name security_protocol_type
      port => INT32
      host => STRING
      listener_name => STRING
      security_protocol_type => INT16
    rack => NULLABLE_STRING


EOF
git add UpdateMetadataRequest.txt && git commit -m "UpdateMetadataRequest v4"

cat > UpdateMetadataRequest.txt <<EOF
controller_id controller_epoch broker_epoch [topic_states] [live_brokers]
  controller_id => INT32
  controller_epoch => INT32
  broker_epoch => INT64
  topic_states => topic [partition_states]
    topic => STRING
    partition_states => partition controller_epoch leader leader_epoch [isr] zk_version [replicas] [offline_replicas]
      partition => INT32
      controller_epoch => INT32
      leader => INT32
      leader_epoch => INT32
      isr => INT32
      zk_version => INT32
      replicas => INT32
      offline_replicas => INT32
  live_brokers => id [end_points] rack
    id => INT32
    end_points => port host listener_name security_protocol_type
      port => INT32
      host => STRING
      listener_name => STRING
      security_protocol_type => INT16
    rack => NULLABLE_STRING


EOF
git add UpdateMetadataRequest.txt && git commit -m "UpdateMetadataRequest v5"

cat > UpdateMetadataResponse.txt <<EOF
error_code
  error_code => INT16


EOF
git add UpdateMetadataResponse.txt && git commit -m "UpdateMetadataResponse v0"

cat > UpdateMetadataResponse.txt <<EOF
error_code
  error_code => INT16


EOF
git add UpdateMetadataResponse.txt && git commit -m "UpdateMetadataResponse v1"

cat > UpdateMetadataResponse.txt <<EOF
error_code
  error_code => INT16


EOF
git add UpdateMetadataResponse.txt && git commit -m "UpdateMetadataResponse v2"

cat > UpdateMetadataResponse.txt <<EOF
error_code
  error_code => INT16


EOF
git add UpdateMetadataResponse.txt && git commit -m "UpdateMetadataResponse v3"

cat > UpdateMetadataResponse.txt <<EOF
error_code
  error_code => INT16


EOF
git add UpdateMetadataResponse.txt && git commit -m "UpdateMetadataResponse v4"

cat > UpdateMetadataResponse.txt <<EOF
error_code
  error_code => INT16


EOF
git add UpdateMetadataResponse.txt && git commit -m "UpdateMetadataResponse v5"

cat > ControlledShutdownRequest.txt <<EOF
broker_id
  broker_id => INT32


EOF
git add ControlledShutdownRequest.txt && git commit -m "ControlledShutdownRequest v0"

cat > ControlledShutdownRequest.txt <<EOF
broker_id
  broker_id => INT32


EOF
git add ControlledShutdownRequest.txt && git commit -m "ControlledShutdownRequest v1"

cat > ControlledShutdownRequest.txt <<EOF
broker_id broker_epoch
  broker_id => INT32
  broker_epoch => INT64


EOF
git add ControlledShutdownRequest.txt && git commit -m "ControlledShutdownRequest v2"

cat > ControlledShutdownResponse.txt <<EOF
error_code [partitions_remaining]
  error_code => INT16
  partitions_remaining => topic partition
    topic => STRING
    partition => INT32


EOF
git add ControlledShutdownResponse.txt && git commit -m "ControlledShutdownResponse v0"

cat > ControlledShutdownResponse.txt <<EOF
error_code [partitions_remaining]
  error_code => INT16
  partitions_remaining => topic partition
    topic => STRING
    partition => INT32


EOF
git add ControlledShutdownResponse.txt && git commit -m "ControlledShutdownResponse v1"

cat > ControlledShutdownResponse.txt <<EOF
error_code [partitions_remaining]
  error_code => INT16
  partitions_remaining => topic partition
    topic => STRING
    partition => INT32


EOF
git add ControlledShutdownResponse.txt && git commit -m "ControlledShutdownResponse v2"

cat > OffsetCommitRequest.txt <<EOF
group_id [topics]
  group_id => STRING
  topics => topic [partitions]
    topic => STRING
    partitions => partition offset metadata
      partition => INT32
      offset => INT64
      metadata => NULLABLE_STRING


EOF
git add OffsetCommitRequest.txt && git commit -m "OffsetCommitRequest v0"

cat > OffsetCommitRequest.txt <<EOF
group_id generation_id member_id [topics]
  group_id => STRING
  generation_id => INT32
  member_id => STRING
  topics => topic [partitions]
    topic => STRING
    partitions => partition offset timestamp metadata
      partition => INT32
      offset => INT64
      timestamp => INT64
      metadata => NULLABLE_STRING


EOF
git add OffsetCommitRequest.txt && git commit -m "OffsetCommitRequest v1"

cat > OffsetCommitRequest.txt <<EOF
group_id generation_id member_id retention_time [topics]
  group_id => STRING
  generation_id => INT32
  member_id => STRING
  retention_time => INT64
  topics => topic [partitions]
    topic => STRING
    partitions => partition offset metadata
      partition => INT32
      offset => INT64
      metadata => NULLABLE_STRING


EOF
git add OffsetCommitRequest.txt && git commit -m "OffsetCommitRequest v2"

cat > OffsetCommitRequest.txt <<EOF
group_id generation_id member_id retention_time [topics]
  group_id => STRING
  generation_id => INT32
  member_id => STRING
  retention_time => INT64
  topics => topic [partitions]
    topic => STRING
    partitions => partition offset metadata
      partition => INT32
      offset => INT64
      metadata => NULLABLE_STRING


EOF
git add OffsetCommitRequest.txt && git commit -m "OffsetCommitRequest v3"

cat > OffsetCommitRequest.txt <<EOF
group_id generation_id member_id retention_time [topics]
  group_id => STRING
  generation_id => INT32
  member_id => STRING
  retention_time => INT64
  topics => topic [partitions]
    topic => STRING
    partitions => partition offset metadata
      partition => INT32
      offset => INT64
      metadata => NULLABLE_STRING


EOF
git add OffsetCommitRequest.txt && git commit -m "OffsetCommitRequest v4"

cat > OffsetCommitRequest.txt <<EOF
group_id generation_id member_id [topics]
  group_id => STRING
  generation_id => INT32
  member_id => STRING
  topics => topic [partitions]
    topic => STRING
    partitions => partition offset metadata
      partition => INT32
      offset => INT64
      metadata => NULLABLE_STRING


EOF
git add OffsetCommitRequest.txt && git commit -m "OffsetCommitRequest v5"

cat > OffsetCommitRequest.txt <<EOF
group_id generation_id member_id [topics]
  group_id => STRING
  generation_id => INT32
  member_id => STRING
  topics => topic [partitions]
    topic => STRING
    partitions => partition offset leader_epoch metadata
      partition => INT32
      offset => INT64
      leader_epoch => INT32
      metadata => NULLABLE_STRING


EOF
git add OffsetCommitRequest.txt && git commit -m "OffsetCommitRequest v6"

cat > OffsetCommitResponse.txt <<EOF
[responses]
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add OffsetCommitResponse.txt && git commit -m "OffsetCommitResponse v0"

cat > OffsetCommitResponse.txt <<EOF
[responses]
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add OffsetCommitResponse.txt && git commit -m "OffsetCommitResponse v1"

cat > OffsetCommitResponse.txt <<EOF
[responses]
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add OffsetCommitResponse.txt && git commit -m "OffsetCommitResponse v2"

cat > OffsetCommitResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add OffsetCommitResponse.txt && git commit -m "OffsetCommitResponse v3"

cat > OffsetCommitResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add OffsetCommitResponse.txt && git commit -m "OffsetCommitResponse v4"

cat > OffsetCommitResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add OffsetCommitResponse.txt && git commit -m "OffsetCommitResponse v5"

cat > OffsetCommitResponse.txt <<EOF
throttle_time_ms [responses]
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add OffsetCommitResponse.txt && git commit -m "OffsetCommitResponse v6"

cat > OffsetFetchRequest.txt <<EOF
group_id [topics]
  group_id => STRING
  topics => topic [partitions]
    topic => STRING
    partitions => partition
      partition => INT32


EOF
git add OffsetFetchRequest.txt && git commit -m "OffsetFetchRequest v0"

cat > OffsetFetchRequest.txt <<EOF
group_id [topics]
  group_id => STRING
  topics => topic [partitions]
    topic => STRING
    partitions => partition
      partition => INT32


EOF
git add OffsetFetchRequest.txt && git commit -m "OffsetFetchRequest v1"

cat > OffsetFetchRequest.txt <<EOF
group_id [topics]
  group_id => STRING
  topics => topic [partitions]
    topic => STRING
    partitions => partition
      partition => INT32


EOF
git add OffsetFetchRequest.txt && git commit -m "OffsetFetchRequest v2"

cat > OffsetFetchRequest.txt <<EOF
group_id [topics]
  group_id => STRING
  topics => topic [partitions]
    topic => STRING
    partitions => partition
      partition => INT32


EOF
git add OffsetFetchRequest.txt && git commit -m "OffsetFetchRequest v3"

cat > OffsetFetchRequest.txt <<EOF
group_id [topics]
  group_id => STRING
  topics => topic [partitions]
    topic => STRING
    partitions => partition
      partition => INT32


EOF
git add OffsetFetchRequest.txt && git commit -m "OffsetFetchRequest v4"

cat > OffsetFetchRequest.txt <<EOF
group_id [topics]
  group_id => STRING
  topics => topic [partitions]
    topic => STRING
    partitions => partition
      partition => INT32


EOF
git add OffsetFetchRequest.txt && git commit -m "OffsetFetchRequest v5"

cat > OffsetFetchResponse.txt <<EOF
[responses]
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition offset metadata error_code
      partition => INT32
      offset => INT64
      metadata => NULLABLE_STRING
      error_code => INT16


EOF
git add OffsetFetchResponse.txt && git commit -m "OffsetFetchResponse v0"

cat > OffsetFetchResponse.txt <<EOF
[responses]
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition offset metadata error_code
      partition => INT32
      offset => INT64
      metadata => NULLABLE_STRING
      error_code => INT16


EOF
git add OffsetFetchResponse.txt && git commit -m "OffsetFetchResponse v1"

cat > OffsetFetchResponse.txt <<EOF
[responses] error_code
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition offset metadata error_code
      partition => INT32
      offset => INT64
      metadata => NULLABLE_STRING
      error_code => INT16
  error_code => INT16


EOF
git add OffsetFetchResponse.txt && git commit -m "OffsetFetchResponse v2"

cat > OffsetFetchResponse.txt <<EOF
throttle_time_ms [responses] error_code
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition offset metadata error_code
      partition => INT32
      offset => INT64
      metadata => NULLABLE_STRING
      error_code => INT16
  error_code => INT16


EOF
git add OffsetFetchResponse.txt && git commit -m "OffsetFetchResponse v3"

cat > OffsetFetchResponse.txt <<EOF
throttle_time_ms [responses] error_code
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition offset metadata error_code
      partition => INT32
      offset => INT64
      metadata => NULLABLE_STRING
      error_code => INT16
  error_code => INT16


EOF
git add OffsetFetchResponse.txt && git commit -m "OffsetFetchResponse v4"

cat > OffsetFetchResponse.txt <<EOF
throttle_time_ms [responses] error_code
  throttle_time_ms => INT32
  responses => topic [partition_responses]
    topic => STRING
    partition_responses => partition offset leader_epoch metadata error_code
      partition => INT32
      offset => INT64
      leader_epoch => INT32
      metadata => NULLABLE_STRING
      error_code => INT16
  error_code => INT16


EOF
git add OffsetFetchResponse.txt && git commit -m "OffsetFetchResponse v5"

cat > FindCoordinatorRequest.txt <<EOF
group_id
  group_id => STRING


EOF
git add FindCoordinatorRequest.txt && git commit -m "FindCoordinatorRequest v0"

cat > FindCoordinatorRequest.txt <<EOF
coordinator_key coordinator_type
  coordinator_key => STRING
  coordinator_type => INT8


EOF
git add FindCoordinatorRequest.txt && git commit -m "FindCoordinatorRequest v1"

cat > FindCoordinatorRequest.txt <<EOF
coordinator_key coordinator_type
  coordinator_key => STRING
  coordinator_type => INT8


EOF
git add FindCoordinatorRequest.txt && git commit -m "FindCoordinatorRequest v2"

cat > FindCoordinatorResponse.txt <<EOF
error_code coordinator
  error_code => INT16
  coordinator => node_id host port
    node_id => INT32
    host => STRING
    port => INT32


EOF
git add FindCoordinatorResponse.txt && git commit -m "FindCoordinatorResponse v0"

cat > FindCoordinatorResponse.txt <<EOF
throttle_time_ms error_code error_message coordinator
  throttle_time_ms => INT32
  error_code => INT16
  error_message => NULLABLE_STRING
  coordinator => node_id host port
    node_id => INT32
    host => STRING
    port => INT32


EOF
git add FindCoordinatorResponse.txt && git commit -m "FindCoordinatorResponse v1"

cat > FindCoordinatorResponse.txt <<EOF
throttle_time_ms error_code error_message coordinator
  throttle_time_ms => INT32
  error_code => INT16
  error_message => NULLABLE_STRING
  coordinator => node_id host port
    node_id => INT32
    host => STRING
    port => INT32


EOF
git add FindCoordinatorResponse.txt && git commit -m "FindCoordinatorResponse v2"

cat > JoinGroupRequest.txt <<EOF
group_id session_timeout member_id protocol_type [group_protocols]
  group_id => STRING
  session_timeout => INT32
  member_id => STRING
  protocol_type => STRING
  group_protocols => protocol_name protocol_metadata
    protocol_name => STRING
    protocol_metadata => BYTES


EOF
git add JoinGroupRequest.txt && git commit -m "JoinGroupRequest v0"

cat > JoinGroupRequest.txt <<EOF
group_id session_timeout rebalance_timeout member_id protocol_type [group_protocols]
  group_id => STRING
  session_timeout => INT32
  rebalance_timeout => INT32
  member_id => STRING
  protocol_type => STRING
  group_protocols => protocol_name protocol_metadata
    protocol_name => STRING
    protocol_metadata => BYTES


EOF
git add JoinGroupRequest.txt && git commit -m "JoinGroupRequest v1"

cat > JoinGroupRequest.txt <<EOF
group_id session_timeout rebalance_timeout member_id protocol_type [group_protocols]
  group_id => STRING
  session_timeout => INT32
  rebalance_timeout => INT32
  member_id => STRING
  protocol_type => STRING
  group_protocols => protocol_name protocol_metadata
    protocol_name => STRING
    protocol_metadata => BYTES


EOF
git add JoinGroupRequest.txt && git commit -m "JoinGroupRequest v2"

cat > JoinGroupRequest.txt <<EOF
group_id session_timeout rebalance_timeout member_id protocol_type [group_protocols]
  group_id => STRING
  session_timeout => INT32
  rebalance_timeout => INT32
  member_id => STRING
  protocol_type => STRING
  group_protocols => protocol_name protocol_metadata
    protocol_name => STRING
    protocol_metadata => BYTES


EOF
git add JoinGroupRequest.txt && git commit -m "JoinGroupRequest v3"

cat > JoinGroupRequest.txt <<EOF
group_id session_timeout rebalance_timeout member_id protocol_type [group_protocols]
  group_id => STRING
  session_timeout => INT32
  rebalance_timeout => INT32
  member_id => STRING
  protocol_type => STRING
  group_protocols => protocol_name protocol_metadata
    protocol_name => STRING
    protocol_metadata => BYTES


EOF
git add JoinGroupRequest.txt && git commit -m "JoinGroupRequest v4"

cat > JoinGroupResponse.txt <<EOF
error_code generation_id group_protocol leader_id member_id [members]
  error_code => INT16
  generation_id => INT32
  group_protocol => STRING
  leader_id => STRING
  member_id => STRING
  members => member_id member_metadata
    member_id => STRING
    member_metadata => BYTES


EOF
git add JoinGroupResponse.txt && git commit -m "JoinGroupResponse v0"

cat > JoinGroupResponse.txt <<EOF
error_code generation_id group_protocol leader_id member_id [members]
  error_code => INT16
  generation_id => INT32
  group_protocol => STRING
  leader_id => STRING
  member_id => STRING
  members => member_id member_metadata
    member_id => STRING
    member_metadata => BYTES


EOF
git add JoinGroupResponse.txt && git commit -m "JoinGroupResponse v1"

cat > JoinGroupResponse.txt <<EOF
throttle_time_ms error_code generation_id group_protocol leader_id member_id [members]
  throttle_time_ms => INT32
  error_code => INT16
  generation_id => INT32
  group_protocol => STRING
  leader_id => STRING
  member_id => STRING
  members => member_id member_metadata
    member_id => STRING
    member_metadata => BYTES


EOF
git add JoinGroupResponse.txt && git commit -m "JoinGroupResponse v2"

cat > JoinGroupResponse.txt <<EOF
throttle_time_ms error_code generation_id group_protocol leader_id member_id [members]
  throttle_time_ms => INT32
  error_code => INT16
  generation_id => INT32
  group_protocol => STRING
  leader_id => STRING
  member_id => STRING
  members => member_id member_metadata
    member_id => STRING
    member_metadata => BYTES


EOF
git add JoinGroupResponse.txt && git commit -m "JoinGroupResponse v3"

cat > JoinGroupResponse.txt <<EOF
throttle_time_ms error_code generation_id group_protocol leader_id member_id [members]
  throttle_time_ms => INT32
  error_code => INT16
  generation_id => INT32
  group_protocol => STRING
  leader_id => STRING
  member_id => STRING
  members => member_id member_metadata
    member_id => STRING
    member_metadata => BYTES


EOF
git add JoinGroupResponse.txt && git commit -m "JoinGroupResponse v4"

cat > HeartbeatRequest.txt <<EOF
group_id generation_id member_id
  group_id => STRING
  generation_id => INT32
  member_id => STRING


EOF
git add HeartbeatRequest.txt && git commit -m "HeartbeatRequest v0"

cat > HeartbeatRequest.txt <<EOF
group_id generation_id member_id
  group_id => STRING
  generation_id => INT32
  member_id => STRING


EOF
git add HeartbeatRequest.txt && git commit -m "HeartbeatRequest v1"

cat > HeartbeatRequest.txt <<EOF
group_id generation_id member_id
  group_id => STRING
  generation_id => INT32
  member_id => STRING


EOF
git add HeartbeatRequest.txt && git commit -m "HeartbeatRequest v2"

cat > HeartbeatResponse.txt <<EOF
error_code
  error_code => INT16


EOF
git add HeartbeatResponse.txt && git commit -m "HeartbeatResponse v0"

cat > HeartbeatResponse.txt <<EOF
throttle_time_ms error_code
  throttle_time_ms => INT32
  error_code => INT16


EOF
git add HeartbeatResponse.txt && git commit -m "HeartbeatResponse v1"

cat > HeartbeatResponse.txt <<EOF
throttle_time_ms error_code
  throttle_time_ms => INT32
  error_code => INT16


EOF
git add HeartbeatResponse.txt && git commit -m "HeartbeatResponse v2"

cat > LeaveGroupRequest.txt <<EOF
group_id member_id
  group_id => STRING
  member_id => STRING


EOF
git add LeaveGroupRequest.txt && git commit -m "LeaveGroupRequest v0"

cat > LeaveGroupRequest.txt <<EOF
group_id member_id
  group_id => STRING
  member_id => STRING


EOF
git add LeaveGroupRequest.txt && git commit -m "LeaveGroupRequest v1"

cat > LeaveGroupRequest.txt <<EOF
group_id member_id
  group_id => STRING
  member_id => STRING


EOF
git add LeaveGroupRequest.txt && git commit -m "LeaveGroupRequest v2"

cat > LeaveGroupResponse.txt <<EOF
error_code
  error_code => INT16


EOF
git add LeaveGroupResponse.txt && git commit -m "LeaveGroupResponse v0"

cat > LeaveGroupResponse.txt <<EOF
throttle_time_ms error_code
  throttle_time_ms => INT32
  error_code => INT16


EOF
git add LeaveGroupResponse.txt && git commit -m "LeaveGroupResponse v1"

cat > LeaveGroupResponse.txt <<EOF
throttle_time_ms error_code
  throttle_time_ms => INT32
  error_code => INT16


EOF
git add LeaveGroupResponse.txt && git commit -m "LeaveGroupResponse v2"

cat > SyncGroupRequest.txt <<EOF
group_id generation_id member_id [group_assignment]
  group_id => STRING
  generation_id => INT32
  member_id => STRING
  group_assignment => member_id member_assignment
    member_id => STRING
    member_assignment => BYTES


EOF
git add SyncGroupRequest.txt && git commit -m "SyncGroupRequest v0"

cat > SyncGroupRequest.txt <<EOF
group_id generation_id member_id [group_assignment]
  group_id => STRING
  generation_id => INT32
  member_id => STRING
  group_assignment => member_id member_assignment
    member_id => STRING
    member_assignment => BYTES


EOF
git add SyncGroupRequest.txt && git commit -m "SyncGroupRequest v1"

cat > SyncGroupRequest.txt <<EOF
group_id generation_id member_id [group_assignment]
  group_id => STRING
  generation_id => INT32
  member_id => STRING
  group_assignment => member_id member_assignment
    member_id => STRING
    member_assignment => BYTES


EOF
git add SyncGroupRequest.txt && git commit -m "SyncGroupRequest v2"

cat > SyncGroupResponse.txt <<EOF
error_code member_assignment
  error_code => INT16
  member_assignment => BYTES


EOF
git add SyncGroupResponse.txt && git commit -m "SyncGroupResponse v0"

cat > SyncGroupResponse.txt <<EOF
throttle_time_ms error_code member_assignment
  throttle_time_ms => INT32
  error_code => INT16
  member_assignment => BYTES


EOF
git add SyncGroupResponse.txt && git commit -m "SyncGroupResponse v1"

cat > SyncGroupResponse.txt <<EOF
throttle_time_ms error_code member_assignment
  throttle_time_ms => INT32
  error_code => INT16
  member_assignment => BYTES


EOF
git add SyncGroupResponse.txt && git commit -m "SyncGroupResponse v2"

cat > DescribeGroupsRequest.txt <<EOF
[group_ids]
  group_ids => STRING


EOF
git add DescribeGroupsRequest.txt && git commit -m "DescribeGroupsRequest v0"

cat > DescribeGroupsRequest.txt <<EOF
[group_ids]
  group_ids => STRING


EOF
git add DescribeGroupsRequest.txt && git commit -m "DescribeGroupsRequest v1"

cat > DescribeGroupsRequest.txt <<EOF
[group_ids]
  group_ids => STRING


EOF
git add DescribeGroupsRequest.txt && git commit -m "DescribeGroupsRequest v2"

cat > DescribeGroupsResponse.txt <<EOF
[groups]
  groups => error_code group_id state protocol_type protocol [members]
    error_code => INT16
    group_id => STRING
    state => STRING
    protocol_type => STRING
    protocol => STRING
    members => member_id client_id client_host member_metadata member_assignment
      member_id => STRING
      client_id => STRING
      client_host => STRING
      member_metadata => BYTES
      member_assignment => BYTES


EOF
git add DescribeGroupsResponse.txt && git commit -m "DescribeGroupsResponse v0"

cat > DescribeGroupsResponse.txt <<EOF
throttle_time_ms [groups]
  throttle_time_ms => INT32
  groups => error_code group_id state protocol_type protocol [members]
    error_code => INT16
    group_id => STRING
    state => STRING
    protocol_type => STRING
    protocol => STRING
    members => member_id client_id client_host member_metadata member_assignment
      member_id => STRING
      client_id => STRING
      client_host => STRING
      member_metadata => BYTES
      member_assignment => BYTES


EOF
git add DescribeGroupsResponse.txt && git commit -m "DescribeGroupsResponse v1"

cat > DescribeGroupsResponse.txt <<EOF
throttle_time_ms [groups]
  throttle_time_ms => INT32
  groups => error_code group_id state protocol_type protocol [members]
    error_code => INT16
    group_id => STRING
    state => STRING
    protocol_type => STRING
    protocol => STRING
    members => member_id client_id client_host member_metadata member_assignment
      member_id => STRING
      client_id => STRING
      client_host => STRING
      member_metadata => BYTES
      member_assignment => BYTES


EOF
git add DescribeGroupsResponse.txt && git commit -m "DescribeGroupsResponse v2"

cat > ListGroupsResponse.txt <<EOF
error_code [groups]
  error_code => INT16
  groups => group_id protocol_type
    group_id => STRING
    protocol_type => STRING


EOF
git add ListGroupsResponse.txt && git commit -m "ListGroupsResponse v0"

cat > ListGroupsResponse.txt <<EOF
throttle_time_ms error_code [groups]
  throttle_time_ms => INT32
  error_code => INT16
  groups => group_id protocol_type
    group_id => STRING
    protocol_type => STRING


EOF
git add ListGroupsResponse.txt && git commit -m "ListGroupsResponse v1"

cat > ListGroupsResponse.txt <<EOF
throttle_time_ms error_code [groups]
  throttle_time_ms => INT32
  error_code => INT16
  groups => group_id protocol_type
    group_id => STRING
    protocol_type => STRING


EOF
git add ListGroupsResponse.txt && git commit -m "ListGroupsResponse v2"

cat > SaslHandshakeRequest.txt <<EOF
mechanism
  mechanism => STRING


EOF
git add SaslHandshakeRequest.txt && git commit -m "SaslHandshakeRequest v0"

cat > SaslHandshakeRequest.txt <<EOF
mechanism
  mechanism => STRING


EOF
git add SaslHandshakeRequest.txt && git commit -m "SaslHandshakeRequest v1"

cat > SaslHandshakeResponse.txt <<EOF
error_code [enabled_mechanisms]
  error_code => INT16
  enabled_mechanisms => STRING


EOF
git add SaslHandshakeResponse.txt && git commit -m "SaslHandshakeResponse v0"

cat > SaslHandshakeResponse.txt <<EOF
error_code [enabled_mechanisms]
  error_code => INT16
  enabled_mechanisms => STRING


EOF
git add SaslHandshakeResponse.txt && git commit -m "SaslHandshakeResponse v1"

cat > ApiVersionsResponse.txt <<EOF
error_code [api_versions]
  error_code => INT16
  api_versions => api_key min_version max_version
    api_key => INT16
    min_version => INT16
    max_version => INT16


EOF
git add ApiVersionsResponse.txt && git commit -m "ApiVersionsResponse v0"

cat > ApiVersionsResponse.txt <<EOF
error_code [api_versions] throttle_time_ms
  error_code => INT16
  api_versions => api_key min_version max_version
    api_key => INT16
    min_version => INT16
    max_version => INT16
  throttle_time_ms => INT32


EOF
git add ApiVersionsResponse.txt && git commit -m "ApiVersionsResponse v1"

cat > ApiVersionsResponse.txt <<EOF
error_code [api_versions] throttle_time_ms
  error_code => INT16
  api_versions => api_key min_version max_version
    api_key => INT16
    min_version => INT16
    max_version => INT16
  throttle_time_ms => INT32


EOF
git add ApiVersionsResponse.txt && git commit -m "ApiVersionsResponse v2"

cat > CreateTopicsRequest.txt <<EOF
[create_topic_requests] timeout
  create_topic_requests => topic num_partitions replication_factor [replica_assignment] [config_entries]
    topic => STRING
    num_partitions => INT32
    replication_factor => INT16
    replica_assignment => partition [replicas]
      partition => INT32
      replicas => INT32
    config_entries => config_name config_value
      config_name => STRING
      config_value => NULLABLE_STRING
  timeout => INT32


EOF
git add CreateTopicsRequest.txt && git commit -m "CreateTopicsRequest v0"

cat > CreateTopicsRequest.txt <<EOF
[create_topic_requests] timeout validate_only
  create_topic_requests => topic num_partitions replication_factor [replica_assignment] [config_entries]
    topic => STRING
    num_partitions => INT32
    replication_factor => INT16
    replica_assignment => partition [replicas]
      partition => INT32
      replicas => INT32
    config_entries => config_name config_value
      config_name => STRING
      config_value => NULLABLE_STRING
  timeout => INT32
  validate_only => BOOLEAN


EOF
git add CreateTopicsRequest.txt && git commit -m "CreateTopicsRequest v1"

cat > CreateTopicsRequest.txt <<EOF
[create_topic_requests] timeout validate_only
  create_topic_requests => topic num_partitions replication_factor [replica_assignment] [config_entries]
    topic => STRING
    num_partitions => INT32
    replication_factor => INT16
    replica_assignment => partition [replicas]
      partition => INT32
      replicas => INT32
    config_entries => config_name config_value
      config_name => STRING
      config_value => NULLABLE_STRING
  timeout => INT32
  validate_only => BOOLEAN


EOF
git add CreateTopicsRequest.txt && git commit -m "CreateTopicsRequest v2"

cat > CreateTopicsRequest.txt <<EOF
[create_topic_requests] timeout validate_only
  create_topic_requests => topic num_partitions replication_factor [replica_assignment] [config_entries]
    topic => STRING
    num_partitions => INT32
    replication_factor => INT16
    replica_assignment => partition [replicas]
      partition => INT32
      replicas => INT32
    config_entries => config_name config_value
      config_name => STRING
      config_value => NULLABLE_STRING
  timeout => INT32
  validate_only => BOOLEAN


EOF
git add CreateTopicsRequest.txt && git commit -m "CreateTopicsRequest v3"

cat > CreateTopicsResponse.txt <<EOF
[topic_errors]
  topic_errors => topic error_code
    topic => STRING
    error_code => INT16


EOF
git add CreateTopicsResponse.txt && git commit -m "CreateTopicsResponse v0"

cat > CreateTopicsResponse.txt <<EOF
[topic_errors]
  topic_errors => topic error_code error_message
    topic => STRING
    error_code => INT16
    error_message => NULLABLE_STRING


EOF
git add CreateTopicsResponse.txt && git commit -m "CreateTopicsResponse v1"

cat > CreateTopicsResponse.txt <<EOF
throttle_time_ms [topic_errors]
  throttle_time_ms => INT32
  topic_errors => topic error_code error_message
    topic => STRING
    error_code => INT16
    error_message => NULLABLE_STRING


EOF
git add CreateTopicsResponse.txt && git commit -m "CreateTopicsResponse v2"

cat > CreateTopicsResponse.txt <<EOF
throttle_time_ms [topic_errors]
  throttle_time_ms => INT32
  topic_errors => topic error_code error_message
    topic => STRING
    error_code => INT16
    error_message => NULLABLE_STRING


EOF
git add CreateTopicsResponse.txt && git commit -m "CreateTopicsResponse v3"

cat > DeleteTopicsRequest.txt <<EOF
[topics] timeout
  topics => STRING
  timeout => INT32


EOF
git add DeleteTopicsRequest.txt && git commit -m "DeleteTopicsRequest v0"

cat > DeleteTopicsRequest.txt <<EOF
[topics] timeout
  topics => STRING
  timeout => INT32


EOF
git add DeleteTopicsRequest.txt && git commit -m "DeleteTopicsRequest v1"

cat > DeleteTopicsRequest.txt <<EOF
[topics] timeout
  topics => STRING
  timeout => INT32


EOF
git add DeleteTopicsRequest.txt && git commit -m "DeleteTopicsRequest v2"

cat > DeleteTopicsRequest.txt <<EOF
[topics] timeout
  topics => STRING
  timeout => INT32


EOF
git add DeleteTopicsRequest.txt && git commit -m "DeleteTopicsRequest v3"

cat > DeleteTopicsResponse.txt <<EOF
[topic_error_codes]
  topic_error_codes => topic error_code
    topic => STRING
    error_code => INT16


EOF
git add DeleteTopicsResponse.txt && git commit -m "DeleteTopicsResponse v0"

cat > DeleteTopicsResponse.txt <<EOF
throttle_time_ms [topic_error_codes]
  throttle_time_ms => INT32
  topic_error_codes => topic error_code
    topic => STRING
    error_code => INT16


EOF
git add DeleteTopicsResponse.txt && git commit -m "DeleteTopicsResponse v1"

cat > DeleteTopicsResponse.txt <<EOF
throttle_time_ms [topic_error_codes]
  throttle_time_ms => INT32
  topic_error_codes => topic error_code
    topic => STRING
    error_code => INT16


EOF
git add DeleteTopicsResponse.txt && git commit -m "DeleteTopicsResponse v2"

cat > DeleteTopicsResponse.txt <<EOF
throttle_time_ms [topic_error_codes]
  throttle_time_ms => INT32
  topic_error_codes => topic error_code
    topic => STRING
    error_code => INT16


EOF
git add DeleteTopicsResponse.txt && git commit -m "DeleteTopicsResponse v3"

cat > DeleteRecordsRequest.txt <<EOF
[topics] timeout
  topics => topic [partitions]
    topic => STRING
    partitions => partition offset
      partition => INT32
      offset => INT64
  timeout => INT32


EOF
git add DeleteRecordsRequest.txt && git commit -m "DeleteRecordsRequest v0"

cat > DeleteRecordsRequest.txt <<EOF
[topics] timeout
  topics => topic [partitions]
    topic => STRING
    partitions => partition offset
      partition => INT32
      offset => INT64
  timeout => INT32


EOF
git add DeleteRecordsRequest.txt && git commit -m "DeleteRecordsRequest v1"

cat > DeleteRecordsResponse.txt <<EOF
throttle_time_ms [topics]
  throttle_time_ms => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition low_watermark error_code
      partition => INT32
      low_watermark => INT64
      error_code => INT16


EOF
git add DeleteRecordsResponse.txt && git commit -m "DeleteRecordsResponse v0"

cat > DeleteRecordsResponse.txt <<EOF
throttle_time_ms [topics]
  throttle_time_ms => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition low_watermark error_code
      partition => INT32
      low_watermark => INT64
      error_code => INT16


EOF
git add DeleteRecordsResponse.txt && git commit -m "DeleteRecordsResponse v1"

cat > InitProducerIdRequest.txt <<EOF
transactional_id transaction_timeout_ms
  transactional_id => NULLABLE_STRING
  transaction_timeout_ms => INT32


EOF
git add InitProducerIdRequest.txt && git commit -m "InitProducerIdRequest v0"

cat > InitProducerIdRequest.txt <<EOF
transactional_id transaction_timeout_ms
  transactional_id => NULLABLE_STRING
  transaction_timeout_ms => INT32


EOF
git add InitProducerIdRequest.txt && git commit -m "InitProducerIdRequest v1"

cat > InitProducerIdResponse.txt <<EOF
throttle_time_ms error_code producer_id producer_epoch
  throttle_time_ms => INT32
  error_code => INT16
  producer_id => INT64
  producer_epoch => INT16


EOF
git add InitProducerIdResponse.txt && git commit -m "InitProducerIdResponse v0"

cat > InitProducerIdResponse.txt <<EOF
throttle_time_ms error_code producer_id producer_epoch
  throttle_time_ms => INT32
  error_code => INT16
  producer_id => INT64
  producer_epoch => INT16


EOF
git add InitProducerIdResponse.txt && git commit -m "InitProducerIdResponse v1"

cat > OffsetForLeaderEpochRequest.txt <<EOF
[topics]
  topics => topic [partitions]
    topic => STRING
    partitions => partition leader_epoch
      partition => INT32
      leader_epoch => INT32


EOF
git add OffsetForLeaderEpochRequest.txt && git commit -m "OffsetForLeaderEpochRequest v0"

cat > OffsetForLeaderEpochRequest.txt <<EOF
[topics]
  topics => topic [partitions]
    topic => STRING
    partitions => partition leader_epoch
      partition => INT32
      leader_epoch => INT32


EOF
git add OffsetForLeaderEpochRequest.txt && git commit -m "OffsetForLeaderEpochRequest v1"

cat > OffsetForLeaderEpochRequest.txt <<EOF
[topics]
  topics => topic [partitions]
    topic => STRING
    partitions => partition current_leader_epoch leader_epoch
      partition => INT32
      current_leader_epoch => INT32
      leader_epoch => INT32


EOF
git add OffsetForLeaderEpochRequest.txt && git commit -m "OffsetForLeaderEpochRequest v2"

cat > OffsetForLeaderEpochResponse.txt <<EOF
[topics]
  topics => topic [partitions]
    topic => STRING
    partitions => error_code partition end_offset
      error_code => INT16
      partition => INT32
      end_offset => INT64


EOF
git add OffsetForLeaderEpochResponse.txt && git commit -m "OffsetForLeaderEpochResponse v0"

cat > OffsetForLeaderEpochResponse.txt <<EOF
[topics]
  topics => topic [partitions]
    topic => STRING
    partitions => error_code partition leader_epoch end_offset
      error_code => INT16
      partition => INT32
      leader_epoch => INT32
      end_offset => INT64


EOF
git add OffsetForLeaderEpochResponse.txt && git commit -m "OffsetForLeaderEpochResponse v1"

cat > OffsetForLeaderEpochResponse.txt <<EOF
throttle_time_ms [topics]
  throttle_time_ms => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => error_code partition leader_epoch end_offset
      error_code => INT16
      partition => INT32
      leader_epoch => INT32
      end_offset => INT64


EOF
git add OffsetForLeaderEpochResponse.txt && git commit -m "OffsetForLeaderEpochResponse v2"

cat > AddPartitionsToTxnRequest.txt <<EOF
transactional_id producer_id producer_epoch [topics]
  transactional_id => STRING
  producer_id => INT64
  producer_epoch => INT16
  topics => topic [partitions]
    topic => STRING
    partitions => INT32


EOF
git add AddPartitionsToTxnRequest.txt && git commit -m "AddPartitionsToTxnRequest v0"

cat > AddPartitionsToTxnRequest.txt <<EOF
transactional_id producer_id producer_epoch [topics]
  transactional_id => STRING
  producer_id => INT64
  producer_epoch => INT16
  topics => topic [partitions]
    topic => STRING
    partitions => INT32


EOF
git add AddPartitionsToTxnRequest.txt && git commit -m "AddPartitionsToTxnRequest v1"

cat > AddPartitionsToTxnResponse.txt <<EOF
throttle_time_ms [errors]
  throttle_time_ms => INT32
  errors => topic [partition_errors]
    topic => STRING
    partition_errors => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add AddPartitionsToTxnResponse.txt && git commit -m "AddPartitionsToTxnResponse v0"

cat > AddPartitionsToTxnResponse.txt <<EOF
throttle_time_ms [errors]
  throttle_time_ms => INT32
  errors => topic [partition_errors]
    topic => STRING
    partition_errors => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add AddPartitionsToTxnResponse.txt && git commit -m "AddPartitionsToTxnResponse v1"

cat > AddOffsetsToTxnRequest.txt <<EOF
transactional_id producer_id producer_epoch group_id
  transactional_id => STRING
  producer_id => INT64
  producer_epoch => INT16
  group_id => STRING


EOF
git add AddOffsetsToTxnRequest.txt && git commit -m "AddOffsetsToTxnRequest v0"

cat > AddOffsetsToTxnRequest.txt <<EOF
transactional_id producer_id producer_epoch group_id
  transactional_id => STRING
  producer_id => INT64
  producer_epoch => INT16
  group_id => STRING


EOF
git add AddOffsetsToTxnRequest.txt && git commit -m "AddOffsetsToTxnRequest v1"

cat > AddOffsetsToTxnResponse.txt <<EOF
throttle_time_ms error_code
  throttle_time_ms => INT32
  error_code => INT16


EOF
git add AddOffsetsToTxnResponse.txt && git commit -m "AddOffsetsToTxnResponse v0"

cat > AddOffsetsToTxnResponse.txt <<EOF
throttle_time_ms error_code
  throttle_time_ms => INT32
  error_code => INT16


EOF
git add AddOffsetsToTxnResponse.txt && git commit -m "AddOffsetsToTxnResponse v1"

cat > EndTxnRequest.txt <<EOF
transactional_id producer_id producer_epoch transaction_result
  transactional_id => STRING
  producer_id => INT64
  producer_epoch => INT16
  transaction_result => BOOLEAN


EOF
git add EndTxnRequest.txt && git commit -m "EndTxnRequest v0"

cat > EndTxnRequest.txt <<EOF
transactional_id producer_id producer_epoch transaction_result
  transactional_id => STRING
  producer_id => INT64
  producer_epoch => INT16
  transaction_result => BOOLEAN


EOF
git add EndTxnRequest.txt && git commit -m "EndTxnRequest v1"

cat > EndTxnResponse.txt <<EOF
throttle_time_ms error_code
  throttle_time_ms => INT32
  error_code => INT16


EOF
git add EndTxnResponse.txt && git commit -m "EndTxnResponse v0"

cat > EndTxnResponse.txt <<EOF
throttle_time_ms error_code
  throttle_time_ms => INT32
  error_code => INT16


EOF
git add EndTxnResponse.txt && git commit -m "EndTxnResponse v1"

cat > WriteTxnMarkersRequest.txt <<EOF
[transaction_markers]
  transaction_markers => producer_id producer_epoch transaction_result [topics] coordinator_epoch
    producer_id => INT64
    producer_epoch => INT16
    transaction_result => BOOLEAN
    topics => topic [partitions]
      topic => STRING
      partitions => INT32
    coordinator_epoch => INT32


EOF
git add WriteTxnMarkersRequest.txt && git commit -m "WriteTxnMarkersRequest v0"

cat > WriteTxnMarkersResponse.txt <<EOF
[transaction_markers]
  transaction_markers => producer_id [topics]
    producer_id => INT64
    topics => topic [partitions]
      topic => STRING
      partitions => partition error_code
        partition => INT32
        error_code => INT16


EOF
git add WriteTxnMarkersResponse.txt && git commit -m "WriteTxnMarkersResponse v0"

cat > TxnOffsetCommitRequest.txt <<EOF
transactional_id group_id producer_id producer_epoch [topics]
  transactional_id => STRING
  group_id => STRING
  producer_id => INT64
  producer_epoch => INT16
  topics => topic [partitions]
    topic => STRING
    partitions => partition offset metadata
      partition => INT32
      offset => INT64
      metadata => NULLABLE_STRING


EOF
git add TxnOffsetCommitRequest.txt && git commit -m "TxnOffsetCommitRequest v0"

cat > TxnOffsetCommitRequest.txt <<EOF
transactional_id group_id producer_id producer_epoch [topics]
  transactional_id => STRING
  group_id => STRING
  producer_id => INT64
  producer_epoch => INT16
  topics => topic [partitions]
    topic => STRING
    partitions => partition offset metadata
      partition => INT32
      offset => INT64
      metadata => NULLABLE_STRING


EOF
git add TxnOffsetCommitRequest.txt && git commit -m "TxnOffsetCommitRequest v1"

cat > TxnOffsetCommitRequest.txt <<EOF
transactional_id group_id producer_id producer_epoch [topics]
  transactional_id => STRING
  group_id => STRING
  producer_id => INT64
  producer_epoch => INT16
  topics => topic [partitions]
    topic => STRING
    partitions => partition offset leader_epoch metadata
      partition => INT32
      offset => INT64
      leader_epoch => INT32
      metadata => NULLABLE_STRING


EOF
git add TxnOffsetCommitRequest.txt && git commit -m "TxnOffsetCommitRequest v2"

cat > TxnOffsetCommitResponse.txt <<EOF
throttle_time_ms [topics]
  throttle_time_ms => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add TxnOffsetCommitResponse.txt && git commit -m "TxnOffsetCommitResponse v0"

cat > TxnOffsetCommitResponse.txt <<EOF
throttle_time_ms [topics]
  throttle_time_ms => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add TxnOffsetCommitResponse.txt && git commit -m "TxnOffsetCommitResponse v1"

cat > TxnOffsetCommitResponse.txt <<EOF
throttle_time_ms [topics]
  throttle_time_ms => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add TxnOffsetCommitResponse.txt && git commit -m "TxnOffsetCommitResponse v2"

cat > DescribeAclsRequest.txt <<EOF
resource_type resource_name principal host operation permission_type
  resource_type => INT8
  resource_name => NULLABLE_STRING
  principal => NULLABLE_STRING
  host => NULLABLE_STRING
  operation => INT8
  permission_type => INT8


EOF
git add DescribeAclsRequest.txt && git commit -m "DescribeAclsRequest v0"

cat > DescribeAclsRequest.txt <<EOF
resource_type resource_name resource_pattern_type_filter principal host operation permission_type
  resource_type => INT8
  resource_name => NULLABLE_STRING
  resource_pattern_type_filter => INT8
  principal => NULLABLE_STRING
  host => NULLABLE_STRING
  operation => INT8
  permission_type => INT8


EOF
git add DescribeAclsRequest.txt && git commit -m "DescribeAclsRequest v1"

cat > DescribeAclsResponse.txt <<EOF
throttle_time_ms error_code error_message [resources]
  throttle_time_ms => INT32
  error_code => INT16
  error_message => NULLABLE_STRING
  resources => resource_type resource_name [acls]
    resource_type => INT8
    resource_name => STRING
    acls => principal host operation permission_type
      principal => STRING
      host => STRING
      operation => INT8
      permission_type => INT8


EOF
git add DescribeAclsResponse.txt && git commit -m "DescribeAclsResponse v0"

cat > DescribeAclsResponse.txt <<EOF
throttle_time_ms error_code error_message [resources]
  throttle_time_ms => INT32
  error_code => INT16
  error_message => NULLABLE_STRING
  resources => resource_type resource_name resource_pattten_type [acls]
    resource_type => INT8
    resource_name => STRING
    resource_pattten_type => INT8
    acls => principal host operation permission_type
      principal => STRING
      host => STRING
      operation => INT8
      permission_type => INT8


EOF
git add DescribeAclsResponse.txt && git commit -m "DescribeAclsResponse v1"

cat > CreateAclsRequest.txt <<EOF
[creations]
  creations => resource_type resource_name principal host operation permission_type
    resource_type => INT8
    resource_name => STRING
    principal => STRING
    host => STRING
    operation => INT8
    permission_type => INT8


EOF
git add CreateAclsRequest.txt && git commit -m "CreateAclsRequest v0"

cat > CreateAclsRequest.txt <<EOF
[creations]
  creations => resource_type resource_name resource_pattten_type principal host operation permission_type
    resource_type => INT8
    resource_name => STRING
    resource_pattten_type => INT8
    principal => STRING
    host => STRING
    operation => INT8
    permission_type => INT8


EOF
git add CreateAclsRequest.txt && git commit -m "CreateAclsRequest v1"

cat > CreateAclsResponse.txt <<EOF
throttle_time_ms [creation_responses]
  throttle_time_ms => INT32
  creation_responses => error_code error_message
    error_code => INT16
    error_message => NULLABLE_STRING


EOF
git add CreateAclsResponse.txt && git commit -m "CreateAclsResponse v0"

cat > CreateAclsResponse.txt <<EOF
throttle_time_ms [creation_responses]
  throttle_time_ms => INT32
  creation_responses => error_code error_message
    error_code => INT16
    error_message => NULLABLE_STRING


EOF
git add CreateAclsResponse.txt && git commit -m "CreateAclsResponse v1"

cat > DeleteAclsRequest.txt <<EOF
[filters]
  filters => resource_type resource_name principal host operation permission_type
    resource_type => INT8
    resource_name => NULLABLE_STRING
    principal => NULLABLE_STRING
    host => NULLABLE_STRING
    operation => INT8
    permission_type => INT8


EOF
git add DeleteAclsRequest.txt && git commit -m "DeleteAclsRequest v0"

cat > DeleteAclsRequest.txt <<EOF
[filters]
  filters => resource_type resource_name resource_pattern_type_filter principal host operation permission_type
    resource_type => INT8
    resource_name => NULLABLE_STRING
    resource_pattern_type_filter => INT8
    principal => NULLABLE_STRING
    host => NULLABLE_STRING
    operation => INT8
    permission_type => INT8


EOF
git add DeleteAclsRequest.txt && git commit -m "DeleteAclsRequest v1"

cat > DeleteAclsResponse.txt <<EOF
throttle_time_ms [filter_responses]
  throttle_time_ms => INT32
  filter_responses => error_code error_message [matching_acls]
    error_code => INT16
    error_message => NULLABLE_STRING
    matching_acls => error_code error_message resource_type resource_name principal host operation permission_type
      error_code => INT16
      error_message => NULLABLE_STRING
      resource_type => INT8
      resource_name => STRING
      principal => STRING
      host => STRING
      operation => INT8
      permission_type => INT8


EOF
git add DeleteAclsResponse.txt && git commit -m "DeleteAclsResponse v0"

cat > DeleteAclsResponse.txt <<EOF
throttle_time_ms [filter_responses]
  throttle_time_ms => INT32
  filter_responses => error_code error_message [matching_acls]
    error_code => INT16
    error_message => NULLABLE_STRING
    matching_acls => error_code error_message resource_type resource_name resource_pattten_type principal host operation permission_type
      error_code => INT16
      error_message => NULLABLE_STRING
      resource_type => INT8
      resource_name => STRING
      resource_pattten_type => INT8
      principal => STRING
      host => STRING
      operation => INT8
      permission_type => INT8


EOF
git add DeleteAclsResponse.txt && git commit -m "DeleteAclsResponse v1"

cat > DescribeConfigsRequest.txt <<EOF
[resources]
  resources => resource_type resource_name [config_names]
    resource_type => INT8
    resource_name => STRING
    config_names => STRING


EOF
git add DescribeConfigsRequest.txt && git commit -m "DescribeConfigsRequest v0"

cat > DescribeConfigsRequest.txt <<EOF
[resources] include_synonyms
  resources => resource_type resource_name [config_names]
    resource_type => INT8
    resource_name => STRING
    config_names => STRING
  include_synonyms => BOOLEAN


EOF
git add DescribeConfigsRequest.txt && git commit -m "DescribeConfigsRequest v1"

cat > DescribeConfigsRequest.txt <<EOF
[resources] include_synonyms
  resources => resource_type resource_name [config_names]
    resource_type => INT8
    resource_name => STRING
    config_names => STRING
  include_synonyms => BOOLEAN


EOF
git add DescribeConfigsRequest.txt && git commit -m "DescribeConfigsRequest v2"

cat > DescribeConfigsResponse.txt <<EOF
throttle_time_ms [resources]
  throttle_time_ms => INT32
  resources => error_code error_message resource_type resource_name [config_entries]
    error_code => INT16
    error_message => NULLABLE_STRING
    resource_type => INT8
    resource_name => STRING
    config_entries => config_name config_value read_only is_default is_sensitive
      config_name => STRING
      config_value => NULLABLE_STRING
      read_only => BOOLEAN
      is_default => BOOLEAN
      is_sensitive => BOOLEAN


EOF
git add DescribeConfigsResponse.txt && git commit -m "DescribeConfigsResponse v0"

cat > DescribeConfigsResponse.txt <<EOF
throttle_time_ms [resources]
  throttle_time_ms => INT32
  resources => error_code error_message resource_type resource_name [config_entries]
    error_code => INT16
    error_message => NULLABLE_STRING
    resource_type => INT8
    resource_name => STRING
    config_entries => config_name config_value read_only config_source is_sensitive [config_synonyms]
      config_name => STRING
      config_value => NULLABLE_STRING
      read_only => BOOLEAN
      config_source => INT8
      is_sensitive => BOOLEAN
      config_synonyms => config_name config_value config_source
        config_name => STRING
        config_value => NULLABLE_STRING
        config_source => INT8


EOF
git add DescribeConfigsResponse.txt && git commit -m "DescribeConfigsResponse v1"

cat > DescribeConfigsResponse.txt <<EOF
throttle_time_ms [resources]
  throttle_time_ms => INT32
  resources => error_code error_message resource_type resource_name [config_entries]
    error_code => INT16
    error_message => NULLABLE_STRING
    resource_type => INT8
    resource_name => STRING
    config_entries => config_name config_value read_only config_source is_sensitive [config_synonyms]
      config_name => STRING
      config_value => NULLABLE_STRING
      read_only => BOOLEAN
      config_source => INT8
      is_sensitive => BOOLEAN
      config_synonyms => config_name config_value config_source
        config_name => STRING
        config_value => NULLABLE_STRING
        config_source => INT8


EOF
git add DescribeConfigsResponse.txt && git commit -m "DescribeConfigsResponse v2"

cat > AlterConfigsRequest.txt <<EOF
[resources] validate_only
  resources => resource_type resource_name [config_entries]
    resource_type => INT8
    resource_name => STRING
    config_entries => config_name config_value
      config_name => STRING
      config_value => NULLABLE_STRING
  validate_only => BOOLEAN


EOF
git add AlterConfigsRequest.txt && git commit -m "AlterConfigsRequest v0"

cat > AlterConfigsRequest.txt <<EOF
[resources] validate_only
  resources => resource_type resource_name [config_entries]
    resource_type => INT8
    resource_name => STRING
    config_entries => config_name config_value
      config_name => STRING
      config_value => NULLABLE_STRING
  validate_only => BOOLEAN


EOF
git add AlterConfigsRequest.txt && git commit -m "AlterConfigsRequest v1"

cat > AlterConfigsResponse.txt <<EOF
throttle_time_ms [resources]
  throttle_time_ms => INT32
  resources => error_code error_message resource_type resource_name
    error_code => INT16
    error_message => NULLABLE_STRING
    resource_type => INT8
    resource_name => STRING


EOF
git add AlterConfigsResponse.txt && git commit -m "AlterConfigsResponse v0"

cat > AlterConfigsResponse.txt <<EOF
throttle_time_ms [resources]
  throttle_time_ms => INT32
  resources => error_code error_message resource_type resource_name
    error_code => INT16
    error_message => NULLABLE_STRING
    resource_type => INT8
    resource_name => STRING


EOF
git add AlterConfigsResponse.txt && git commit -m "AlterConfigsResponse v1"

cat > AlterReplicaLogDirsRequest.txt <<EOF
[log_dirs]
  log_dirs => log_dir [topics]
    log_dir => STRING
    topics => topic [partitions]
      topic => STRING
      partitions => INT32


EOF
git add AlterReplicaLogDirsRequest.txt && git commit -m "AlterReplicaLogDirsRequest v0"

cat > AlterReplicaLogDirsRequest.txt <<EOF
[log_dirs]
  log_dirs => log_dir [topics]
    log_dir => STRING
    topics => topic [partitions]
      topic => STRING
      partitions => INT32


EOF
git add AlterReplicaLogDirsRequest.txt && git commit -m "AlterReplicaLogDirsRequest v1"

cat > AlterReplicaLogDirsResponse.txt <<EOF
throttle_time_ms [topics]
  throttle_time_ms => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add AlterReplicaLogDirsResponse.txt && git commit -m "AlterReplicaLogDirsResponse v0"

cat > AlterReplicaLogDirsResponse.txt <<EOF
throttle_time_ms [topics]
  throttle_time_ms => INT32
  topics => topic [partitions]
    topic => STRING
    partitions => partition error_code
      partition => INT32
      error_code => INT16


EOF
git add AlterReplicaLogDirsResponse.txt && git commit -m "AlterReplicaLogDirsResponse v1"

cat > DescribeLogDirsRequest.txt <<EOF
[topics]
  topics => topic [partitions]
    topic => STRING
    partitions => INT32


EOF
git add DescribeLogDirsRequest.txt && git commit -m "DescribeLogDirsRequest v0"

cat > DescribeLogDirsRequest.txt <<EOF
[topics]
  topics => topic [partitions]
    topic => STRING
    partitions => INT32


EOF
git add DescribeLogDirsRequest.txt && git commit -m "DescribeLogDirsRequest v1"

cat > DescribeLogDirsResponse.txt <<EOF
throttle_time_ms [log_dirs]
  throttle_time_ms => INT32
  log_dirs => error_code log_dir [topics]
    error_code => INT16
    log_dir => STRING
    topics => topic [partitions]
      topic => STRING
      partitions => partition size offset_lag is_future
        partition => INT32
        size => INT64
        offset_lag => INT64
        is_future => BOOLEAN


EOF
git add DescribeLogDirsResponse.txt && git commit -m "DescribeLogDirsResponse v0"

cat > DescribeLogDirsResponse.txt <<EOF
throttle_time_ms [log_dirs]
  throttle_time_ms => INT32
  log_dirs => error_code log_dir [topics]
    error_code => INT16
    log_dir => STRING
    topics => topic [partitions]
      topic => STRING
      partitions => partition size offset_lag is_future
        partition => INT32
        size => INT64
        offset_lag => INT64
        is_future => BOOLEAN


EOF
git add DescribeLogDirsResponse.txt && git commit -m "DescribeLogDirsResponse v1"

cat > SaslAuthenticateRequest.txt <<EOF
sasl_auth_bytes
  sasl_auth_bytes => BYTES


EOF
git add SaslAuthenticateRequest.txt && git commit -m "SaslAuthenticateRequest v0"

cat > SaslAuthenticateRequest.txt <<EOF
sasl_auth_bytes
  sasl_auth_bytes => BYTES


EOF
git add SaslAuthenticateRequest.txt && git commit -m "SaslAuthenticateRequest v1"

cat > SaslAuthenticateResponse.txt <<EOF
error_code error_message sasl_auth_bytes
  error_code => INT16
  error_message => NULLABLE_STRING
  sasl_auth_bytes => BYTES


EOF
git add SaslAuthenticateResponse.txt && git commit -m "SaslAuthenticateResponse v0"

cat > SaslAuthenticateResponse.txt <<EOF
error_code error_message sasl_auth_bytes session_lifetime_ms
  error_code => INT16
  error_message => NULLABLE_STRING
  sasl_auth_bytes => BYTES
  session_lifetime_ms => INT64


EOF
git add SaslAuthenticateResponse.txt && git commit -m "SaslAuthenticateResponse v1"

cat > CreatePartitionsRequest.txt <<EOF
[topic_partitions] timeout validate_only
  topic_partitions => topic new_partitions
    topic => STRING
    new_partitions => count [assignment]
      count => INT32
      assignment => ARRAY(INT32)
  timeout => INT32
  validate_only => BOOLEAN


EOF
git add CreatePartitionsRequest.txt && git commit -m "CreatePartitionsRequest v0"

cat > CreatePartitionsRequest.txt <<EOF
[topic_partitions] timeout validate_only
  topic_partitions => topic new_partitions
    topic => STRING
    new_partitions => count [assignment]
      count => INT32
      assignment => ARRAY(INT32)
  timeout => INT32
  validate_only => BOOLEAN


EOF
git add CreatePartitionsRequest.txt && git commit -m "CreatePartitionsRequest v1"

cat > CreatePartitionsResponse.txt <<EOF
throttle_time_ms [topic_errors]
  throttle_time_ms => INT32
  topic_errors => topic error_code error_message
    topic => STRING
    error_code => INT16
    error_message => NULLABLE_STRING


EOF
git add CreatePartitionsResponse.txt && git commit -m "CreatePartitionsResponse v0"

cat > CreatePartitionsResponse.txt <<EOF
throttle_time_ms [topic_errors]
  throttle_time_ms => INT32
  topic_errors => topic error_code error_message
    topic => STRING
    error_code => INT16
    error_message => NULLABLE_STRING


EOF
git add CreatePartitionsResponse.txt && git commit -m "CreatePartitionsResponse v1"

cat > CreateDelegationTokenRequest.txt <<EOF
[renewers] max_life_time
  renewers => principal_type name
    principal_type => STRING
    name => STRING
  max_life_time => INT64


EOF
git add CreateDelegationTokenRequest.txt && git commit -m "CreateDelegationTokenRequest v0"

cat > CreateDelegationTokenRequest.txt <<EOF
[renewers] max_life_time
  renewers => principal_type name
    principal_type => STRING
    name => STRING
  max_life_time => INT64


EOF
git add CreateDelegationTokenRequest.txt && git commit -m "CreateDelegationTokenRequest v1"

cat > CreateDelegationTokenResponse.txt <<EOF
error_code owner issue_timestamp expiry_timestamp max_timestamp token_id hmac throttle_time_ms
  error_code => INT16
  owner => principal_type name
    principal_type => STRING
    name => STRING
  issue_timestamp => INT64
  expiry_timestamp => INT64
  max_timestamp => INT64
  token_id => STRING
  hmac => BYTES
  throttle_time_ms => INT32


EOF
git add CreateDelegationTokenResponse.txt && git commit -m "CreateDelegationTokenResponse v0"

cat > CreateDelegationTokenResponse.txt <<EOF
error_code owner issue_timestamp expiry_timestamp max_timestamp token_id hmac throttle_time_ms
  error_code => INT16
  owner => principal_type name
    principal_type => STRING
    name => STRING
  issue_timestamp => INT64
  expiry_timestamp => INT64
  max_timestamp => INT64
  token_id => STRING
  hmac => BYTES
  throttle_time_ms => INT32


EOF
git add CreateDelegationTokenResponse.txt && git commit -m "CreateDelegationTokenResponse v1"

cat > RenewDelegationTokenRequest.txt <<EOF
hmac renew_time_period
  hmac => BYTES
  renew_time_period => INT64


EOF
git add RenewDelegationTokenRequest.txt && git commit -m "RenewDelegationTokenRequest v0"

cat > RenewDelegationTokenRequest.txt <<EOF
hmac renew_time_period
  hmac => BYTES
  renew_time_period => INT64


EOF
git add RenewDelegationTokenRequest.txt && git commit -m "RenewDelegationTokenRequest v1"

cat > RenewDelegationTokenResponse.txt <<EOF
error_code expiry_timestamp throttle_time_ms
  error_code => INT16
  expiry_timestamp => INT64
  throttle_time_ms => INT32


EOF
git add RenewDelegationTokenResponse.txt && git commit -m "RenewDelegationTokenResponse v0"

cat > RenewDelegationTokenResponse.txt <<EOF
error_code expiry_timestamp throttle_time_ms
  error_code => INT16
  expiry_timestamp => INT64
  throttle_time_ms => INT32


EOF
git add RenewDelegationTokenResponse.txt && git commit -m "RenewDelegationTokenResponse v1"

cat > ExpireDelegationTokenRequest.txt <<EOF
hmac expiry_time_period
  hmac => BYTES
  expiry_time_period => INT64


EOF
git add ExpireDelegationTokenRequest.txt && git commit -m "ExpireDelegationTokenRequest v0"

cat > ExpireDelegationTokenRequest.txt <<EOF
hmac expiry_time_period
  hmac => BYTES
  expiry_time_period => INT64


EOF
git add ExpireDelegationTokenRequest.txt && git commit -m "ExpireDelegationTokenRequest v1"

cat > ExpireDelegationTokenResponse.txt <<EOF
error_code expiry_timestamp throttle_time_ms
  error_code => INT16
  expiry_timestamp => INT64
  throttle_time_ms => INT32


EOF
git add ExpireDelegationTokenResponse.txt && git commit -m "ExpireDelegationTokenResponse v0"

cat > ExpireDelegationTokenResponse.txt <<EOF
error_code expiry_timestamp throttle_time_ms
  error_code => INT16
  expiry_timestamp => INT64
  throttle_time_ms => INT32


EOF
git add ExpireDelegationTokenResponse.txt && git commit -m "ExpireDelegationTokenResponse v1"

cat > DescribeDelegationTokenRequest.txt <<EOF
[owners]
  owners => principal_type name
    principal_type => STRING
    name => STRING


EOF
git add DescribeDelegationTokenRequest.txt && git commit -m "DescribeDelegationTokenRequest v0"

cat > DescribeDelegationTokenRequest.txt <<EOF
[owners]
  owners => principal_type name
    principal_type => STRING
    name => STRING


EOF
git add DescribeDelegationTokenRequest.txt && git commit -m "DescribeDelegationTokenRequest v1"

cat > DescribeDelegationTokenResponse.txt <<EOF
error_code [token_details] throttle_time_ms
  error_code => INT16
  token_details => owner issue_timestamp expiry_timestamp max_timestamp token_id hmac [renewers]
    owner => principal_type name
      principal_type => STRING
      name => STRING
    issue_timestamp => INT64
    expiry_timestamp => INT64
    max_timestamp => INT64
    token_id => STRING
    hmac => BYTES
    renewers => principal_type name
      principal_type => STRING
      name => STRING
  throttle_time_ms => INT32


EOF
git add DescribeDelegationTokenResponse.txt && git commit -m "DescribeDelegationTokenResponse v0"

cat > DescribeDelegationTokenResponse.txt <<EOF
error_code [token_details] throttle_time_ms
  error_code => INT16
  token_details => owner issue_timestamp expiry_timestamp max_timestamp token_id hmac [renewers]
    owner => principal_type name
      principal_type => STRING
      name => STRING
    issue_timestamp => INT64
    expiry_timestamp => INT64
    max_timestamp => INT64
    token_id => STRING
    hmac => BYTES
    renewers => principal_type name
      principal_type => STRING
      name => STRING
  throttle_time_ms => INT32


EOF
git add DescribeDelegationTokenResponse.txt && git commit -m "DescribeDelegationTokenResponse v1"

cat > DeleteGroupsRequest.txt <<EOF
[groups]
  groups => STRING


EOF
git add DeleteGroupsRequest.txt && git commit -m "DeleteGroupsRequest v0"

cat > DeleteGroupsRequest.txt <<EOF
[groups]
  groups => STRING


EOF
git add DeleteGroupsRequest.txt && git commit -m "DeleteGroupsRequest v1"

cat > DeleteGroupsResponse.txt <<EOF
throttle_time_ms [group_error_codes]
  throttle_time_ms => INT32
  group_error_codes => group_id error_code
    group_id => STRING
    error_code => INT16


EOF
git add DeleteGroupsResponse.txt && git commit -m "DeleteGroupsResponse v0"

cat > DeleteGroupsResponse.txt <<EOF
throttle_time_ms [group_error_codes]
  throttle_time_ms => INT32
  group_error_codes => group_id error_code
    group_id => STRING
    error_code => INT16


EOF
git add DeleteGroupsResponse.txt && git commit -m "DeleteGroupsResponse v1"

cat > ElectPreferredLeadersRequest.txt <<EOF
[topic_partitions] timeout_ms
  topic_partitions => topic [partition_id]
    topic => STRING
    partition_id => INT32
  timeout_ms => INT32


EOF
git add ElectPreferredLeadersRequest.txt && git commit -m "ElectPreferredLeadersRequest v0"

cat > ElectPreferredLeadersResponse.txt <<EOF
throttle_time_ms [replica_election_results]
  throttle_time_ms => INT32
  replica_election_results => topic [partition_result]
    topic => STRING
    partition_result => partition_id error_code error_message
      partition_id => INT32
      error_code => INT16
      error_message => NULLABLE_STRING

EOF
git add ElectPreferredLeadersResponse.txt && git commit -m "ElectPreferredLeadersResponse v0"

