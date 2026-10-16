-- Hammerspoon configuration. install links ~/.hammerspoon/init.lua to this file.

hs.autoLaunch(true)

-- Reload when this file changes. The watcher follows the link to the folder in the dotfiles.
local configDir = hs.fs.pathToAbsolute(hs.configdir .. "/init.lua"):match("^(.*)/")
ConfigWatcher = hs.pathwatcher.new(configDir, hs.reload):start()

-- ⌃⌘V pastes the path of a file in place of what the clipboard holds, to hand a secret to an agent without
-- it entering the conversation. Text becomes a new file in $TMPDIR/stash/ (folder 700, file 600), and the
-- clipboard then holds that file's path instead of the text. A file copied in Finder, and text that is the
-- full path of an existing file, are pasted as that path, without a new file. macOS deletes a file of
-- $TMPDIR that has not been used for three days, and the agent deletes a stashed file once it used it.
local function stash()
  local types = hs.pasteboard.contentTypes() or {}
  if hs.fnutils.contains(types, "public.file-url") then
    -- Finder can copy a file reference instead of a path, which AppleScript turns into a path.
    local out, ok = hs.execute([[osascript -e 'POSIX path of (the clipboard as «class furl»)']])
    if ok then return (out:gsub("\n$", "")) end
    return nil, "could not read the copied file's path"
  end

  local text = hs.pasteboard.readString()
  if not text or text == "" then return nil, "the clipboard holds no text" end
  if text:sub(1, 1) == "/" and not text:find("\n") and hs.fs.attributes(text, "mode") == "file" then
    return text
  end

  local dir = (os.getenv("TMPDIR") or "/tmp/"):gsub("/$", "") .. "/stash"
  local out, ok = hs.execute("umask 077 && mkdir -p '" .. dir .. "' && chmod 700 '" .. dir .. "' && mktemp '" .. dir .. "/XXXXXXXXXX'")
  if not ok then return nil, "could not create a file in " .. dir end
  local file = out:gsub("\n$", "")
  local handle = io.open(file, "wb")
  if not handle then return nil, "could not write " .. file end
  handle:write(text)
  handle:close()
  return file
end

-- It acts when V is released: a ⌘V sent while the hotkey is still held does not paste.
hs.hotkey.bind({ "ctrl", "cmd" }, "v", nil, function()
  local file, problem = stash()
  if not file then
    hs.alert.show("⌃⌘V: " .. problem)
    return
  end
  hs.pasteboard.setContents(file)
  hs.eventtap.keyStroke({ "cmd" }, "v")
end)
