Set oV = CreateObject("SAPI.SpVoice")
Set oFS = CreateObject("SAPI.SpFileStream")
oFS.Open ".\connect.wav"
oV.SpeakStream oFS
oFS.Close