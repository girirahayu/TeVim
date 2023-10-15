local colors = require("themes").getCurrentTheme()

return {
	NoiceMini = { bg = colors.darker_black },
	NoiceCmdlinePopup = { bg = colors.darker_black },
	NoiceCmdlinePopupBorder = { bg = colors.darker_black, fg = colors.darker_black },
	NoiceCmdlinePopupBorderSearch = { link = "NoiceCmdlinePopupBorder" },
	NoiceCmdlinePopupTitle = { bg = colors.darker_black, fg = colors.darker_black },
	NoiceLspProgressSpinner = { fg = colors.grey_fg },
}
