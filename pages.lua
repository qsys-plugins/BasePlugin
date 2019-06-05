--[[ Pages File Contents ]]
if props["Model"].Value=="Model 1" then
  table.insert(pages, {name = pagenames[1]}) -- Only the "Mixer" pages shows for Model 1
else
  for ix,name in ipairs(pagenames) do
    table.insert(pages,{ name = pagenames[ix] }) -- All pages in 'pagenames' show for Model 2
  end
end