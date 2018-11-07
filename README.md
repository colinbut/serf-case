# Serf Case

This case shows Hashicorp's Serf product. 

## Intro

Serf is a tool for:

- Cluster Membership
- Failure Detection
- De-centralized Orchestration

Benefits/Selling Points:

+ De-centralized
+ Fault Tolerant
+ Highly Available

## Problem Solving

1. Membership
2. Failure Detection & Recovery
3. Custom Event Propagation

## Events

Serf currently invokes the following types of events:

1. member-join
2. member-leave
3. member-failed
4. member-update
5. member-reap
6. user
7. query

## Event Handlers

Starting a Serf agent with the event handler.

```bash
serf agent -log-level=debug -event-handler=handler.sh
```

flagging the serf agent in log level debug mode so we can see the stdin/stderr of the events.
