function PcanFormat()
    " 0x328 -- VER_REQ
    let l = 22
    for line in getline(22,"$")
        let identifier = ""
        let offset = 80 - strlen(line)  " Identifier placed at column 80 
        if line =~ "0328"
            " VER_REQ
            let identifier = "Version Request"
        elseif line =~ "0329"
            " VER_INFO
            let identifier = "Version Info"
        elseif line =~ "0320"
            " Open Req, get session type
            let identifier = "Open Request"
            if line =~ '\v0320\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+01'
                " Device Info
                let identifier = identifier . " (DeviceInfo) "
            elseif line =~ '\v0320\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+02'
                " Device Info
                let identifier = identifier . " (SoftwareUpdate) "
            elseif line =~ '\v0320\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+03'
                " Device Info
                let identifier = identifier . " (MfgInfo) "
            elseif line =~ '\v0320\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+04'
                " Device Info
                let identifier = identifier . " (FactorySettings) "
            elseif line =~ '\v0320\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+05'
                " Device Info
                let identifier = identifier . " (ActiveSettings) "
            elseif line =~ '\v0320\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+06'
                " Device Info
                let identifier = identifier . " (AdecMfgInfo) "
            else
                " ???
                let identifier = identifier . " (Unknown) "
            endif
        elseif line =~ "0321"
            let identifier = "Open Request ACK"
        elseif line =~ '0322'
            " Commands
            if line =~ '\v0322\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+02'
                let identifier = "Start"
            elseif line =~ '\v0322\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+03'
                let identifier = "Rcv Size"
            elseif line =~ '\v0322\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+04'
                let identifier = "Chunk Request"
            elseif line =~ '\v0322\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+05'
                let identifier = "Xfer Complete"
            elseif line =~ '\v0322\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+06'
                let identifier = "Integrity Data Send"
            elseif line =~ '\v0322\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+07'
                let identifier = "Integrity Status"
            elseif line =~ '\v0322\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+08'
                let identifier = "Error"
            elseif line =~ '\v0322\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+09'
                let identifier = "Close"
            elseif line =~ '\v0322\s+\-\s+[0-9]\s+[0-9A-Fa-f]{2}\s+0A'
                let identifier = "Close ACK"
            else
                let identifier = "Unknown Command"
            endif
        elseif line =~ "0323"
            let identifier = "Data Chunk"
        elseif line =~ "032A"
            let identifier = "Targeted Command"

            if line =~ "\v([0-9A-Fa-f]{2} ){6}01"
                let identifier = identifier . " (Reset) "
            elseif line =~ "\v([0-9A-Fa-f]{2} ){6}02"
                let identifier = identifier . " (SWUD UI Mode - "

                if line =~ "\v([0-9A-Fa-f]{2} ){6}02 01"
                    let identifier = identifier . "None)"
                elseif line =~ "\v([0-9A-Fa-f]{2} ){6}02 02"
                    let identifier = identifier . "Recommended)"
                elseif line =~ "\v([0-9A-Fa-f]{2} ){6}02 03"
                    let identifier = identifier . "Critical)"
                endif
            endif
        elseif line =~ "032B"
            let identifier = "Targeted Response"
        else
            let identifier = "Unknown Packet"
        endif

        call setline(l, line . repeat(" ", offset) . identifier)    

        " ...
        let l = l  + 1
    endfor
endfunction

command PcanFormat call PcanFormat()

nnoremap <leader>pp :PcanFormat<CR>
