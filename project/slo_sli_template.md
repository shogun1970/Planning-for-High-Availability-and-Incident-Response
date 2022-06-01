# Dashboard SLO/SLI for API Service

| Category     | SLI      | SLO                                                                | Query                                       |
|--------------|----------|--------------------------------------------------------------------|---------------------------------------------|
| Availability |    percentage successful request over last 5 minutes | 99% of requests complete with out errors |sum(rate(apiserver_request_total{job="apiserver",code!~"5.."}[5m]))/sum (rate(apiserver_request_total{job="apiserver"}[5m])) |
| Latency| 90% of under 100ms | 90% of requests below 100ms | histogram_quantile(0.90,sum(rate(apiserver_request_duration_seconds_bucket{job="apiserver"}[5m])) by (le, verb)) | 
| Error Budget | successful request > 80%  | Error budget is defined at 20%.|1 - ((1 - (sum(increase(apiserver_request_total{job="apiserver", code="200"}[5m])) by (verb)) / sum(increase(apiserver_request_total{job="apiserver"}[5m])) by (verb)) / (1 - .80)) |
| Throughput   |   successful request per minute 5 or greater  | 5 RPS indicates the application is functioning | sum(rate(apiserver_request_total{job="apiserver",code=~"2.."}[5m])) |


# Other examples of SLO's and SLI's for Web Apps

| Category     | SLI      | SLO                                                                |
|--------------|----------|--------------------------------------------------------------------|
| Availability |  successful HTTP requests per minute | 99% of orders complete without errors. Only 1% of traffic results in an error or errors |
| Latency |  latency of a backend web server response |99% of requests complete within 50ms. Be able to sustain 500 visitors per minute while keeping the latency below 50ms |
| Availability |  unsuccessful HTTP requests per minute | 99% of orders complete without errors. Only 1% of traffic results in an error or errors |
| Latency |  latency of frontend response | 99% of orders complete without errors. Only 1% of traffic results in an error or errors |
| Availability |  successful HTTP requests per minute | 99% of orders complete without errors. Only 1% of traffic results in an error or errors |
| Availability |  successful HTTP requests per minute | 99% of orders complete without errors. Only 1% of traffic results in an error or errors |
| Availability |  successful HTTP requests per minute | 99% of orders complete without errors. Only 1% of traffic results in an error or errors |
| Availability |  successful HTTP requests per minute | 99% of orders complete without errors. Only 1% of traffic results in an error or errors |
| Availability |  successful HTTP requests per minute | 99% of orders complete without errors. Only 1% of traffic results in an error or errors |
| Availability |  successful HTTP requests per minute | 99% of orders complete without errors. Only 1% of traffic results in an error or errors |
