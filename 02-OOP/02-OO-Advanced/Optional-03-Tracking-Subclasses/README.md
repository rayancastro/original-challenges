## Background & Objectives

Let's play a bit with inheritance. In ruby, you can call `ancestors` on a Class to
get a list of all the parents. Look at [this question](http://stackoverflow.com/questions/19045195/understanding-ruby-class-and-ancestors-methods) and the recommended answer on
Stack Overflow to get a sense of the class hierarchy.

## Specs

For this exercise, we want to do the opposite. We have a `Mother` class that should be able to call
its descendants. Say you have two classes `Daugther` and `Son` with class method `phone`, then:

```ruby
Mother.phone_kids
# => should call Daughter.phone and Son.phone
```

The specs provide you with two children classes of `Mother`, so you just have to implement
the class method `phone_kids`. You may need to use the [`inherited`](http://www.ruby-doc.org/core-2.4.0/Class.html#method-i-inherited) method of `Class`.
