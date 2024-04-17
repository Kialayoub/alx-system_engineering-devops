![doodle-Confused-person-for-choice-Graphics-56699372-1-1-580x387](https://github.com/Kialayoub/alx-system_engineering-devops/assets/132392508/8f1417f3-083c-4a43-8215-4a16c3604d53)


# Postmortem: BooktifuL Platform Outage

## Issue Summary
- **Duration:** March 15, 2024, 12:00 PM - March 20, 2024, 10:00 PM (East Africa Time)
- **Impact:** The BooktifuL platform experienced a complete outage, with all services returning 500 Errors. Approximately 90% of users were affected.
- **Root Cause:** The failure of the master server web-01 due to a memory outage, exacerbated by a misconfiguration during testing.

## Timeline
- **12:00 PM:** The outage was detected on Saturday, February 26th, when our Site Reliability Engineer, Mr. Elie, observed the master server lagging in speed.
- **12:15 PM:** Engineers on call disconnected the master server web-01 for further analysis and routed all requests to the client server web-02.
- **01:00 PM:** Initial investigation suggested a potential memory outage on the master server due to excessive requests.
- **02:00 PM:** Misleadingly, engineers suspected a network issue, leading to temporary redirection of focus.
- **03:30 PM:** Realizing the misdirection, the incident was escalated to the infrastructure team for deeper analysis.
- **06:00 PM:** The root cause was identified: the client server web-02 was not reconnected to the load balancer after testing, causing an imbalance in request distribution.
- **07:30 PM:** The master server underwent memory cleanup and was reconnected to the load balancer.
- **10:00 PM:** With a round-robin algorithm implemented for load distribution, both master and client servers were able to handle requests evenly, restoring service.

## Root Cause and Resolution
- **Root Cause:** The master server web-01 experienced a memory outage due to an overwhelming number of requests, exacerbated by the misconfiguration of not reconnecting the client server web-02 to the load balancer.
- **Resolution:** The master server underwent memory cleanup, and both master and client servers were balanced using a round-robin algorithm, restoring normal service.

## Corrective and Preventative Measures
- **Improvements:**
  - Implement automated checks to ensure all servers are properly connected to the load balancer after testing.
  - Enhance monitoring systems to detect memory usage abnormalities and intervene proactively.
- **Tasks:**
  1. Conduct a review of load balancer configurations to ensure proper server connectivity.
  2. Develop automated scripts to periodically check server connections and alert if discrepancies are found.
  3. Schedule regular load testing to anticipate and prevent similar outages in the future.


