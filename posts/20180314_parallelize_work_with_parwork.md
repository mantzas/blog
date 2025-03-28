---
title: Parallelize work using parwork
published: false
tags: parallel, go, fork-join
date: 20180314T19:00Z
series: Go series
---

# Intro

In order to process a lot of work we have to parallelize work across all cores, and especially if it's CPU bound.
Go has goroutines, which can be used to parallelize the work, but there is the cost of context switching for a lot of goroutines.
Minimizing this context switching can be achieved by using a fork-join model when processing work.
