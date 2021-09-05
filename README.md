# Citacita

A new Flutter project.

## How is the code structured?

We apply Domain-Driven Design (DDD).

## Domain-Driven Design

### Domains, bounded contexts & context maps
> "A **domain** is a sphere of knowledge, influence or activity. It is the business area of focus for the application developer. The underlying premise of DDD is that the complexity is in the domain, not in the technology. The **core domain** gets to the heart of what is really important and the reason you’re writing the application in the first placem, it may be supplemented with **supporting domains** or **generic subdomains**. Your energy should be directed at the core domain; while supporting and generic domains are often necessary, these are not where you will differentiate your application, so you may opt for buying off-the-shelf capabilities, using existing libraries or outsourcing these less differentiated areas to other vendors (e.g. authentication)." Jagdish Mirani

> "For any sizable enterprise application, you will inevitably end up with multiple models that have to interact with each other. These models are representations of smaller problems that collectively address a bigger problem. Each model can and should be dealt with independently of the others and the introduction of this boundary is what constitutes a **bounded context**." Jagdish Mirani

> "A domain focuses speaks a ubiquitous language (non-developer can perfectly understand what the domain is about, eg: getData vs getPassengerTicket) within an explicitly bounded context (it is the boundary of each domain, for example payments, shipping or messaging domain)", Eric Evans in *DDD Reference*, "Is the code being expressed according to the mental model of the business and any domain expert who’s working with us? Getters and setters do not give you an explicit indication of what the model means -- it’s only moving data around. If you’re thinking in tactical DDD, then you have to think getters and setters are ultimately the enemy, because what you really want to model are behaviors that express the way that the business considers how work should get done." Vaughn Vernon in *DDD in Practice*

> "What do you need to have between languages so that you can understand one model to another? A translation or a **context map**. Typically, we will try to translate between models to keep each separate model pure and clean. Whether I’m using RPC or REST isn’t important, who I am integrating with is more important than how I am integrating." Vaughn Vernon in *DDD in Practice*

### Con


## Future architectural improvements

When the data stored complexity will increases, we can apply Event Sourcing to the DDD.

> "Event Sourcing is a style of storing entities, not by directly storing their state, but rather as a sequence of events (i.e. an event stream) describing all the changes that happened to that entity in the past. The current state of the entity is recalculated by replaying all the past events on an “empty” instance." Info eMag in *DDD in Practice*
