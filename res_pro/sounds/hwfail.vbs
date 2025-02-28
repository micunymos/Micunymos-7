Set oV = CreateObject("SAPI.SpVoice")
Set oFS = CreateObject("SAPI.SpFileStream")
oFS.Open ".\hwfail.wav"
oV.SpeakStream oFS
oFS.Close