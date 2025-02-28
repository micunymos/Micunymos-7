Set oV = CreateObject("SAPI.SpVoice")
Set oFS = CreateObject("SAPI.SpFileStream")
oFS.Open ".\disconnect.wav"
oV.SpeakStream oFS
oFS.Close