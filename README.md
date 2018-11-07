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

## Serf Benefits

- Decentralized
- Fault Tolerant
- Self-Healing

## Problem Solving

1. Membership
2. Failure Detection & Recovery
3. Custom Event Propagation

## Running the Agent

### Starting Agent

```bash
serf agent
```

### Checking Cluster members

```bash
serf members
```

### Stopping Agent

__Gracefully Leave__
```bash
serf leave
```

or 

```bash
Ctrl-C
```

__Forcefully Leave__
```bash
serf force-leave
```

## Joining the Cluster

Starting multiple agents...

```bash
serf agent -node=agent-one -bind=127.20.20.10
serf agent -node=agent-one -bind=127.20.20.11
```

Telling 1st agent to join the 2nd agent will involve going into the 1st agent and telling it to join the 2nd agent:

```bash
serf join 127.20.20.11
```

You can check the status of agents after joining by _Checking Cluster members_

## Leaving the Cluster

To leave just stop the agent you want to leave. See options in Stopping Agent section.

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

## Custom Events

To send a custom event we simply do:

```bash
serf event [your custom event]
```

## Custom Queries

E.g. to query the load 

```bash
serf query load
```

which can then be combined with Custom Events' an Event Handler to send back responses. In this particular example, we can send back load times of machines.
