require '/Users/chris/Apps/Zephyros.app/Contents/Resources/libs/zephyros.rb'

move = ["alt"]
size = ["alt", "ctrl"]

# give the window-shadows a little breathing room
padding = 1


def move_window &block
  win = API.focused_window
  frame = win.frame
  screen = API.main_screen.frame_including_dock_and_menu
  yield(frame, screen) if block_given?
  win.frame = frame
end

# pop to top of screen, halving height
API.bind "K", move do
  move_window do |frame, screen|
    frame.h = screen.h / 2 - 24   # 24 is the titlebar of the osx app
    frame.y = 0
    frame.inset! padding, padding
  end
end

# pop to bottom of screen, halving height
API.bind "J", move do
  move_window do |frame, screen|
    frame.h = screen.h / 2
    frame.y += screen.h / 2 - 24  # 24 is the titlebar of the osx app
    frame.inset! padding, padding
  end
end

# push to left half of screen
API.bind "h", move do
  win = API.focused_window
  frame = win.screen.frame_without_dock_or_menu
  frame.w /= 2
  frame.inset! padding, padding
  win.frame = frame
end

# push to right half of screen
API.bind "l", move do
  win = API.focused_window
  frame = win.screen.frame_without_dock_or_menu
  frame.x += frame.w / 2
  frame.w /= 2
  frame.inset! padding, padding
  win.frame = frame
end


wait_on_callbacks