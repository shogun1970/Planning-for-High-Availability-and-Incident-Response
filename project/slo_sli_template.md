# API Service

| Category     | SLI | SLO                                                                                                         |
|--------------|-----|-------------------------------------------------------------------------------------------------------------|
| Availability |    percentage successful request over last 5 minutes | 99% of requests complete with out errors                                                                                                       |
| Latency      |   90% of request completed under 100ms | 90% of requests below 100ms                                                                                 |
| Error Budget | successful request > 80%  | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   |   successful request per minute 5 or greater  | 5 RPS indicates the application is functioning                                                              |
