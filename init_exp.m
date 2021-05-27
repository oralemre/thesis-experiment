%ShowCursor('Arrow')
HideCursor();
par_num = 200;
sdn = readtable('trials.xlsx');
texts = readtable('texts.xlsx');



text_w2 = char(texts{1,1});
text_w3 = char(texts{2,1});
text_w4 = char(texts{3,1});
text_w5 = char(texts{4,1});
text_w2 = double(text_w2);
text_w3 = double(text_w3);
text_w4 = double(text_w4);
text_w5 = double(text_w5);
trdf = {'trial361.csv';'trial362.csv';'trial363.csv';'trial364.csv';'trial365.csv';'trial366.csv'};

rd = mod(par_num,2)+1; % ciftse 1 tekse 2
%rd = randi([1,2]);
ntr = sdn(25:30,:);
ts = sdn(:,rd);    
ts1 = ntr(:,rd);
a = (1:12)';
b = (13:24)';
a = a(randperm(12));
b = b(randperm(12));
order = [];
for i = 1:12
    order = [order;a(i);b(i)];
end
%order = randperm(24)';
order1 = randperm(6)';
trdf = trdf(order1);
ts1 = ts1(order1,1);
%mca = [ones(13,1);zeros(14,1)];
%mca = mca(order);
ts = ts(order,1);
%ts = [ts(1:8,1);ts1(1,1);ts(9:16,1);ts1(2,1);ts(17:24,1);ts1(3,1)];
ts = [ts(1:4,1);ts1(1,1);ts(5:8,1);ts1(2,1);ts(9:12,1);ts1(3,1);ts(13:16,1);ts1(4,1) ...
      ;ts(17:20,1);ts1(5,1);ts(21:24,1);ts1(6,1)];
training = sdn(31,:);
sdn = sdn(order,:);
ntr = ntr(order1,:);
%sdn = [sdn(1:8,:);ntr(1,:);sdn(9:16,:);ntr(2,:);sdn(17:24,:);ntr(3,:)];
sdn = [sdn(1:4,:);ntr(1,:);sdn(5:8,:);ntr(2,:);sdn(9:12,:);ntr(3,:);sdn(13:16,:);ntr(4,:)...
       ;sdn(17:20,:);ntr(5,:);sdn(21:24,:);ntr(6,:)];

paths = getPaths();

ssiz = 10; % Senaryo Text Size
tsiz = 24; % Text Text Size

nis = 4; % number of instruction screen
nts = 30; % number of trials
                                                                                                
vbvs = 120; % variable box vertical size 
vbhs = 60; % variable box horizontal size

pn = 100; % participant no

fl = 20; % fixation plus length

Screen('Preference','SkipSyncTests', 1,'TextEncodingLocale','tr_TR.UTF-8');
Screen('Preference','TextRenderer',1);
KbName('UnifyKeyNames');
responsekeys = {'r'};

KbCheckList = [KbName('space'), KbName('ESCAPE')];
for i = 1:length(responsekeys)
    KbCheckList = [KbName(responsekeys{i}),KbCheckList];
end

RestrictKeysForKbCheck(KbCheckList);

whichScreen = max(Screen('Screens'));
% boyut vermeyince full screen, denemede [0,0,1000,750]
[window, rect] = Screen('OpenWindow', whichScreen, [0,0,0],[0,0,1000,750],[], 2);
fi = Screen('GetFlipInterval', window)/ 2;
Screen(window,'TextSize',24);
W = rect(RectRight);
H = rect(RectBottom);
Wcenter = round(W/2);
Hcenter = round(H/2);


ins1 = Screen('MakeTexture',window, imread(char(paths.instruction1)),0,1); 
ins2 = Screen('MakeTexture',window, imread(char(paths.instruction2)),0,1);
ins3 = Screen('MakeTexture',window, imread(char(paths.instruction3)),0,1); 
ins4 = Screen('MakeTexture',window, imread(char(paths.instruction4)),0,1);
ins5 = Screen('MakeTexture',window, imread(char(paths.instruction5)),0,1); 
ins6 = Screen('MakeTexture',window, imread(char(paths.instruction6)),0,1);
ins7 = Screen('MakeTexture',window, imread(char(paths.instruction7)),0,1); 
ins8 = Screen('MakeTexture',window, imread(char(paths.instruction8)),0,1);
ins9 = Screen('MakeTexture',window, imread(char(paths.instruction9)),0,1); 
ins10 = Screen('MakeTexture',window, imread(char(paths.instruction10)),0,1);
im1 = Screen('MakeTexture',window, imread(char(paths.im1)),0,1);
im2 = Screen('MakeTexture',window, imread(char(paths.im2)),0,1);
im3 = Screen('MakeTexture',window, imread(char(paths.im3)),0,1);
im4 = Screen('MakeTexture',window, imread(char(paths.im4)),0,1); 
im5 = Screen('MakeTexture',window, imread(char(paths.im5)),0,1);
im6 = Screen('MakeTexture',window, imread(char(paths.im6)),0,1);
im7 = Screen('MakeTexture',window, imread(char(paths.im7)),0,1);
im8 = Screen('MakeTexture',window, imread(char(paths.im8)),0,1);
im9 = Screen('MakeTexture',window, imread(char(paths.im9)),0,1);
im10 = Screen('MakeTexture',window, imread(char(paths.im10)),0,1);
im11 = Screen('MakeTexture',window, imread(char(paths.im11)),0,1);
im12 = Screen('MakeTexture',window, imread(char(paths.im12)),0,1);
im13 = Screen('MakeTexture',window, imread(char(paths.im13)),0,1);
im14 = Screen('MakeTexture',window, imread(char(paths.im14)),0,1);
im15 = Screen('MakeTexture',window, imread(char(paths.im15)),0,1);
im16 = Screen('MakeTexture',window, imread(char(paths.im16)),0,1);
im17 = Screen('MakeTexture',window, imread(char(paths.im17)),0,1);
im18 = Screen('MakeTexture',window, imread(char(paths.im18)),0,1);
im19 = Screen('MakeTexture',window, imread(char(paths.im19)),0,1);
im20 = Screen('MakeTexture',window, imread(char(paths.im20)),0,1);
im21 = Screen('MakeTexture',window, imread(char(paths.im21)),0,1);
im22 = Screen('MakeTexture',window, imread(char(paths.im22)),0,1);
im23 = Screen('MakeTexture',window, imread(char(paths.im23)),0,1);
im24 = Screen('MakeTexture',window, imread(char(paths.im24)),0,1);
im25 = Screen('MakeTexture',window, imread(char(paths.im25)),0,1);
im26 = Screen('MakeTexture',window, imread(char(paths.im26)),0,1);
im27 = Screen('MakeTexture',window, imread(char(paths.im27)),0,1);
im28 = Screen('MakeTexture',window, imread(char(paths.im28)),0,1);
im29 = Screen('MakeTexture',window, imread(char(paths.im29)),0,1);
im30 = Screen('MakeTexture',window, imread(char(paths.im30)),0,1);
im0 = Screen('MakeTexture',window, imread(char(paths.im0)),0,1);

ins_buff = [ins1,ins2,ins3,ins4,ins5,ins6,ins7,ins8,ins9,ins10];
im_buff = [im1,im2,im3,im4,im5,im6,im7,im8,im9,im10,im11,im12,im13,im14, ...
    im15,im16,im17,im18,im19,im20,im21,im22,im23,im24,im25,im26,im27,im28,im29,im30];

