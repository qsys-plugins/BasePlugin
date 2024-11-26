-- Base Plugin
-- by
-- Month 20YY

--[[ #include "info.lua" ]]

function GetColor(props)
  return { 102, 102, 102 }
end

function GetPrettyName(props)
  return "Base Plugin " .. PluginInfo.Version
end

--[=[]]
function GetPages(props) --optional function if plugin has multiple pages
  local pages = {}
  --[[ #include "pages.lua" ]]
  return pages
end

function GetModel(props) --optional function to define model if plugin supports more than one model
  local model = {}
  --[[ #include "model.lua" ]]
  return model
end
--]=]

function GetProperties()
  local props = {}
  --[[ #include "properties.lua" ]]
  return props
end

function GetControls(props)
  local ctrls = {}
  --[[ #include "controls.lua" ]]
  return ctrls
end

function GetControlLayout(props)
  local layout   = {}
  local graphics = {}
  --[[ #include "layout.lua" ]]
  return layout, graphics
end

--Start event based logic
if Controls then
  --[[ #include "runtime.lua" ]]
end