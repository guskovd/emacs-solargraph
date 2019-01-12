 This editor uses solargraph-rails to provide Ruby code completion.
# Code suggestions include the core Ruby library, local class and variable
# definitions, and hints from YARD documentation.
# Hit ctrl+space anywhere in code to get context-aware suggestions.

str = 'Hello, world!'
# Try entering `str.` and hitting ctrl+space to see String instance methods.


class Foo
  def bar
  end
end

foo = Foo.n

foo.ba

# Try entering `foo.` and hitting ctrl+space to see Foo instance methods.
