# Serf Case

This case shows Hashicorp's Serf product. 

* [Intro](#intro)
* [Serf Benefits](#serf-benefits)
* [Problem Solving](#problem-solving)
* [Running the Agent](#running-the-agent)
    * [Starting Agent](#starting-agent)  
    * [Checking Cluster members](#checking-cluster-members)
    * [Stopping Agent](#stopping-agent)
* [Joining the Cluster](#joining-cluster)
* [Leaving the Cluster](#leaving-cluster)
* [Events](#events)
* [Custom Events](#custom-events)
* [Custom Queries](#custom-queries)

## <a name="intro"></a>Intro

Serf is a tool for:

- Cluster Membership
- Failure Detection
- De-centralized Orchestration

## <a name="serf-benefits"></a>Serf Benefits

- Decentralized
- Fault Tolerant
- Self-Healing
- Highly Available

## <a name="problem-solving"></a>Problem Solving

1. Membership
2. Failure Detection & Recovery
3. Custom Event Propagation

## <a name="running-the-agent"></a>Running the Agent

### <a name="starting-agent"></a>Starting Agent

```bash
serf agent
```

### <a name="checking-cluster-members"></a>Checking Cluster members

```bash
serf members
```

### <a name="stopping-agent"></a>Stopping Agent

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

## <a name="joining-cluster"></a>Joining the Cluster

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

## <a name="leaving-cluster"></a>Leaving the Cluster

To leave just stop the agent you want to leave. See options in Stopping Agent section.

## <a name="events"></a>Events

Serf currently invokes the following types of events:

1. member-join
2. member-leave
3. member-failed
4. member-update
5. member-reap
6. user
7. query

## <a name="event-handlers"></a>Event Handlers

Starting a Serf agent with the event handler.

```bash
serf agent -log-level=debug -event-handler=handler.sh
```

flagging the serf agent in log level debug mode so we can see the stdin/stderr of the events.

## <a name="custom-events"></a>Custom Events

To send a custom event we simply do:

```bash
serf event [your custom event]
```

## <a name="custom-queries"></a>Custom Queries

E.g. to query the load 

```bash
serf query load
```

which can then be combined with Custom Events' an Event Handler to send back responses. In this particular example, we can send back load times of machines.
