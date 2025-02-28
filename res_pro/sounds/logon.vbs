Set oV = CreateObject("SAPI.SpVoice")
Set oFS = CreateObject("SAPI.SpFileStream")
oFS.Open ".\logon.wav"
oV.SpeakStream oFS
oFS.Close