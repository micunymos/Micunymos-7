Set oV = CreateObject("SAPI.SpVoice")
Set oFS = CreateObject("SAPI.SpFileStream")
oFS.Open ".\err.wav"
oV.SpeakStream oFS
oFS.Close