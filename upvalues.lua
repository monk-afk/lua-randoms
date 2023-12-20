-- -- upvalues
-- function Foo (...)
--   local o = {}
--   local f1,f2 = ...
--   function o:show () print(f1,f2) end
--   function o:set (...) f1,f2 = ... end
--   return o
-- end

-- foo = Foo(42,24)
-- foo:show()    -- prints 42 and 24
-- foo:set("foo","bar")
-- foo:show()    -- prints "foo" and "bar"

function Foo(...)
  local send = {}

  local name,message = ...

  function send:show() print(name,message) end

--   function send:set(...) f1,f2 = ... end

  return o
end

foo = Foo(42,24)
foo:show()    -- prints 42 and 24
foo:set("foo","bar")
foo:show()    -- prints "foo" and "bar"
