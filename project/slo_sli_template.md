# API Service

| Category     | SLI | SLO                                                                                                         | Query  |
|--------------|-----|-------------------------------------------------------------------------------------------------------------|------------|
| Availability |    percentage successful request over last 5 minutes | 99% of requests complete with out errors |sum(rate(apiserver_request_total{job="apiserver",code!~"5.."}[5m]))/sum (rate(apiserver_request_total{job="apiserver"}[5m])) |
| Latency| 90% of under 100ms | 90% of requests below 100ms | histogram_quantile(0.90,sum(rate(apiserver_request_duration_seconds_bucket{job="apiserver"}[5m])) by (le, verb)) | 
| Error Budget | successful request > 80%  | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |1 - ((1 - (sum(increase(apiserver_request_total{job="apiserver", code="200"}[5m])) by (verb)) / sum(increase(apiserver_request_total{job="apiserver"}[5m])) by (verb)) / (1 - .80)) |
| Throughput   |   successful request per minute 5 or greater  | 5 RPS indicates the application is functioning | |
