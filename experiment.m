init_exp
pres = zeros(30,7);

for i = 1:5
    draw_screen(window, Wcenter,Hcenter,1,ins_buff(i))
end

for i = 1:6 
    draw_screen(window, Wcenter,Hcenter,3,[],trdf{i,1},'','',text_w2,text_w3,text_w4,text_w5);
end

while 1                                                                                                        
    Priority(MaxPriority(window));                                                                                                           
    Priority(2);
    [keyIsDown,secs,keyCode] = KbCheck;
    Screen(window,'FillRect',[128,128,128]);
    Screen('DrawTexture',window,ins10);
    Screen('Flip', window);
    if keyCode(KbName('space')) == 1
        KbReleaseWait();      
        break;
    elseif keyCode(KbName('r')) == 1
        KbReleaseWait();
        draw_screen(window, Wcenter,Hcenter,3,[],trdf{randi([1,6]),1},'','',text_w2,text_w3,text_w4,text_w5);        
    end
end

for i = 1:4
    draw_screen(window, Wcenter,Hcenter,1,ins_buff(i+5))
end

draw_screen(window, Wcenter,Hcenter,1,im0)
text1 = char(training{1,3});
text2 = char(training{1,4});                                                                                                        
text1 = double(text1);
text2 = double(text2);
[time1,time2,point1x,point1y,point2x,point2y,match] = ...
                draw_screen(window, Wcenter,Hcenter,2,[],[],text1,text2,text_w2,text_w3,text_w4,text_w5);
[time1,time2,point1x,point1y,point2x,point2y,match2] = ...
                draw_screen(window, Wcenter,Hcenter,3,[],char(training{1,1}),text1,text2,text_w2,text_w3,text_w4,text_w5); 

while 1
    Priority(MaxPriority(window));
    Priority(2);
    [keyIsDown,secs,keyCode] = KbCheck;
    Screen(window,'FillRect',[128,128,128]);
    Screen('DrawTexture',window,ins10);
    Screen('Flip', window);
    if keyCode(KbName('space')) == 1
        KbReleaseWait();
        break;
    elseif keyCode(KbName('r')) == 1
        KbReleaseWait();
        draw_screen(window, Wcenter,Hcenter,1,im0)
        text1 = char(training{1,3});
        text2 = char(training{1,4});
        text1 = double(text1);
        text2 = double(text2);
        [time1,time2,point1x,point1y,point2x,point2y,match] = ...
                draw_screen(window, Wcenter,Hcenter,2,[],[],text1,text2,text_w2,text_w3,text_w4,text_w5);
        [time1,time2,point1x,point1y,point2x,point2y,match2] = ...
                draw_screen(window, Wcenter,Hcenter,3,[],char(training{1,1}),text1,text2,text_w2,text_w3,text_w4,text_w5);
   end
end

for i = 1:30
    draw_screen(window, Wcenter,Hcenter,1,im_buff(sdn{i,5}))
    text1 = char(sdn{i,3});
    text2 = char(sdn{i,4});
    text1 = double(text1);
    text2 = double(text2);
    [time1,time2,point1x,point1y,point2x,point2y,match] = ...
                draw_screen(window, Wcenter,Hcenter,2,[],[],text1,text2,text_w2,text_w3,text_w4,text_w5);
    [time1,time2,point1x,point1y,point2x,point2y,match2] = ...
                draw_screen(window, Wcenter,Hcenter,3,[],char(ts{i,1}),text1,text2,text_w2,text_w3,text_w4,text_w5);
    
    pres(i,:) = [match,time1,time2,point1x,point1y,point2x,point2y];
end

csvwrite([pwd,'/',char(paths.res),'par',num2str(par_num),'_data.csv'],pres);                                                                                                        
writetable(sdn,[pwd,'/',char(paths.res),'par',num2str(par_num),'_senaryo.xlsx']);
     

clear screen                  