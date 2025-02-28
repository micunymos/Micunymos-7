Set oV = CreateObject("SAPI.SpVoice")
Set oFS = CreateObject("SAPI.SpFileStream")
oFS.Open ".\off.wav"
oV.SpeakStream oFS
oFS.Close