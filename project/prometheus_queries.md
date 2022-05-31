## Availability SLI
### The percentage of successful requests over the last 5m
query:   sum (rate(apiserver_request_total{job="apiserver",code!~"5.."}[5m]))
/
sum (rate(apiserver_request_total{job="apiserver"}[5m]))


## Latency SLI
### 90% of requests finish in these times
query:  histogram_quantile(0.95,
sum(rate(apiserver_request_duration_seconds_bucket{job="apiserver"}[5m])) by (le, verb))

## Throughput
### Successful requests per second
query: sum(rate(apiserver_request_total{job="apiserver",code=~"2.."}[5m]))

## Error Budget - Remaining Error Budget
### The error budget is 20%

query:  1 - ((1 - (sum(increase(apiserver_request_total{job="apiserver", code="200"}[5m])) by (verb)) / sum(increase(apiserver_request_total{job="apiserver"}[5m])) by (verb)) / (1 - .80))
