function plot_win_select_variables(ud)

% PLOT_WIN_SELECT_VARIABLES opens a window for selecting variables.
% -----------------------------
% plot_win_select_variables(ud)
% -----------------------------
% Description: opens a window for selecting variables.
% Input:       {ud} userdata of parent window.

% � Liran Carmel
% Classification: Visualization
% Last revision date: 10-Jan-2005

% extract relevant parameters from {ud}
vsm = ud.data;
vars = ud.variables;

% open window
name = sprintf('Select Variables (total %d)',novariables(vsm));
fig = figure('menubar','none','position',[300 300 250 400],...
    'numbertitle','off','name',name);

% define radio buttons
h_rb = zeros(1,3);      % handles for radio buttons
h_ed = zeros(1,2);      % handles for editable text (variable numbers)
h_rb(1) = uicontrol(fig,'style','radio','string','Select All',...
    'units','normalized','position',[0.05 0.93 0.45 0.05],...
    'background',[0.8 0.8 0.8],'value',1,...
    'callback','plot(vsmatrix,201)');
h_rb(2) = uicontrol(fig,'style','radio','string','Select Specified',...
    'units','normalized','position',[0.05 0.88 0.45 0.05],...
    'background',[0.8 0.8 0.8],'callback','plot(vsmatrix,202)');
h_ed(1) = uicontrol(fig,'style','edit',...
    'units','normalized','position',[0.5 0.88 0.45 0.05],...
    'background',[0.8 0.8 0.8],'visible','off',...
    'horizontal','left','callback','plot(vsmatrix,203)');
h_rb(3) = uicontrol(fig,'style','radio','string','Unselect Specified',...
    'units','normalized','position',[0.05 0.83 0.45 0.05],...
    'background',[0.8 0.8 0.8],'callback','plot(vsmatrix,204)');
h_ed(2) = uicontrol(fig,'style','edit',...
    'units','normalized','position',[0.5 0.83 0.45 0.05],...
    'background',[0.8 0.8 0.8],'visible','off',...
    'horizontal','left','callback','plot(vsmatrix,205)');

% define listbox
h_lb = uicontrol(fig,'style','listbox',...
    'string',vsm.variables(:).name,'max',2,...
    'units','normalized','position',[0.05 0.12 0.9 0.7],...
    'enable','off','callback','plot(vsmatrix,206)');

% define OK and Cancel buttons
uicontrol(fig,'style','push','string','O.K.',...
    'units','normalized','position',[0.125 0.03 0.3 0.06],...
    'callback','plot(vsmatrix,207)');
uicontrol(fig,'style','push','string','Cancel',...
    'units','normalized','position',[0.575 0.03 0.3 0.06],...
    'callback','close(gcf)');

% initialize window to previos selection
if length(vars) ~= novariables(vsm)
    set(h_rb(1),'value',0);
    set(h_rb(2),'value',1);
    set(h_lb,'enable','on','value',vars);
    set(h_ed(1),'visible','on','string',num2str(get(h_lb,'value')));
end

% define userdata
ud = struct('data',vsm,'variables',vars,'main_fig',ud.main_fig,...
    'h_rb',h_rb,'h_ed',h_ed,'h_lb',h_lb);
set(gcf,'userdata',ud);