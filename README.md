<h1>Tic Tac Toe using Ruby</h1>

<p>A simple game of Tic Tac Toe running on the CLI. Check out the final <a href='https://replit.com/@michaeljchong/Tic-Tac-Toe?v=1'>interactive environment</a> on Replit.</p>

<h2>Lesson's Learned:</h2>
<ul>
    <li>Practice committing changes more often</li>
    <li>Test base cases per method</li>
    <li>Take more time considering compartmentalization in the planning phase</li>
</ul>

<h2>Feature List:</h2>
<ul>
    <li>Custom player names</li>
    <li>Single digit player inputs mapped to 2D grid</li>
</ul>

<h2>Project Extensions:</h2>
<ul>
    <li>Beautify the board display</li>
</ul>

<h2>Ruby Used:</h2>
<ul>
    <li>Instance methods</li>
    <li>Classes</li>
    <li>Attribute accessors</li>
</ul>

<h2>Initial Project Outline / Pseudocode</h2>
board class
  initialize
    @board
  set value at position
    @board[][] = value
  check value at position
    return @board[][]
  board_full
    check all positions on board == ''
player class
  initialize(player name)
  turn
  win?
    check row, col, diagonal for same value
game class
  play
    until finished
  reset
