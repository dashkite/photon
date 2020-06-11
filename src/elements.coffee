import {curry} from "@pandastrike/garden"

class Elements

  constructor: (@root, @selector) ->
    @elements = @root.querySelectorAll @selector

  get: (name) ->
    element[name] for element in @elements

  set: (name, value) ->
    element[name] = value for element in @elements

elements = curry (node, selector) ->
  new Proxy (new Elements node, selector),
    get: (target, name) -> target.get name
    set: (target, name, value) -> target.set name, value

export {elements}
