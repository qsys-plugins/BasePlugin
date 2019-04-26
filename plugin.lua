-- Base Plugin
-- by QSC
-- Month 20YY

--[[ #include "info.lua" ]]

function GetColor(props)
  return { 102, 102, 102 }
end

function GetPrettyName(props)
  return "Base Plugin " .. PluginInfo.Version
end

function GetPages()
  pages = {}

  --[[ #include "pages.lua" ]]

  return pages
end

function GetProperties()
  props = {}

  --[[ #include "properties.lua" ]]

  return props
end

function GetControls(props)
  ctrls = {}

  --[[ #include "controls.lua" ]]

  return ctrls
end

function GetControlLayout(props)
  layout   = {}
  graphics = {}

  --[[ #include "layout.lua" ]]

  return layout, graphics
end

--Start event based logic
if Controls then

  --[[ #include "runtime.lua" ]]
  
end
