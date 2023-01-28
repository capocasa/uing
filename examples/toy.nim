
# Test & show the new high level wrapper

import uing

proc main*() =
  var mainwin: Window

  var menu = newMenu("File")
  menu.addItem("Open", proc(_: MenuItem) =
    let filename = openFile(mainwin)
    if filename.len == 0:
      msgBoxError(mainwin, "No file selected", "Don't be alarmed!")
    else:
      msgBox(mainwin, "File selected", filename)
  )
  menu.addItem("Save", proc(_: MenuItem) =
    let filename = saveFile(mainwin)
    if filename.len == 0:
      msgBoxError(mainwin, "No file selected", "Don't be alarmed!")
    else:
      msgBox(mainwin, "File selected (don't worry, it's still there)", filename)
  )
  menu.addQuitItem(
    proc(): bool {.closure.} =
      mainwin.destroy()
      return true
  )

  menu = newMenu("Edit")
  menu.addCheckItem("Checkable Item")
  menu.addSeparator()
  let item = menu.addItem("Disabled Item")
  item.disable()
  menu.addPreferencesItem()
  menu = newMenu("Help")
  menu.addItem("Help")
  menu.addAboutItem()

  mainwin = newWindow("libui-ng Control Gallery", 640, 480, true)
  mainwin.margined = true

  let box = newVerticalBox(true)
  mainwin.child = box

  var group = newGroup("Basic Controls", true)
  box.add(group, false)

  var inner = newVerticalBox(true)
  group.child = inner

  inner.add newButton("Button", proc(_: Button) = msgBoxError(mainwin, "Error", "Rotec"))

  show(mainwin)
  mainLoop()

init()
main()
