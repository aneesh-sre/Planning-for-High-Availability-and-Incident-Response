## Availability SLI
### The percentage of successful requests over the last 5m
(sum(rate(flask_http_request_total{status=~"2.."}[5m])) 
 /
 sum(rate(flask_http_request_total[5m]))) * 100


## Latency SLI
### 90% of requests finish in these times
(sum(rate(flask_http_request_duration_seconds_bucket{le="0.1"}[5m])) 
 /
 sum(rate(flask_http_request_total[5m]))) * 100

## Throughput
### Successful requests per second


## Error Budget - Remaining Error Budget
### The error budget is 20%

