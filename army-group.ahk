#Requires AutoHotkey v2.0

; Runs only if SC2_x64.exe is focused
#HotIf WinActive("ahk_exe SC2_x64.exe")

ShiftClickCenter() {
    ScreenWidth := A_ScreenWidth
    ScreenHeight := A_ScreenHeight
    CenterX := ScreenWidth // 2
    CenterY :=  (ScreenHeight // 2) - 20 
    MouseMove(CenterX, CenterY)

    Sleep(1)
    Send("{Shift down}")
    Click
    Send("{Shift up}")
}

; Define the macro "armygroup"
armygroup() {
    Send "{;}"                     ; Select All Army Hotkey
    Send "^3"                      ; Assign Selected Units To Hotkey 3
    Send("00")                     ; Center screen on Hotkey 0
    ShiftClickCenter()             ; Deselects the centered unit 
    Send "4"                       ; Select Hotkey 4
    Send "!+4"                     ; Steal and Add Selected Units To Hotkey 4
    Send "^4"                      ; Assign Selected Units To Hotkey 4
    Send "5"                       ; Select Hotkey 5
    Send "!+5"                     ; Steal and Add Selected Units To Hotkey 5
    Send "^5"                      ; Assign Selected Units To Hotkey 5
    Send("33")                     ; Center on Hotkey 3
}

+F2::armygroup                     

#HotIf                             
