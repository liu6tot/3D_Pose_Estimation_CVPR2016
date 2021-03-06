function view_callbacks(num)

% VIEW_CALLBACKS activate the callbacks of VIEW.
% -------------------
% view_callbacks(num)
% -------------------
% Description: activate the callbacks of VIEW.
% Input:       {num} identify the callback.

% � Liran Carmel
% Classification: Visualization
% Last revision date: 09-Jan-2007

% find main figure and axes
ud = get(gcf,'userdata');
fig = ud.main_fig;

switch num(1)
    case 1  % update plot
        update_view(fig);
%     case 2  % Options->Nodes->Color
%         nodecolor_win(ud);
%     case 3  % Options->Edges->Horizontal->Width
%         edgehw_win(ud);
%     case 4  % Options->Nodes->Size
%         nodesize_win(ud);
%     case 5  % Options->Save Settings
%         save_settings(ud);
%     case 6  % Options->Nodes->Label->Text
%         nodelabeltext_win(ud);
    case 7  % Options->Nodes->X-Coordinates
        nodexc_win(ud);
%     case 8  % Options->Nodes->Y-Coordinates
%         nodeyc_win(ud);
%     case 9  % Options->Edges->Horizontal->Color
%         edgehc_win(ud);
%     case 10 % Options->Edges->Vertical->Width
%         edgevw_win(ud);
%     case 11  % Options->Edges->Vertical->Color
%         edgevc_win(ud);
%     case 12  % Empty
%     case 13 % Options->Edges->Attach Bars
%         edgebar_win(ud);
%     case 14  % Options->Nodes->Label->Position
%         nodelabelpos_win(ud);
%     case 15  % Options->Nodes->Label->Font
%         %nodelabelfont_win(ud);
%     case 201    % Node Size: OK
%         this_fig = gcf;
%         no_nodes = length(ud.h_ed);
%         node_size = zeros(1,no_nodes);
%         for node = 1:no_nodes
%             node_size(node) = str2double(get(ud.h_ed(node),'string'));
%         end
%         ud = get(fig,'userdata');
%         ud.node_size = node_size;
%         set(fig,'userdata',ud);
%         update_view(fig);
%         close(this_fig)
%     case 202    % Node Size: Common Size
%         nsize = inputdlg('Common Node Size:','Common Node Size');
%         if ~isempty(nsize)
%             set(ud.h_ed,'string',nsize);
%         end
%     case 203    % Node Size: Load sizes from workspace
%         vars = evalin('base','who');
%         selection = listdlg('liststring',vars,'selectionmode','single',...
%             'name','Node Size');
%         if ~isempty(selection)
%             node_size = evalin('base',vars{selection});
%             % update edit box
%             for node = 1:length(ud.h_ed)
%                 set(ud.h_ed(node),'string',num2str(node_size(node)));
%             end
%         end
%     case 204    % Node Size: Scale
%         prompt = {'Minimum value:','Maximum Value:'};
%         dlg_title = 'Scaling of Node Size';
%         node_size = str2num(char(get(ud.h_ed,'string')));   %#ok
%         mnmx = minmax(node_size);
%         def = {num2str(mnmx(1)),num2str(mnmx(2))};
%         rng = str2num(char(inputdlg(prompt,dlg_title,1,def)));  %#ok
%         if ~isempty(rng)
%             node_size = rng(1) + diff(rng)*(node_size-mnmx(1))/diff(mnmx);
%             % update edit box
%             for node = 1:length(ud.h_ed)
%                 set(ud.h_ed(node),'string',num2str(node_size(node)));
%             end
%         end
%     case 251    % Node Color: OK
%         this_fig = gcf;
%         no_nodes = length(ud.h_col);
%         node_color = zeros(no_nodes,3);
%         for node = 1:no_nodes
%             node_color(node,:) = get(ud.h_col(node),'background');
%         end
%         ud = get(fig,'userdata');
%         ud.node_color = node_color;
%         set(fig,'userdata',ud);
%         update_view(fig);
%         close(this_fig)
%     case 252    % Node Color: Common Color
%         col = uisetcolor;
%         if ~isempty(col)
%             set(ud.h_col,'background',col);
%         end
%     case 253    % Node Color: Load colors from workspace
%         vars = evalin('base','who');
%         selection = listdlg('liststring',vars,'selectionmode','single',...
%             'name','Node Color');
%         if ~isempty(selection)
%             node_color = evalin('base',vars{selection});
%             % update edit box
%             for node = 1:length(ud.h_col)
%                 set(ud.h_col(node),'background',node_color(node,:));
%             end
%         end
%     case 254    % Node Color: Change individual color
%         col = uisetcolor;
%         if ~isempty(col)
%             set(ud.h_col(num(2)),'background',col);
%         end
%     case 301    % Node Labels: OK
%         this_fig = gcf;
%         no_nodes = length(ud.h_ed);
%         node_label = cell(1,no_nodes);
%         for node = 1:no_nodes
%             node_label{node} = get(ud.h_ed(node),'string');
%         end
%         ud = get(fig,'userdata');
%         ud.node_label = node_label;
%         set(fig,'userdata',ud);
%         update_view(fig);
%         close(this_fig)
%     case 302    % Node Label: Default Labels
%         for node = 1:length(ud.h_ed)
%             set(ud.h_ed(node),'string',sprintf('Node #%d',node));
%         end
%     case 303    % Node Label: Load labels from workspace
%         vars = evalin('base','who');
%         selection = listdlg('liststring',vars,'selectionmode','single',...
%             'name','Node Label');
%         if ~isempty(selection)
%             node_label = cellstr(evalin('base',vars{selection}));
%             % update edit box
%             for node = 1:length(ud.h_ed)
%                 set(ud.h_ed(node),'string',node_label{node});
%             end
%         end
    case 351    % Node Coordinates: OK
        this_fig = gcf;
        no_nodes = size(ud.h_ed,1);
        node_Xcoord = zeros(1,no_nodes);
        node_Ycoord = zeros(1,no_nodes);
        for node = 1:no_nodes
            node_Xcoord(node) = str2double(get(ud.h_ed(node,1),'string'));
            node_Ycoord(node) = str2double(get(ud.h_ed(node,2),'string'));
        end
        ud = get(fig,'userdata');
        ud.node_Xcoord = node_Xcoord;
        ud.node_Ycoord = node_Ycoord;
        set(fig,'userdata',ud);
        update_view(fig);
        close(this_fig)
    case 352    % Node Coordinates: Radio buttons
        udd = get(fig,'userdata');
        if num(2) == 1  % x-coordinates
            % set value of radio buttons
            set(ud.h_rbx,'value',0);
            set(gco,'value',1);
            % compute coordinates
            switch find(ud.h_rbx == gco)
                case 1
                    udd.node_Xalg = 'eigenproj';
                case 2
                    udd.node_Xalg = 'eigenprojm';
                case 3
                    vars = evalin('base','who');
                    selection = listdlg('liststring',...
                        vars,'selectionmode','single',...
                        'name','Node X-Coordinates');
                    if ~isempty(selection)
                        udd.node_Xalg = 'workspace';
                        udd.node_Xcoord = evalin('base',vars{selection});
                    else
                        set(gco,'value',0);
                        switch udd.node_Xalg
                            case 'eigenproj'
                                set(ud.h_rbx(1),'value',1);
                            case 'eigenprojm'
                                set(ud.h_rbx(2),'value',1);
                        end
                    end
            end
        else            % y-coordinates
            % set value of radio buttons
            set(ud.h_rby,'value',0);
            set(gco,'value',1);
            % compute coordinates
            switch find(ud.h_rby == gco)
                case 1
                    udd.node_Yalg = 'eigenproj';
                case 2
                    udd.node_Yalg = 'eigenprojm';
                case 3
                    vars = evalin('base','who');
                    selection = listdlg('liststring',...
                        vars,'selectionmode','single',...
                        'name','Node Y-Coordinates');
                    if ~isempty(selection)
                        udd.node_Yalg = 'workspace';
                        udd.node_Ycoord = evalin('base',vars{selection});
                    else
                        set(gco,'value',0);
                        switch udd.node_Yalg
                            case 'eigenproj'
                                set(ud.h_rby(1),'value',1);
                            case 'eigenprojm'
                                set(ud.h_rby(2),'value',1);
                        end
                    end
            end
        end
        % update values
        [udd.node_Xcoord udd.node_Ycoord] = ...
            computecoordinates(udd.data,udd.node_Xalg,udd.node_Yalg,...
            udd.node_Xcoord,udd.node_Ycoord);
        % update edit boxes
        for node = 1:size(ud.h_ed,1)
            set(ud.h_ed(node,1),'string',...
                num2str(udd.node_Xcoord(node),'%.2f'));
            set(ud.h_ed(node,2),'string',...
                num2str(udd.node_Ycoord(node),'%.2f'));
        end
        % update figure userdata
        set(fig,'userdata',udd);
