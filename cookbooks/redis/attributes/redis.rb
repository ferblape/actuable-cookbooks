set[:redis][:version] = "2.4.7"
set[:redis][:port] = 6379
set[:redis][:bind_address] = "192.168.152.171"
set[:redis][:timeout] = 300
set[:redis][:databases] = 8

# max memory in MB
set[:redis][:max_memory] = "300"

#  db snapshots to disk
#  after 900 sec (15 min) if at least 1 key changed
#  after 300 sec (5 min) if at least 10 keys changed
#  after 60 sec if at least 10000 keys changed
set[:redis][:snapshots] = {900 => 1, 300 => 10, 60 => 10000}