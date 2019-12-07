My simplistic implementation of [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) as a part of mine
deliberate practice of TDD and Simple Design in Ruby. Inspired by the [Global Day Of Code Retreat in 2019 with 8th Light](http://geekvasyl.me/2019/11/17/The-Global-Day-of-Coderetreat-with-8th-Light/).

# How to run?

`$ bin/game_of_life`

# TODO

- [ ] Add more commands: restart, speed up, speed down, specify another seed file
- [ ] Improve appearance: title with command bar, better symbols, colours, borders, clear after stop
- [ ] Random seed
- [ ] Add guard to automate test execution on every change
- [ ] Place the cells on the grid while running
- [ ] Infinite grid
- [ ] Put ConsoleInputReader under the test? Currently I've tried to keep the reader as simple as possible to avoid writing crazy system test.
      Perhaps, there could be sort of End to End test, where we run the game, collect output to file and compare it with previous one.
- [ ] Better graphics with JRuby and libGVX, compile to Web Assembly with TeaVM.
