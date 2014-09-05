/*
 * ThemeGray by Ian Reyes and Heng Yuan
 */
/*
 * ThemeSVT mod by MGismo
 */


var cmThemeSVT =
{
	prefix:	'ThemeSVT',
  	// main menu display attributes
  	//
  	// Note.  When the menu bar is horizontal,
  	// mainFolderLeft and mainFolderRight are
  	// put in <span></span>.  When the menu
  	// bar is vertical, they would be put in
  	// a separate TD cell.

  	// HTML code to the left of the folder item
  	mainFolderLeft: '',
  	// HTML code to the right of the folder item
  	mainFolderRight: '',
	// HTML code to the left of the regular item
	mainItemLeft: '',
	// HTML code to the right of the regular item
	mainItemRight: '',

	// sub menu display attributes

	// HTML code to the left of the folder item
	folderLeft: '&lt;',
	// HTML code to the right of the folder item
	folderRight: '>',
	// HTML code to the left of the regular item
	itemLeft: '&nbsp;',
	// HTML code to the right of the regular item
	itemRight: '&nbsp;',
	// cell spacing for main menu
	mainSpacing: 1,
	// cell spacing for sub menus
	subSpacing: 0,
	// auto dispear time for submenus in milli-seconds
	delay: 200

	// rest use default settings
};

// for sub menu horizontal split
var cmThemeSVTHSplit = [_cmNoClick, '<td colspan="3" class="ThemeSVTMenuSplit"><div class="ThemeSVTMenuSplit"></div></td>'];
// for vertical main menu horizontal split
var cmThemeSVTMainHSplit = [_cmNoClick, '<td colspan="3" class="ThemeSVTMenuSplit"><div class="ThemeSVTMenuSplit"></div></td>'];
// for horizontal main menu vertical split
var cmThemeSVTMainVSplit = [_cmNoClick, '|'];
