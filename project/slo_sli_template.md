# API Service

| Category     | SLI | SLO                                                                                                         |
|--------------|-----|-------------------------------------------------------------------------------------------------------------|
| Availability |   ((Success Responses)/ (Total number of Requests)) * 100  | 99%                                                                                                         |
| Latency      |  ((Number of request completed below 100ms)/(total number of requests)) * 100   | 90% of requests below 100ms                                                                                 |
| Error Budget |  (The number of http error )/(total number of requests)    | Error budget is defined at 20%. This means that 20% of the requests can fail and still be within the budget |
| Throughput   |  (Total Request) / (Time period)   | 5 RPS indicates the application is functioning                                                              |
