import std/unittest

import uing

suite "Test FontButton":
  # setup
  init()

  let window = newWindow("FontButton Test", 200, 200)
  let fontButton = newFontButton()

  # tests
  # ?

  # teardown
  window.child = fontButton
  show window

  mainSteps()
  discard mainStep(1)

  uing.quit()
    