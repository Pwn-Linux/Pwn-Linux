//Create left panel
panel = new Panel
panel.location = "left"
panel.floating = false
panel.height = gridUnit * 3.2
//Add widgets to the left panel
var menu = panel.addWidget("org.kde.plasma.kickerdash")
//Add default shortcut to the kickerdash menu
menu.currentConfigGroup = ["Shortcuts"]
menu.writeConfig("global", "Alt+F1")
//Icontasks
panel.addWidget("org.kde.plasma.icontasks")
//Present Windows Button https://store.kde.org/p/1181039/
var windows = panel.addWidget("com.himdek.kde.plasma.overview")
//windows.writeConfig("clickCommand","ShowDesktopGrid")
//Trash
panel.addWidget("org.kde.plasma.trash")


//Create top panel
toppanel = new Panel
toppanel.location = "top"
toppanel.alignment = "left"
toppanel.floating = false
toppanel.height = gridUnit * 2
toppanel.offset=panel.height
//Add widgets to the top panel

var spacer = toppanel.addWidget("org.kde.plasma.panelspacer")
//Make first spacer non expandable by default
spacer.currentConfigGroup = ["Configuration", "General"]
spacer.writeConfig("expanding", false)

//Kickerdash
toppanel.addWidget("org.kde.plasma.appmenu")
//Spacer
toppanel.addWidget("org.kde.plasma.panelspacer")
//System tray
toppanel.addWidget("org.kde.plasma.systemtray")
//Clock
toppanel.addWidget("org.kde.plasma.digitalclock")

var uswitcher= toppanel.addWidget("com.dv.uswitcher")
uswitcher.currentConfigGroup = ["Configuration", "General"]
uswitcher.writeConfig("showName", false)
uswitcher.writeConfig("showSett", true)