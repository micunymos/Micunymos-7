Set oV = CreateObject("SAPI.SpVoice")
Set oFS = CreateObject("SAPI.SpFileStream")
oFS.Open ".\crit.wav"
oV.SpeakStream oFS
oFS.Close