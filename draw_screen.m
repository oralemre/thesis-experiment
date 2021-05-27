function [time1, time2, point1x, point1y, point2x, point2y,match] = draw_screen(w, Wcenter, Hcenter, ...
    screen_id, texture, data_file,text1,text2,text_w2,text_w3,text_w4,text_w5) 
    time1 = 1;
    time2 = 1;
    match = -1;
    fl = 20;
    point1x = 100;
    point1y = 200;
    point2x = 100;
    point2y = 200;
    if screen_id == 1
        while 1
            Priority(MaxPriority(w));
            Priority(2);
            [keyIsDown,secs,keyCode] = KbCheck;
            Screen(w,'FillRect',[128,128,128]);
            Screen('DrawTexture',w,texture);
            Screen('Flip', w);
            if keyCode(KbName('space')) == 1
                KbReleaseWait();
                break;
            elseif keyCode(KbName('ESCAPE')) == 1
                KbReleaseWait();
                %clear all
                %close all
                sca
                return;
            end
        end
    elseif screen_id == 2
        t1s = size(text1,2)/2;     
        t2s = size(text2,2)/2; 
        Screen(w,'TextSize',20);
        Screen(w,'FillRect',[128,128,128]);
        r = randi([1,2]);
        
        if r == 1
             Screen('DrawText',w,text1,1,10)
             Screen('DrawText',w,text2,1,40)
             
             text1_w = 1;
             text1_h = 10;
             text2_w = 1;
             text2_h = 40;

             text1_l = 1;
             text1_r = t1s*20;
             text1_u = 10;
             text1_d = 35;

             text2_l = 1;
             text2_r = t2s*20;
             text2_u = 40;
             text2_d = 65;
        
             
        elseif r == 2
             Screen('DrawText',w,text2,1,10)
             Screen('DrawText',w,text1,1,40)
             
             text2_w = 1;
             text2_h = 10;
             text1_w = 1;
             text1_h = 40;

             text2_l = 1;
             text2_r = t1s*20;
             text2_u = 10;
             text2_d = 35;

             text1_l = 1;
             text1_r = t2s*20;
             text1_u = 40;
             text1_d = 65;
             
        end
        
        

        click = 0;
        
        Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter-256,Wcenter-320,Hcenter+256)
        Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256,Wcenter+320,Hcenter+256)
        Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+20,Wcenter+320,Hcenter+256+20)
        Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+20,Wcenter-320,Hcenter+256+60)
        Screen(w,'DrawLine',[0,0,0],Wcenter+320,Hcenter+256+20,Wcenter+320,Hcenter+256+60)
        Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+60,Wcenter+320,Hcenter+256+60)
        Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter,Wcenter+120,Hcenter)
        Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter+40,Wcenter+120,Hcenter+40)
        Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter,Wcenter-320-200,Hcenter+40)
        Screen(w,'DrawLine',[0,0,0],Wcenter+120,Hcenter,Wcenter+120,Hcenter+40)
        Screen('Flip',w);
        
        xl = Wcenter-320;
        xr = Wcenter+320;
        xu = Hcenter+256+20; 
        xd = Hcenter+256+60;

        yl = Wcenter-320-200;
        yr = Wcenter+120;        
        yu = Hcenter;
        yd = Hcenter+40;
        ShowCursor('Arrow')
        SetMouse(Wcenter,Hcenter,w)
        
        while 1
        
            [theX, theY, buttons] = GetMouse(w);

            if buttons(1)
                %startTime = GetSecs; % first click
                click = 1;
            end

            if theX > text1_l && theX < text1_r && theY < text1_d && theY > text1_u

                while buttons(1)
                    [x,y,buttons] = GetMouse(w);
                    Screen(w,'TextSize',20);
                    Screen(w,'FillRect',[128,128,128]);
                    Screen('DrawText',w,text1,x,y);
                    Screen('DrawText',w,text2,text2_w,text2_h);
                    text1_w = x;
                    text1_h = y;

                    text1_l = text1_w;
                    text1_r = text1_w + t1s*20 -1;
                    text1_u = text1_h;
                    text1_d = text1_h + 25;            

                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter-256,Wcenter-320,Hcenter+256)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256,Wcenter+320,Hcenter+256)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+20,Wcenter+320,Hcenter+256+20)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+20,Wcenter-320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter+320,Hcenter+256+20,Wcenter+320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+60,Wcenter+320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter,Wcenter+120,Hcenter)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter+40,Wcenter+120,Hcenter+40)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter,Wcenter-320-200,Hcenter+40)
                    Screen(w,'DrawLine',[0,0,0],Wcenter+120,Hcenter,Wcenter+120,Hcenter+40)
                    Screen('Flip', w);
                end
            elseif theX > text2_l && theX < text2_r && theY < text2_d && theY > text2_u    
                while buttons(1)
                    [x,y,buttons] = GetMouse(w);
                    Screen(w,'TextSize',20);
                    Screen(w,'FillRect',[128,128,128]);
                    Screen('DrawText',w,text2,x,y);
                    Screen('DrawText',w,text1,text1_w,text1_h);
                    text2_w = x;
                    text2_h = y;

                    text2_l = text2_w;
                    text2_r = text2_w + t2s*20 - 1;
                    text2_u = text2_h;
                    text2_d = text2_h + 25;

                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter-256,Wcenter-320,Hcenter+256)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256,Wcenter+320,Hcenter+256)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+20,Wcenter+320,Hcenter+256+20)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+20,Wcenter-320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter+320,Hcenter+256+20,Wcenter+320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+60,Wcenter+320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter,Wcenter+120,Hcenter)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter+40,Wcenter+120,Hcenter+40)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter,Wcenter-320-200,Hcenter+40)
                    Screen(w,'DrawLine',[0,0,0],Wcenter+120,Hcenter,Wcenter+120,Hcenter+40)
                    Screen('Flip', w);
                end
            else
                click = 0;
            end

            if click == 1
                if (text1_w >= xl && text1_w <= xr && text1_h >= xu && text1_h <= xd) ...
                    && (text2_w >= yl && text2_w <= yr && text2_h >= yu && text2_h <= yd)
                    match = 1;
                    Screen(w,'TextSize',20);
                    Screen(w,'FillRect',[128,128,128]);
                    Screen('DrawText',w,text2,text2_w,text2_h);
                    Screen('DrawText',w,text1,text1_w,text1_h);
                    Screen('DrawText',w,text_w4,Wcenter-size(text_w4,2)/2*10,Hcenter*2 - 40); 
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter-256,Wcenter-320,Hcenter+256)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256,Wcenter+320,Hcenter+256)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+20,Wcenter+320,Hcenter+256+20)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+20,Wcenter-320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter+320,Hcenter+256+20,Wcenter+320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+60,Wcenter+320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter,Wcenter+120,Hcenter)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter+40,Wcenter+120,Hcenter+40)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter,Wcenter-320-200,Hcenter+40)
                    Screen(w,'DrawLine',[0,0,0],Wcenter+120,Hcenter,Wcenter+120,Hcenter+40)
                    Screen('Flip', w);
                    [~, keyCode] = KbWait([],2);

                    Screen('DrawText',w,text1,Wcenter - t1s*5,Hcenter+256+5)
                    %Screen('DrawText',window,text2,Wcenter - 320 - t2s*10,Hcenter-5)
                    DrawFormattedText2(text2,'win',w,'sx',Wcenter-320-30,'sy',Hcenter,'xalign','center','yalign','bottom','xlayout','center','transform',{'rotate',270});
                    Screen('DrawText',w,text_w2,Wcenter-size(text_w2,2)/2*10,Hcenter*2 - 40,[0,255,0]);
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter-256,Wcenter-320,Hcenter+256)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256,Wcenter+320,Hcenter+256)
                    Screen('Flip',w);
                    [~, keyCode] = KbWait([],2);

                    break;      
                elseif (text2_w >= xl && text2_w <= xr && text2_h >= xu && text2_h <= xd) ...
                    && (text1_w >= yl && text1_w <= yr && text1_h >= yu && text1_h <= yd)
                    match = 0;
                    Screen(w,'TextSize',20);
                    Screen(w,'FillRect',[128,128,128]);
                    Screen('DrawText',w,text2,text2_w,text2_h);
                    Screen('DrawText',w,text1,text1_w,text1_h);
                    Screen('DrawText',w,text_w4,Wcenter-size(text_w4,2)/2*10,Hcenter*2 - 40); 
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter-256,Wcenter-320,Hcenter+256)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256,Wcenter+320,Hcenter+256)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+20,Wcenter+320,Hcenter+256+20)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+20,Wcenter-320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter+320,Hcenter+256+20,Wcenter+320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+60,Wcenter+320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter,Wcenter+120,Hcenter)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter+40,Wcenter+120,Hcenter+40)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter,Wcenter-320-200,Hcenter+40)
                    Screen(w,'DrawLine',[0,0,0],Wcenter+120,Hcenter,Wcenter+120,Hcenter+40)
                    Screen('Flip', w);
                    [~, keyCode] = KbWait([],2);

                    Screen('DrawText',w,text1,Wcenter - t1s*5,Hcenter+256+5)
                    %Screen('DrawText',window,text2,Wcenter - 320 - t2s*10,Hcenter-5)
                    DrawFormattedText2(text2,'win',w,'sx',Wcenter-320-30,'sy',Hcenter,'xalign','center','yalign','bottom','xlayout','center','transform',{'rotate',270});
                    Screen('DrawText',w,text_w3,Wcenter-size(text_w3,2)/2*10,Hcenter*2 - 40,[255,0,0]);
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter-256,Wcenter-320,Hcenter+256)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256,Wcenter+320,Hcenter+256)
                    Screen('Flip',w);
                    [~, keyCode] = KbWait([],2);

                    break;
                else
                    Screen(w,'TextSize',20);
                    Screen(w,'FillRect',[128,128,128]);
                    Screen('DrawText',w,text2,text2_w,text2_h);
                    Screen('DrawText',w,text1,text1_w,text1_h); 
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter-256,Wcenter-320,Hcenter+256)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256,Wcenter+320,Hcenter+256)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+20,Wcenter+320,Hcenter+256+20)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+20,Wcenter-320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter+320,Hcenter+256+20,Wcenter+320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256+60,Wcenter+320,Hcenter+256+60)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter,Wcenter+120,Hcenter)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter+40,Wcenter+120,Hcenter+40)
                    Screen(w,'DrawLine',[0,0,0],Wcenter-320-200,Hcenter,Wcenter-320-200,Hcenter+40)
                    Screen(w,'DrawLine',[0,0,0],Wcenter+120,Hcenter,Wcenter+120,Hcenter+40)
                    Screen('Flip', w);
                    click = 0;
                end
            end

        end
        HideCursor();
    elseif screen_id == 3
        data = csvread(data_file);
        x = data(:,1) - 320;
        y = data(:,2) - 256;
        data = [x,y];
        
        
        t1s = size(text1,2)/2;     
        t2s = size(text2,2)/2; 
        Screen(w,'TextSize',20);
        Screen(w,'FillRect',[128,128,128]);
        Screen('DrawText',w,text1,Wcenter - t1s*5,Hcenter+256+5,[0,0,0])
        %Screen('DrawText',window,text2,Wcenter - 320 - t2s*10,Hcenter-5)
        DrawFormattedText2(text2,'win',w,'sx',Wcenter-320-30,'sy',Hcenter,'xalign','center','yalign','bottom','xlayout','center','transform',{'rotate',270});
        Screen(w,'DrawLine',[0,255,0],Wcenter,Hcenter,Wcenter-fl,Hcenter)
        Screen(w,'DrawLine',[0,255,0],Wcenter,Hcenter,Wcenter+fl,Hcenter)
        Screen(w,'DrawLine',[0,255,0],Wcenter,Hcenter,Wcenter,Hcenter-fl)
        Screen(w,'DrawLine',[0,255,0],Wcenter,Hcenter,Wcenter,Hcenter+fl)
        %Screen('DrawText',window,['Trial Screen ',num2str(i)],0,round(H/2),[255,255,255])
        Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter-256,Wcenter-320,Hcenter+256)
        Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256,Wcenter+320,Hcenter+256)
        gft = Screen('Flip',w); % green fixation start time

        Screen(w,'FillRect',[128,128,128]);

        Screen('DrawText',w,text1,Wcenter - t1s*5,Hcenter+256+5)
        %Screen('DrawText',window,text2,Wcenter - 320 - t2s*10,Hcenter-5)
        DrawFormattedText2(text2,'win',w,'sx',Wcenter-320-30,'sy',Hcenter,'xalign','center','yalign','bottom','xlayout','center','transform',{'rotate',270});
        Screen(w,'DrawLine',[255,0,0],Wcenter,Hcenter,Wcenter-fl,Hcenter)
        Screen(w,'DrawLine',[255,0,0],Wcenter,Hcenter,Wcenter+fl,Hcenter)
        Screen(w,'DrawLine',[255,0,0],Wcenter,Hcenter,Wcenter,Hcenter-fl)
        Screen(w,'DrawLine',[255,0,0],Wcenter,Hcenter,Wcenter,Hcenter+fl)
        %Screen('DrawText',window,['Trial Screen ',num2str(i)],0,round(H/2),[255,255,255])
        Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter-256,Wcenter-320,Hcenter+256)
        Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256,Wcenter+320,Hcenter+256)
        rft = Screen('Flip',w,gft+0.5); % green fixation start time

        % y 256 yukari sinir 768 alt sinir
        % x 320 ve 960 yan sinirlar
        % En az 6 pixel fark noktalar arasinda

        Priority(MaxPriority(w));
        Priority(2);

        Screen(w,'FillRect',[128,128,128]);
        %Screen('DrawText',window,['Trial Screen ',num2str(i)],0,round(H/2),[255,255,255])


        Screen('DrawText',w,text1,Wcenter - t1s*5,Hcenter+256+5)
        %Screen('DrawText',window,text2,Wcenter - 320 - t2s*20,Hcenter-5)
        DrawFormattedText2(text2,'win',w,'sx',Wcenter-320-30,'sy',Hcenter,'xalign','center','yalign','bottom','xlayout','center','transform',{'rotate',270});
        Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter-256,Wcenter-320,Hcenter+256)
        Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256,Wcenter+320,Hcenter+256)

        for j = 1:20
            Screen(w,'DrawDots',[data(j,1) + (Wcenter - 320), 512 - data(j,2) + (Hcenter - 256)],5,0)
        end
        %Screen(window,'DrawDots',[10,11.9],4,0)
        %Screen(window,'DrawDots',[10,16.9],4,0)
        tt = Screen('Flip', w,rft + 0.5); % each trial onset


        Screen(w,'FillRect',[128,128,128]);


        Screen('DrawText',w,text1,Wcenter - t1s*5,Hcenter+256+5)
        %Screen('DrawText',window,text2,Wcenter - 320 - t2s*10,Hcenter-5)
        DrawFormattedText2(text2,'win',w,'sx',Wcenter-320-30,'sy',Hcenter,'xalign','center','yalign','bottom','xlayout','center','transform',{'rotate',270});
        Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter-256,Wcenter-320,Hcenter+256)
        Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256,Wcenter+320,Hcenter+256)
        rst = Screen('Flip',w,tt+0.25); % response start time
        ShowCursor('Arrow')
        SetMouse(Wcenter,Hcenter,w)
        % Response part   
        %clear screen

    %     while (1)
    %         [x,y,buttons] = GetMouse(window);
    %         if buttons(1)
    %         %if buttons(1) && x <= upper_limitX && x >= lower_limitX && y <= upper_limitY && y >= lower_limitY
    %             startTime = GetSecs;
    %             break;
    %         end
    %     end

        click = 0;
        %while buttons(1)
        while 1

            [theX, theY, buttons] = GetMouse(w);

            if buttons(1)
                startTime = GetSecs; % first click
                click = 1;
            end

            while buttons(1)

                [x,y,buttons] = GetMouse(w);
                Screen(w,'FillRect',[128,128,128]);
                %[nx, ny, bbox] = DrawFormattedText(window,'Variable 1', 'center','center', 0, [],[],[],[],[],[Wcenter - vbhs/2,Hcenter + 256 + 5,vbhs,vbvs]);
                %Screen('FrameRect', window, 0, bbox);
                %[nx2, ny2, bbox2] = DrawFormattedText(window,'Variable 2', 'center','center', 0, [],[],[],[],[],[Wcenter - 320 - 5 - vbhs,Hcenter - vbvs/2,vbhs,vbvs]);
                %Screen('FrameRect', window, 0, bbox2);

                Screen('DrawText',w,text1,Wcenter - t1s*5,Hcenter+256+5)
                %Screen('DrawText',window,text2,Wcenter - 320 - t2s*10,Hcenter-5)
                DrawFormattedText2(text2,'win',w,'sx',Wcenter-320-30,'sy',Hcenter,'xalign','center','yalign','bottom','xlayout','center','transform',{'rotate',270});      


                %[nx, ny, bbox] = DrawFormattedText(window,'Variable 1', 'justifytomax',, 0, [],[],[],[],[],[570,630,vbhs,vbvs]);
                %Screen('FrameRect', window, 0, bbox); 
                %[nx2, ny2, bbox2] = DrawFormattedText(window,'Variable 2', 'justifytomax',, 0, [],[],[],[],[],[Wcenter - 320 - 5 - vbhs,Hcenter - vbvs/2,vbhs,vbvs]);
                %Screen('FrameRect', window, 0, bbox2);
                Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter-256,Wcenter-320,Hcenter+256)
                Screen(w,'DrawLine',[0,0,0],Wcenter-320,Hcenter+256,Wcenter+320,Hcenter+256)
                Screen(w,'DrawLine',0,theX,theY,x,y);
                Screen('Flip', w);
                %end    

            end

            if click == 1
                break;
            end
       end

       finishTime = GetSecs;
       time1 = startTime - rst;
       time2 = finishTime - startTime;
       point1x = theX;
       point1y = theY;
       point2x = x;
       point2y = y;
       HideCursor();
    end