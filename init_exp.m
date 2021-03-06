
HideCursor();

par_num = 302; % participant no

ssiz = 10; % Senaryo Text Size
tsiz = 24; % Text Text Size

nis = 4; % number of instruction screen
nts = 30; % number of trials
                                                                                                
vbvs = 120; % Axis matching task, the vertical size of boxes on axes.
vbhs = 60; % Axis matching task, the horizontal size of boxes on axes.

 
fl = 20; % fixation plus length

sdn = readtable('trials.xlsx');
texts = readtable('texts.xlsx');



text_w2 = double(char(texts{1,1}));
text_w3 = double(char(texts{2,1}));
text_w4 = double(char(texts{3,1}));
text_w5 = double(char(texts{4,1}));

trdf = {'trial361.csv';'trial362.csv';'trial363.csv';'trial364.csv';'trial365.csv';'trial366.csv'};

rd = mod(par_num,2)+1; % if participant number is even, assign participants to Set1. Otherwise assign them to Set2.
ntr = sdn(25:30,:);
ts = sdn(:,rd);    
ts1 = ntr(:,rd);
a = (1:12)';
b = (13:24)';
% Randomize the order of negative and positive scenarios independently. 
a = a(randperm(12)); % negative scenarios, e.g. level of education, aggressiveness
b = b(randperm(12)); % positive scenarios, e.g. time allocated to exercise, cardiovascular health index
order = zeros(24,1);

% Randomize the order such that there will be no successive positive or negative scenarios.
for i = 1:12
    order(2*(i-1)+1:2*i,1) = [a(i);b(i)];
end

% Randomize the order of neutral scenarios (no correlation at all.), e.g. height, IQ
order1 = randperm(6)';
trdf = trdf(order1);
ts1 = ts1(order1,1);

ts = ts(order,1);

% Final random order of trials. One neutral scenario after group of 2 negative and 2 positive scenarios.
ts = [ts(1:4,1);ts1(1,1);ts(5:8,1);ts1(2,1);ts(9:12,1);ts1(3,1);ts(13:16,1);ts1(4,1) ...
      ;ts(17:20,1);ts1(5,1);ts(21:24,1);ts1(6,1)];
training = sdn(31,:);
sdn = sdn(order,:);
ntr = ntr(order1,:);

sdn = [sdn(1:4,:);ntr(1,:);sdn(5:8,:);ntr(2,:);sdn(9:12,:);ntr(3,:);sdn(13:16,:);ntr(4,:)...
       ;sdn(17:20,:);ntr(5,:);sdn(21:24,:);ntr(6,:)];

% Get paths for images and results.
paths = getPaths();


Screen('Preference','SkipSyncTests', 1,'TextEncodingLocale','tr_TR.UTF-8');
Screen('Preference','TextRenderer',1);
KbName('UnifyKeyNames');
responsekeys = {'r'};

% Define the allowed keyboard keys.
KbCheckList = [KbName('space'), KbName('ESCAPE')];
for i = 1:length(responsekeys)
    KbCheckList = [KbName(responsekeys{i}),KbCheckList];
end

RestrictKeysForKbCheck(KbCheckList);

whichScreen = max(Screen('Screens'));

% Change [0,0,1000,750] to [] for fullscreen. 
% Initialize the screen.
[window, rect] = Screen('OpenWindow', whichScreen, [0,0,0],[0,0,1000,750],[], 2);
fi = Screen('GetFlipInterval', window)/ 2;
Screen(window,'TextSize',24);
W = rect(RectRight);
H = rect(RectBottom);
Wcenter = round(W/2);
Hcenter = round(H/2);


%% Create texture for trial narratives, and instructions, and put them into a buffer.

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

