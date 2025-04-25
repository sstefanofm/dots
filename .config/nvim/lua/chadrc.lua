-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "carbonfox",
  theme_toggle = { "carbonfox", "everforest_light" },
	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.ui = {
  statusline = { },
}

local nvdash_headers = {
  require "nvdash_headers.bat",
  require "nvdash_headers.chan",
  require "nvdash_headers.death",
  require "nvdash_headers.devil_1",
  require "nvdash_headers.devil_2",
  require "nvdash_headers.devil_pentagram",
  require "nvdash_headers.devil_woman",
  require "nvdash_headers.las_plagas",
  require "nvdash_headers.lightning",
  require "nvdash_headers.mortal_kombat",
  require "nvdash_headers.pentagram",
  require "nvdash_headers.skull",
  require "nvdash_headers.skull_headless",
  require "nvdash_headers.skull_sword",
  require "nvdash_headers.skull_warrior",
  require "nvdash_headers.weed",
  require "nvdash_headers.ying_yang",
}

local rand = function()
  math.randomseed(os.time())
  return math.random(#nvdash_headers)
end

M.nvdash = {
  load_on_startup = true,
  header = nvdash_headers[rand()]
}

return M
