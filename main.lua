require "cyberessentials/cyberessentials"

WhereAmI()
MoveForward(10)
GoUp(10)
GoDown(10)
Back()
Warp("V's Apartment")
SetWarp("test_warp")
SetWarp("secondary", "-75.815399", "-113.607819", "111.161728")
ListWarps()
RemoveWarp("test_warp")
RemoveWarp("secondary")