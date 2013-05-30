-------------
global gTask, gDot, gAction, gFileXObj, gFileObj

property pTable, pEntryFormat, pNdx, pChanges

on beginSPrite me
  pNdx = 0
  me.resetEDL()

  alert("testing3")
end

on newEDL me
  me.resetEDL()
  
  mv = member(member("placeholdertemp").duplicate(6))
  mv.name = "placeholdervideo"
  
  pMember = member("cropframe")
  pMember.image = member("cropframeempty").image.duplicate()
  
  m = member("placeholder")
  m.filename = the moviePath & "placeholder.jpeg"
  m.name = "placeholder"
  
  member("processingStatus").text = "System"
  member("processing").text = "Ready"
  
  if sendAllSPrites(#getScreenRatio) then
    w = 1920
    h = 1080
  else
    w = 1620
    h = 1080
  end if
  
  sendAllSprites(#setCrop, w, h)
  sendAllSPrites(#disableSegmentButtons)
end

on openEDL me
  EDLfileName = gFileXObj.fx_FileOpenDialog(the moviePath, "CTL Files/*.CTL", "Select an CTL to open...",  false, true)
  
  if EDLfileName.length then
    pChanges = false
    
    gFileObj.openFile(EDLfileName, 1)
    
    EDL =  gFileObj.readFile()
    
    gFileObj.closeFile()
    
    lineCt = EDL.line.count
    
    member("tableDisplay").editable = false
    member("tableDisplay").font = "Courier New"
    
    pEntryFormat = [0,0,"",0,""]
    
    pTable = [:]
    
    the itemdelimiter = "|"
    
    pTable.sort()
    
    repeat with i = 1 to lineCt
      thisLine = EDL.line[i]
      
      if i < lineCt-1 then
        newEntry = pEntryFormat.duplicate()
        
        newEntry[1] = value(thisLine.item[1])
        newEntry[2] = value(thisLine.item[2])
        newEntry[3] = thisLine.item[3]
        newEntry[4] = value(thisLine.item[4])
	temp = thisLine.item[5]
	
        newEntry[5] = EDLfileName.char[1..1] & temp.char[2..temp.length]  
        
        pTable.addProp(newEntry[1], newEntry)
      else
        videoPath = EDL.line[lineCt-1]
        
        EDLpath = pTable[1][5]
        EDLpath = EDLpath.char[1..offset(".wmv", EDLpath)+3]
        
        bool = EDL.line[lineCt]
        sendAllSprites(#setRatio, value(bool))
        
        bool = false
        if (member(6).filename = EDLpath) then
          bool = true
        end if
        
        sendAllSprites(#loadVideo, EDLpath, bool) 
        
        sendAllSprites(#resetTable)
      end if
    end repeat
    
    the itemdelimiter = ","
    
    sendAllSPrites(#disableSegmentButtons)
    sendAllSPrites(#enablePlayAllButton)
    
    me.displayTable()
  end if
end

on resetEDL me
  member("tableDisplay").editable = false
  member("tableDisplay").font = "Courier New"
  
  pMember = member("cropframe")
  pMember.image = member("cropframeempty").image.duplicate()
  
  m = member("placeholder")
  m.filename = the moviePath & "placeholder.jpeg"
  m.name = "placeholder"
  
  pChanges = false
  
  pEntryFormat = [0,0,"",0,""]
  
  pTable = [:]
  
  pTable.sort()
  
  sendAllSPrites(#disableSegmentButtons)
  sendAllSPrites(#disablePlayAllButton)
  
  me.displayTable()
end

on mouseUp me
  me.addEntry()
end

on addEntry me
  newEntry = pEntryFormat.duplicate()
  
  newEntry[1] = sendAllSprites(#getInPt)
  newEntry[2] = sendAllSprites(#getOutPt)
  newEntry[3] = sendAllSprites(#getCropRect)
  newEntry[4] = sendAllSprites(#getCropFrame)
  newEntry[5] = sendAllSprites(#getImagePath)
  
  if newEntry[5].length then
    pChanges = true
    pTable.addProp(newEntry[1], newEntry)
    sendAllSPrites(#disableSegmentButtons)
    sendAllSPrites(#enablePlayAllButton)
  end if
  
  me.displayTable()
end

on editSegement me
  ndx = sendAllSprites(#getSelectedEntry)
  
  if ndx > 0 then
    if ndx > pTable.count then
      return 0
    end if
  else
    return 0
  end if
  
  newEntry = pEntryFormat.duplicate()
  
  newEntry[1] = sendAllSprites(#getInPt)
  newEntry[2] = sendAllSprites(#getOutPt)
  newEntry[3] = sendAllSprites(#getCropRect)
  newEntry[4] = sendAllSprites(#getCropFrame)
  newEntry[5] = sendAllSprites(#getImagePath)
  
  if newEntry[5].length then
    pChanges = true
    pTable.deleteAt(ndx)
    pTable.addProp(newEntry[1], newEntry)
    sendAllSPrites(#disableSegmentButtons)
    sendAllSPrites(#enablePlayAllButton)
  end if
  
  me.displayTable()
end

on changes me
  return pChanges
end

on processEDLfile me, bool  
  EDLpath =  member(6).filename
  
  the itemdelimiter = ","
  
  EDL = ""
  
  screenResolutionTable = ["720x480","854x480","1080x720","1620x1080","1280x720","1440x960","1920x1080"]
  sr = screenResolutionTable.count
  
  repeat with data in pTable 
    sr = min(screenResolutionTable.getPos(data[3]), sr)    
  end repeat
  
  screenResolution = ["720x480":"720:480","854x480":"720:480","1080x720":"720:480","1620x1080":"720:480","1280x720":"1280:720","1440x960":"1280x720","1920x1080":"1280x720"][screenResolutionTable[sr]]
  
  recordCtr = 0
  
  repeat with data in pTable 
    cropRect = sendAllSprites(#cropFiles, value(data[4]))
    
    EDLpath = data[5].char[1..offset(".wmv", data[5])-1]
    
    if EDLpath = "" then next repeat
    
    recordCtr = recordCtr + 1
    
    cropSize = "-filter:v" && QUOTE & "crop=" & cropRect[3] - cropRect[1] & ":" &  cropRect[4] - cropRect[2] & ":" & cropRect[1] & ":" & cropRect[2] & " ,scale=" & screenResolution & QUOTE
    
    codec = "-vcodec libx264 -b:v 2000k"
    
    seekpoint = integer(data[1]/1000.00)
    --seekpoint = integer(data[1]/33.3333)
    
    delta = integer((data[2] - data[1])/33.3333)
    
    cmd = "ffmpeg64\bin\ffmpeg -i" && EDLpath && "-y audio.mp3" & numtochar(13) & numtochar(10)
    
    -- audio requires seconds
    cmd = cmd & "ffmpeg64\bin\ffmpeg -ss" && seekpoint && "-i audio.mp3" && "-t" && integer(delta/29.97) && "-acodec copy -y crop_audio.mp3" & numtochar(13) & numtochar(10)
    
    -- video likes frames
    cmd = cmd & "ffmpeg64\bin\ffmpeg -ss" && seekpoint && "-i" && EDLpath && "-frames:v" && delta && codec && cropSize && "-y crop_video.mp4" & numtochar(13) & numtochar(10)
    
    -- put video first then audio
    cmd = cmd & "ffmpeg64\bin\ffmpeg -shortest -i crop_video.mp4 -i crop_audio.mp3 -vcodec copy -acodec copy" && "-y" && EDLpath & "_" & padZeros(seekpoint) & "_crop.mp4" & numtochar(13) & numtochar(10)


    -- audio requires seconds
    -- cmd = cmd & "ffmpeg64\bin\ffmpeg" && "-ss" && framesToHMS(seekpoint, 29.97, FALSE, FALSE) && "-i audio.mp3" && "-t" && framesToHMS(delta, 29.97, FALSE, FALSE) && "-acodec copy crop_audio.mp3" & numtochar(13) & numtochar(10)
    
    -- video likes frames
    -- cmd = cmd & "ffmpeg64\bin\ffmpeg" && "-ss" && framesToHMS(seekpoint, 29.97, FALSE, FALSE) && "-i" && EDLpath && "-t" && framesToHMS(delta, 29.97, FALSE, FALSE) && codec && cropSize && "-y crop_video.mp4" & numtochar(13) & numtochar(10)
    
    -- put video first then audio
    -- cmd = cmd & "ffmpeg64\bin\ffmpeg -shortest -i crop_video.mp4 -i audio.mp3 -vcodec copy -acodec copy" && "-y" && EDLpath & "_" & padZeros(seekpoint) & "_crop.mp4" & numtochar(13) & numtochar(10)

    debugMode = "REM "

    cmd = cmd & debugMode & "cd" && the moviepath && numtochar(13) & numtochar(10)
    
    cmd = cmd & debugMode & "del audio.mp3" && numtochar(13) & numtochar(10)
    
    cmd = cmd & debugMode & "del crop_audio.mp3" && numtochar(13) & numtochar(10)
    
    cmd = cmd & debugMode & "del crop_video.mp4"
    
    if EDL = "" then
      EDL = cmd
    else
      EDL = EDL && numtochar(13) & numtochar(10) & numtochar(13) & numtochar(10) & cmd   
    end if
  end repeat
  
  if recordCtr then
    processBatFile(EDL, "Crop and Trim", bool)
  end if
end

on saveEDLfile me
  EDLpath =  member(6).filename
  
  fullPath = EDLpath
  
  the itemdelimiter = "\"
  
  EDLname = EDLpath.item[EDLpath.item.count]
  
  EDLpath = EDLpath.item[1..EDLpath.item.count-1]
  
  EDLname = EDLname.char[1..EDLpath.length-2] & ".ctl"
  
  EDLfileName = gFileXObj.fx_FileSaveAsDialog(EDLpath, EDLname, "Save Crop and Trim List file as...", true)
  
  if EDLfileName.length > 8 then
    if EDLfileName.char[EDLfileName.length - 3..EDLfileName.length] <> ".ctl" then
      EDLfileName = EDLfileName & ".ctl"
    end if
  else
    return false
  end if
  
  if gFileXObj.fx_FileExists(EDLfileName) then
    gFileXObj.fx_FileDelete(EDLfileName)
  else if EDLpath = "" then
    return false
  end if
  
  gFileObj.createFile(EDLfileName)
  gFileObj.openFile(EDLfileName, 2)
  
  the itemdelimiter = ","
  
  EDL = ""
  
  first = true
  
  repeat with data in pTable 
    
    if first then
      first = not(first)
      EDL = data[1] & "|" & data[2] & "|" & data[3] & "|" & data[4] & "|" & data[5]  
    else
      EDL = EDL & RETURN & data[1] & "|" & data[2] & "|" & data[3] & "|" & data[4] & "|" & data[5]  
    end if
    
  end repeat
  
  screenResolution = sendAllSPrites(#getScreenRatio)
  
  EDL = EDL & RETURN & fullPath & RETURN & screenResolution
  
  gFileObj.writeString(EDL)
  
  gFileObj.closeFile()

  pChanges = false
end

on deleteEntry me, ndx
  ndx = sendAllSprites(#getSelectedEntry)
  
  if ndx <= pTable.count then
    pTable.deleteAt(ndx)
    pChanges = true
    me.displayTable()
    sendAllSPrites(#disableSegmentButtons)
  end if
end

on getSegements me
  return pTable.count
end


on getSelectionData me
  ndx = sendAllSPrites(#getSelectedEntry)
  
  if ndx and pTable.count then
    return pTable[ndx] 
  else
    return []
  end if 
end

on displayTable me
  pTable.sort()
  
  str = ""
  repeat with entry in pTable 
    str = str && addSpace(me.modifiedPt(entry[1]), 22) & addSpace(me.modifiedPt(entry[2]), 24) & addSpace(entry[3], 27) & addSpace(string(entry[4]), 28) & entry[5]
    str = str & RETURN
  end repeat
  
  str = str.line[1..str.line.count-1]
  
  member("tableDisplay").text = str
  member("tableDisplay").color = rgb(0, 0, 0)
  member("tableDisplay").fontStyle = [#normal]
end

on modifiedPt me, raw
  raw = raw/33.3333
  
  str = framesToHMS(raw, 29.97, FALSE, FALSE)
  
  return str
end 