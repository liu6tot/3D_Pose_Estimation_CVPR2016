function scree_win_view_settings(ud)

% SCREE_WIN_VIEW_SETTINGS opens a window for selecting view settings (scree).
% ---------------------------
% scree_win_view_settings(ud)
% ---------------------------
% Description: opens a window for selecting view settings (scree).
% Input:       {ud} userdata of parent window.

% � Liran Carmel
% Classification: Visualization
% Last revision date: 17-Jan-2005

% open window
fig = figure('menubar','none','position',[300 300 400 160],...
    'numbertitle','off','name','View Settings');

% define editable text
delta = 1/6;
yy = 1 - delta;
height = 0.8*delta;
h_ch(1) = uicontrol(fig,'style','check','horizontal','left',...
    'units','normalized','position',[0.05 yy 0.9 height],...
    'string','Cumulative Plot','background',[0.8 0.8 0.8],...
    'callback','scree(lintrans,101)');
yy = yy - delta;
h_ch(2) = uicontrol(fig,'style','check','horizontal','left',...
    'units','normalized','position',[0.05 yy 0.43 height],...
    'string','View Confidence Interval with','background',[0.8 0.8 0.8],...
    'callback','scree(lintrans,102)');
h_ed = uicontrol(fig,'style','edit',...
    'units','normalized','position',[0.48 yy 0.08 height],...
    'background',[0.8 0.8 0.8],'horizontal','center');
h_txt = uicontrol(fig,'style','text','string','% significance level',...
    'units','normalized','position',[0.56 yy 0.3 height],...
    'background',[0.8 0.8 0.8],'horizontal','left');
yy = yy - delta;
h_rb(1) = uicontrol(fig,'style','radio',...
    'string','Symmetric',...
    'units','normalized','position',[0.15 yy 0.35 height],...
    'background',[0.8 0.8 0.8],'horizontal','left',...
    'callback','scree(lintrans,103)');
yy = yy - delta;
h_rb(2) = uicontrol(fig,'style','radio',...
    'string','Asymmetric (Recommended)',...
    'units','normalized','position',[0.15 yy 0.55 height],...
    'background',[0.8 0.8 0.8],'horizontal','left',...
    'callback','scree(lintrans,104)');
yy = yy - delta;

% define OK and Cancel buttons
uicontrol(fig,'style','push','string','O.K.',...
    'units','normalized','position',[0.125 0.5*delta 0.3 1.5*height],...
    'callback','scree(lintrans,105)');
uicontrol(fig,'style','push','string','Cancel',...
    'units','normalized','position',[0.575 0.5*delta 0.3 1.5*height],...
    'callback','close(gcf)');

% initialize window to previos selection
set(h_ch(1),'value',ud.cum_view);
set(h_ed,'string',num2str(100*ud.ci_alpha));
if ud.ci_view
    set(h_ch(2),'value',1);
    is_asymm = ud.ci_view - 1;
    set(h_rb(1),'value',~is_asymm);
    set(h_rb(2),'value',is_asymm);
else
    set(h_ch(2),'value',0);
    set(h_rb,'enable','off');
    set(h_ed,'enable','off');
    set(h_txt,'enable','off');
end
    
% define userdata
ud = struct('h_rb',h_rb,'h_ed',h_ed,'h_ch',h_ch,'h_txt',h_txt,...
    'main_fig',ud.main_fig);
set(gcf,'userdata',ud);