# FirePong

## ToDo

- [x] Setup VCS
  - Master branch has base game (empty) (also rules - only stable changes)
  - Every feature will have separate branch
  - Features can only be merged and require at least 2 approvals
- [x] First Stage
- [ ] Second Stage
---
**In case just pulling this project on your local doesn't work, try following the guide given [here](https://docs.godotengine.org/en/stable/getting_started/workflow/project_setup/version_control_systems.html) under *Official Git Plugin*. If you're on a windows then do checkout the last paragraph on that page under *Working with Git on Windows* cause line endings are annoying**

---

## First Stage

### Distribution

- [x] Paris
  - Environment
- [x] Pawan 
  - Timer
- [x] Lorenzo 
  - Menu
- [x] Samarth 
  - Paddle
  - VCS

### Tasks

- Storytelling
- Score (time played)
  - Increase speed every minute
- Create Environment
  - Background (separating wall in center)
  - Boundaries 
  - Characters (paddle and ball)
  - Wall for opponent
- Paddle moves up and down (keyboard buttons)
- Sound
  - Effects for hitting walls, paddles, goal
  - Music for most of the game
- Menu 
  - Start/Restart the game
  - Options
    - Difficulty Level
    - Sound Volume
    - Language
    - About (creators, lore, etc.)
  - Exit

## Second Stage

### Distribution

- [ ] Paris
  - Language
- [ ] Pawan 
  - Score (use same fonts)
  - Music
- [ ] Lorenzo 
  - Menu
  - Storytelling
- [ ] Samarth 
  - Environment

### Tasks

- Polish menu
  - Buttons
  - Options should do something
  - Exit should exit
  - Pause game and show menu on press "esc"
  - Language
- Scoring
  - Boundaries on left and right
  - Add signal to timer and also menu (reload_scene)
- Environment
  - Increasing ball and paddle speed incrementally (on fire eventually?)
  - Make everything white
  - Make enemy controllable
  - Make starting angle of ball random (with constraints)

## Experimental Features

- Timer as a character (curses on loss, shoots lightning?)
- Moving the paddle left and right
- Variable goal post size (according to difficulty level)
- Movable middle line to make it harder for one side or the other
- Lives, powerups
- Exporting to webapps, mobile?
- Characters for paddle - football player, catapult, etc.
- Spin on the ball like table tennis?
- Make game harder every minute by making ball faster and finally throw objects in between
- Trippy mode: color changes on every hit
- Narration through the game that changes environmental features - fire, horror, etc.
- Konami code to change the music
