# serf-case

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