%     case 353    % Node X-Coordinates: Load coordianates from workspace
%         vars = evalin('base','who');
%         selection = listdlg('liststring',vars,'selectionmode','single',...
%             'name','Node X-Coordinates');
%         if ~isempty(selection)
%             x_node = evalin('base',vars{selection});
%             % update edit box
%             for node = 1:length(ud.h_ed)
%                 set(ud.h_ed(node),'string',num2str(x_node(node)));
%             end
%         end
%     case 401    % Node Y-Coordinates: OK
%         this_fig = gcf;
%         no_nodes = length(ud.h_ed);
%         y_node = zeros(1,no_nodes);
%         for node = 1:no_nodes
%             y_node(node) = str2double(get(ud.h_ed(node),'string'));
%         end
%         ud = get(fig,'userdata');
%         ud.y_node = y_node;
%         set(fig,'userdata',ud);
%         update_view(fig);
%         close(this_fig)
%     case 402    % Node Y-Coordinates: Default
%         pt = get(fig,'userdata');
%         [x y] = computecoordinates(pt.data);    %#ok
%         for node = 1:length(ud.h_ed)
%             set(ud.h_ed(node),'string',num2str(y(node)));
%         end
%     case 403    % Node Y-Coordinates: Load coordianates from workspace
%         vars = evalin('base','who');
%         selection = listdlg('liststring',vars,'selectionmode','single',...
%             'name','Node Y-Coordinates');
%         if ~isempty(selection)
%             y_node = evalin('base',vars{selection});
%             % update edit box
%             for node = 1:length(ud.h_ed)
%                 set(ud.h_ed(node),'string',num2str(y_node(node)));
%             end
%         end
%     case 451    % Edge Horizonal Width: OK
%         this_fig = gcf;
%         no_nodes = length(ud.h_ed);
%         lw = zeros(1,no_nodes);
%         for node = 1:no_nodes
%             lw(node) = str2double(get(ud.h_ed(node),'string'));
%         end
%         ud = get(fig,'userdata');
%         ud.horiz_lw = lw;
%         set(fig,'userdata',ud);
%         update_view(fig);
%         close(this_fig)
%     case 452    % Edge Horizonal Width: Common Width
%         lw = inputdlg('Common Edge Width:','Common Edge Width');
%         if ~isempty(lw)
%             set(ud.h_ed,'string',lw);
%         end
%     case 453    % Edge Horizonal Width: Load widths from workspace
%         vars = evalin('base','who');
%         selection = listdlg('liststring',vars,'selectionmode','single',...
%             'name','Edge Horizontal Width');
%         if ~isempty(selection)
%             lw = evalin('base',vars{selection});
%             % update edit box
%             for node = 1:length(ud.h_ed)
%                 set(ud.h_ed(node),'string',num2str(lw(node)));
%             end
%         end
%     case 454    % Edge Horizonal Width: Scale
%         prompt = {'Minimum value:','Maximum Value:'};
%         dlg_title = 'Scaling of Edge Horizontal Width';
%         lw = str2num(char(get(ud.h_ed,'string')));   %#ok
%         mnmx = minmax(lw);
%         def = {num2str(mnmx(1)),num2str(mnmx(2))};
%         rng = str2num(char(inputdlg(prompt,dlg_title,1,def)));  %#ok
%         if ~isempty(rng)
%             lw = rng(1) + diff(rng)*(lw-mnmx(1))/diff(mnmx);
%             % update edit box
%             for node = 1:length(ud.h_ed)
%                 set(ud.h_ed(node),'string',num2str(lw(node)));
%             end
%         end
%     case 501    % Edge Horizonal Color: OK
%         this_fig = gcf;
%         no_nodes = length(ud.h_col);
%         col = zeros(no_nodes,3);
%         for node = 1:no_nodes
%             col(node,:) = get(ud.h_col(node),'background');
%         end
%         ud = get(fig,'userdata');
%         ud.horiz_col = col;
%         set(fig,'userdata',ud);
%         update_view(fig);
%         close(this_fig)
%     case 502    % Edge Horizonal Color: Common Color
%         col = uisetcolor;
%         if ~isempty(col)
%             set(ud.h_col,'background',col);
%         end
%     case 503    % Edge Horizonal Color: Load colors from workspace
%         vars = evalin('base','who');
%         selection = listdlg('liststring',vars,'selectionmode','single',...
%             'name','Edge Horizontal Color');
%         if ~isempty(selection)
%             col = evalin('base',vars{selection});
%             % update edit box
%             for node = 1:length(ud.h_col)
%                 set(ud.h_col(node),'background',col(node,:));
%             end
%         end
%     case 504    % Edge Horizonal Color: Change individual color
%         col = uisetcolor;
%         if ~isempty(col)
%             set(ud.h_col(num(2)),'background',col);
%         end
%     case 551    % Edge Vertical Width: OK
%         this_fig = gcf;
%         no_nodes = length(ud.h_ed);
%         lw = zeros(1,no_nodes);
%         for node = 1:no_nodes
%             lw(node) = str2double(get(ud.h_ed(node),'string'));
%         end
%         ud = get(fig,'userdata');
%         ud.vert_lw = lw;
%         set(fig,'userdata',ud);
%         update_view(fig);
%         close(this_fig)
%     case 552    % Edge Vertical Width: Common Width
%         lw = inputdlg('Common Edge Width:','Common Edge Width');
%         if ~isempty(lw)
%             set(ud.h_ed,'string',lw);
%         end
%     case 553    % Edge Vertical Width: Load widths from workspace
%         vars = evalin('base','who');
%         selection = listdlg('liststring',vars,'selectionmode','single',...
%             'name','Edge Vertical Width');
%         if ~isempty(selection)
%             lw = evalin('base',vars{selection});
%             % update edit box
%             for node = 1:length(ud.h_ed)
%                 set(ud.h_ed(node),'string',num2str(lw(node)));
%             end
%         end
%     case 554    % Edge Vertical Width: Scale
%         prompt = {'Minimum value:','Maximum Value:'};
%         dlg_title = 'Scaling of Edge Vertical Width';
%         lw = str2num(char(get(ud.h_ed,'string')));   %#ok
%         mnmx = minmax(lw);
%         def = {num2str(mnmx(1)),num2str(mnmx(2))};
%         rng = str2num(char(inputdlg(prompt,dlg_title,1,def)));  %#ok
%         if ~isempty(rng)
%             lw = rng(1) + diff(rng)*(lw-mnmx(1))/diff(mnmx);
%             % update edit box
%             for node = 1:length(ud.h_ed)
%                 set(ud.h_ed(node),'string',num2str(lw(node)));
%             end
%         end
%     case 601    % Edge Vertical Color: OK
%         this_fig = gcf;
%         no_nodes = length(ud.h_col);
%         col = zeros(no_nodes,3);
%         for node = 1:no_nodes
%             col(node,:) = get(ud.h_col(node),'background');
%         end
%         ud = get(fig,'userdata');
%         ud.vert_col = col;
%         set(fig,'userdata',ud);
%         update_view(fig);
%         close(this_fig)
%     case 602    % Edge Vertical Color: Common Color
%         col = uisetcolor;
%         if ~isempty(col)
%             set(ud.h_col,'background',col);
%         end
%     case 603    % Edge Vertical Color: Load colors from workspace
%         vars = evalin('base','who');
%         selection = listdlg('liststring',vars,'selectionmode','single',...
%             'name','Edge Vertical Color');
%         if ~isempty(selection)
%             col = evalin('base',vars{selection});
%             % update edit box
%             for node = 1:length(ud.h_col)
%                 set(ud.h_col(node),'background',col(node,:));
%             end
%         end
%     case 604    % Edge Vertical Color: Change individual color
%         col = uisetcolor;
%         if ~isempty(col)
%             set(ud.h_col(num(2)),'background',col);
%         end
%     case 651    % Edge Bars: OK
%         this_fig = gcf;
%         % get what we need from {ud}
%         data = ud.data;
%         h_check = ud.h_check;
%         ylim = ud.ylim;
%         % make {ud} the userdata of the main figure
%         ud = get(fig,'userdata');
%         % update y-scale
%         ud.bar_ylim = ylim;
%         % update visibility and {bar_show}
%         for row = 1:5
%             if get(h_check(row),'value')
%                 ud.bar_show(row) = true;
%                 set(ud.h_bar{row},'visible','on');
%             else
%                 ud.bar_show(row) = false;
%                 set(ud.h_bar{row},'visible','off');
%             end
%             ud.bar_name{row} = get(h_check(row),'string');
%         end
%         % upload data and compute positions
%         ud.bar_data = data;
%         ud = computepositions(ud);
%         % save into userdata of main figure and replot
%         set(fig,'userdata',ud);
%         % plot bars
%         for row = 1:5
%             cm = colormap;
%             if ud.bar_show(row)
%                 data = ud.bar_data{row};
%                 no_columns = size(data,2);
%                 col_idx = round(linspace(1,size(cm,1),no_columns));
%                 for node = 1:length(ud.node_size)
%                     axes(ud.h_bar{row}(node));
%                     cla;
%                     set(gca,'position',[ud.bar_xpos{row}(node) ...
%                         ud.bar_ypos{row}(node) ...
%                         ud.bar_width(row) ud.bar_height(row)]);
%                     for ii = 1:no_columns
%                         patch([ii-1 ii-1 ii ii],...
%                             [0 data(node,ii) data(node,ii) 0],...
%                             cm(col_idx(ii),:));
%                     end
%                     set(gca,'xlim',[0 no_columns],'ylim',ylim(:,row)');
%                 end
%             end
%         end
%         % update figure
%         update_view(fig);
%         close(this_fig)
%     case 652    % Edge Bars: Load/Refresh dataset
%         vars = evalin('base','who');
%         selection = listdlg('liststring',vars,'selectionmode','single',...
%             'name','Load Bar Data');
%         if ~isempty(selection)
%             % get data
%             userdata = evalin('base',vars{selection});
%             data = ud.data;
%             data{num(2)} = userdata;
%             ud.data = data;
%             % compute ylim
%             ylim = [min(0,nanmin(nanmin(userdata))); ...
%                 max(0,nanmax(nanmax(userdata)))];
%             ud.ylim(:,num(2)) = ylim;
%             % update
%             set(gcf,'userdata',ud);
%             set(ud.h_check(num(2)),'value',1,'string',vars{selection});
%         end
%     case 653    % Edge Bars: Scale dataset: Au
%         main_ud = get(fig,'userdata');
%         if num(2) == 1
%             val = min(0,nanmin(nanmin(main_ud.data{num(3)})));
%         else
%             val = max(0,nanmax(nanmax(main_ud.data{num(3)})));
%         end
%         set(ud.h_ed(num(2)),'string',num2str(val));
%     case 654    % Edge Bars: Scale dataset
%         barscale_win(ud,num(2));
%     case 655    % Edge Bars: Scale dataset: OK
%         this_fig = gcf;
%         ylim = [str2double(get(ud.h_ed(1),'string')); ...
%             str2double(get(ud.h_ed(2),'string'))];
%         ud = get(fig,'userdata');
%         ud.ylim(:,num(2)) = ylim;
%         set(fig,'userdata',ud);
%         close(this_fig);
%     case 656    % Edge Bars: Position bars
%         this_fig = gcf;
%         ylim = [str2double(get(ud.h_ed(1),'string')); ...
%             str2double(get(ud.h_ed(2),'string'))];
%         ud = get(fig,'userdata');
%         ud.ylim(:,num(2)) = ylim;
%         set(fig,'userdata',ud);
%         close(this_fig);
%     case 701        % Nodes --> Label --> Position: OK
%         this_fig = gcf;
%         no_nodes = 0.5*numel(ud.h_ed);
%         shift_x = zeros(1,no_nodes);
%         shift_y = zeros(1,no_nodes);
%         for node = 1:no_nodes
%             shift_x(node) = str2double(get(ud.h_ed(node,1),'string'));
%             shift_y(node) = str2double(get(ud.h_ed(node,2),'string'));
%         end
%         ud = get(fig,'userdata');
%         ud.label_shift_x = shift_x;
%         ud.label_shift_y = shift_y;
%         set(fig,'userdata',ud);
%         update_view(fig);
%         close(this_fig)
%     case 702        % Nodes --> Label --> Label Shifts:Defaults
%         set(ud.h_scale(1,1),'string',num2str(0.01));
%         set(ud.h_scale(2,1),'string',num2str(0));
%         set(ud.h_scale(1,2),'string',num2str(0.05));
%         set(ud.h_scale(2,2),'string',num2str(-0.05));
%     case 703        % Nodes --> Label --> Label x-Shifts:Defaults
%         set(ud.h_scale(1,1),'string',num2str(0.01));
%         set(ud.h_scale(2,1),'string',num2str(0));
%     case 704        % Nodes --> Label --> Label y-Shifts:Defaults
%         set(ud.h_scale(1,2),'string',num2str(0.05));
%         set(ud.h_scale(2,2),'string',num2str(-0.05));
%     case 705        % Nodes --> Label --> Label Shifts:Recalc
%         ud_main = get(fig,'userdata');
%         pt = ud_main.data;
%         no_nodes = nonodes(pt);
%         lvs = leaves(pt);
%         x_scale = str2double(get(ud.h_scale(1,1),'string'));
%         x_range = range(ud_main.x_node);
%         y_scale = str2double(get(ud.h_scale(1,2),'string'));
%         y_range = range(ud_main.y_node);
%         shift_x = x_scale*ones(1,no_nodes) * x_range;
%         shift_y = y_scale*ones(1,no_nodes) * y_range;
%         x_scale = str2double(get(ud.h_scale(2,1),'string'));
%         y_scale = str2double(get(ud.h_scale(2,2),'string'));
%         shift_x(lvs) = x_scale * x_range;
%         shift_y(lvs) = y_scale * y_range;
%         for node = 1:no_nodes
%             set(ud.h_ed(node,1),'string',num2str(shift_x(node)));
%             set(ud.h_ed(node,2),'string',num2str(shift_y(node)));
%         end
%     case 706        % Nodes --> Label --> Label x-Shifts:Recalc
%         ud_main = get(fig,'userdata');
%         pt = ud_main.data;
%         no_nodes = nonodes(pt);
%         lvs = leaves(pt);
%         x_scale = str2double(get(ud.h_scale(1,1),'string'));
%         x_range = range(ud_main.x_node);
%         shift_x = x_scale*ones(1,no_nodes) * x_range;
%         x_scale = str2double(get(ud.h_scale(2,1),'string'));
%         shift_x(lvs) = x_scale * x_range;
%         for node = 1:no_nodes
%             set(ud.h_ed(node,1),'string',num2str(shift_x(node)));
%         end
%     case 707        % Nodes --> Label --> Label y-Shifts:Recalc
%         ud_main = get(fig,'userdata');
%         pt = ud_main.data;
%         no_nodes = nonodes(pt);
%         lvs = leaves(pt);
%         y_scale = str2double(get(ud.h_scale(1,2),'string'));
%         y_range = range(ud_main.y_node);
%         shift_y = y_scale*ones(1,no_nodes) * y_range;
%         y_scale = str2double(get(ud.h_scale(2,2),'string'));
%         shift_y(lvs) = y_scale * y_range;
%         for node = 1:no_nodes
%             set(ud.h_ed(node,2),'string',num2str(shift_y(node)));
%         end
%     case 708        % Nodes --> Label --> Label Shifts:Workspace
%         vars = evalin('base','who');
%         selection = listdlg('liststring',vars,'selectionmode','single',...
%             'name','Node Label Shifts');
%         if ~isempty(selection)
%             shifts = evalin('base',vars{selection});
%             % update edit box
%             for node = 1:size(shifts,1)
%                 set(ud.h_ed(node,1),'string',shifts(node,1));
%                 set(ud.h_ed(node,2),'string',shifts(node,2));
%             end
%         end
end