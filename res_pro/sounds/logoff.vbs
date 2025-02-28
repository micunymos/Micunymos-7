Set oV = CreateObject("SAPI.SpVoice")
Set oFS = CreateObject("SAPI.SpFileStream")
oFS.Open ".\logoff.wav"
oV.SpeakStream oFS
oFS.Close