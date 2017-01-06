+++
title = "Breaking the circuit"
categories = ["pattern", "cloud", "design", "dotnet", "go", "csharp"]
description = "Circuit Breaker pattern implementation in go and c#"
keywords = ["pattern", "cloud", "design", "dotnet", "go", "csharp"]
date = "2016-12-28T14:11:25+02:00"

+++

# Circuit breaker pattern

This is probably one of the most useful "cloud" patterns out there and it is fairly easy to implement.  
There are great articles already on the internet about this pattern so why another one? 

    Κρείττον οψιμαθή είναι ή αμαθή.
    Socrates 469-399 BC., Philosopher

    Better too have learned lately than never, as he tried to explain why he learned to play 
    guitar in his old age.

I for myself have learned better by reading, implementing and writing about something.

## Problem

Almost every application does communicates with other services or resources, and they fail...

The reasons:

- slow network connections
- timeouts
- the resources being over-committed or temporarily unavailable
- buggy release
- etc

When this happen our system becomes unstable, unreliable, brittle and failures cascade.

Let's go with an example of a failing remote service, let's say a timeout after 60sec. 
What happens in our application?
The current request takes up resources in order to make the call and blocks (or awaits) for 60sec.  
All requests for the same service will suffer the same fate.  
All clients that call our service fail the same way.  
The failure cascades.  
The response times go through the roof.
The perfect storm is about to form.

## Solution

Using a circuit breaker can improve the stability and resilience of our application.
The circuit is actually a state machine with 3 states

- Closed, meaning the execution will proceed
- Open, meaning the execution will not proceed and throw a exception or return an error
- Half-Open, meaning that some executions are allowed in order to check the remote service 
and reset the circuit if it succeeds

## Benefits

By using a circuit breaker we have the following benefits:

- Fail in a controlled manner
- Fail fast
- Maintain response times
- Handle failures differently when circuit open like
    - Redirect to another resources
    - Save for later retry
    - etc

## Implementation

There are two implementation of the circuit breaker. 
They share the same philosophy but are written in C# and Go.
Both implementations have a setting provider interface which can be implemented 
in order to get the settings from anywhere. There is a in-memory settings implementation which 
holds the settings in memory. 
Both implementation are key based which means that for every key 
the implementation provides a separate circuit which is actually the state.
The following setting exist for each key:

- Failure Threshold at which the circuit opens
- Retry Timeout defines after how much time after the circuit trips will the state be half-open
- Retry Success Threshold defines after how many successful retries will the circuit reset and Closed
- Max Retry Execution Threshold defines how many retries are allowed in the half-open state

The C# implementation can be found @ [clouddotnet](https://github.com/mantzas/clouddotnet).
The implementation is a generic, asynchronous and thread safe.  
The Go implementation can be found @ [gocloud](https://github.com/mantzas/gocloud).
The implementation is idiomatic and thread safe.

### Diffs

- Since Go does not have generics the action to be executed returns a interface and a error
- The benchmark for the C# implementation results in 355ns/operation
- The benchmark for the Go implementation results in 562ns/operation
- C# is a lot faster than Go for this implementation which was not expected

## Resources 

[MSDN Circuit Breaker](https://msdn.microsoft.com/en-us/library/dn589784.aspx)