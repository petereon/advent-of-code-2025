# Advent of Code 2025

## Day 1 (Clojure)

Trying very hard not to hate Clojure, but it's really hard. I just can't get onboard with the REPL paradigm. WDYM live coding? Just use types so you don't have to typecheck by hand in runtime like some kind of animal. Duh.

## Day 2 (Haskell)

While I tried to cast Advent of Code as so many do - to experience a new language - I really wanted to try out Haskell as it sounded as a good fit, even though I have already written a few things in it. Must say, comparing it to Clojure, it's rather arcane and unweildy. I think it's fair to say Scheme is to Clojure what Haskell is to Rust - an impractical arcane step-brother language that works as a didactic device.

## Day 3 (Elixir)

The first language of the lot I have never touched before. I was very sceptical of the `do-end` syntax - having previously worked in Lua, where I had serious reservations - but I must say this was an absolute blast. The language is well designed and practical, providing nice variations of syntax to support different use-cases and intent (I really like the explicit `arity` of function when using HOFs) and it spins up fast (unlike Clojure).

## Day 4 (C)

I was thinking of doing this one in OCaml, but I correctly guessed the second part and assumed disgusting mutability and easy for-loops will be a nice to have - hence C. Believe it or not, I've never written C in my life before. It was about what I expected it be - I spent way too long writing utility functions and once done with that, BOOM, 10 minutes and done. It's not a walk in a park - nothing short of a muddy march - but it gets you where you need to go

## Day 5 (Scala)

This is the most confused I have been programming in a long time - and I routinely code in fairly esoteric languages. My last sparring with Scala was when I was writing Java for living and Scala was a wonderful functional-capable escape from the Java-dread. That said, I do not like Scala 3 one bit. Syntax is foreign, unfamiliar and doesn't feel consistent. Also, what absolute madman figured parameterless method should be called without the parentheses?

> My disappointment is immeasurable and my day is ruined.

## Day 6 (Kotlin)

Scala sucking big has intrigued me, so I prioritized Kotlin being the other popular JVM language - and I must say it's way better. It's an upgrade to Java - unlike Scala. Compiler was not wasting my time either (I forgot to complain about the time Scala takes to compile each time - non-negligible number of seconds). The syntax is nice. Having some experience in Rust, I found cast from `String?` to `String` without any complaints or warnings a little ticklish, but hey, it's a practical language. It gives you the tools to handle null and leaves you an option to shoot yourself in the foot if you are so inclined with no fuss. I kinda like Kotlin. I have zero use-case for it, but it's palatable and if I ever need to target JVM, Kotlin will absolutely be my language of choice.

## Intermezzo (Let's talk about Zig)

Trying to do __Day 7__, I happened to encounter a streak of languages that I just couldn't (bring myself to) work in. Most of it was matter of personal preference, but there was one big exception - Zig.

Zig really got me by one statement in its landing page:

> Focus on debugging your application rather than debugging your programming language knowledge.

That does sound in my ball-park - a nice anti-thesis to whatever Raku (Perl) is doing.

While I am not a massive fun of "BYO buffered-reader" languages in the first place, I appreciate the value. I also enjoy the syntax and find the intent to embed into C-codebases interesting - about time for a more modern-feeling language that shares the C's penchant for simplicity. But, and it's a big one - I found the language nearly unusable.

I couldn't get a simple file read to work - granted, I was not trying for hours. The language changes its standard library roughly every 15 seconds. Embedding such a language in a rock-stable C-codebases, which barely needed to change since the 90's sounds like the pretty bad deal. I understand the language is not in `1.x.x` yet, but the rate of breaking changes undermines adoptability and betrays some of the goals in my opionion. What makes this more pronounced still, is that errors are very stingy on details - I'd expect deprecation notices and "what to use instead" in a modern language.

## Day 7 (Gleam)

Reads like Rust, feels like Elixir - absolutely my kind of language. Type errors could use some work but hey, it's rather nice already given how young and unpopular of a language this is. Also 4-th language that lacks "loops", even lacks "if" statements/expressions - just a nice "case" expression that enforces handling of all the pesky alternatives. I did like Gleam. I did not like this exercise tho - so tedious to think about during the holidays.

## Languages

Languages to try (ORDER BY interest descending):

- [x] Clojure
- [x] Haskell
- [x] Elixir
- [x] C(++) (?) (I am not sure I feel like inventing a universe)
- [x] Scala
- [x] Kotlin (?) (Java-- smh)
- [ ] ~~Raku~~
- [ ] ~~Zig~~
- [ ] ~~Carbon~~
- [ ] ~~Swift~~
- [x] Gleam (?) (Love-child of Rust and Elixir)
- [ ] Nim
- [ ] Crystal
- [ ] Fortran
- [ ] OCaml
- [ ] Squeak (Smalltalk)
- [ ] zsh (?) (I wrote unchristian amounts of shell scripts in my life but it sound like fun)
- [ ] F#
- [ ] Amber
- [ ] V
- [ ] CoffeeScript
- [ ] Common Lisp (?) (With my functional leaning I will probably just end up [ ] writing Clojure/Scheme 🤷)
- [ ] Roc (?) (Weird and niche language)

Disqualified languages:

| Language | Reason                            |
|----------|-----------------------------------|
| Rust     | I work in it                      |
| Python   | I work in it (grudgingly)         |
| Go       | I work in it (wishing I did more) |
| JS/TS    | I don't want to                   |
| Lua      | Meh                               |
| Java     | Ugh                               |
