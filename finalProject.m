function [] = finalProject 
    close all;
    global graph;
    graph.fig = figure();
    graph.plot = plot(0,0);
    graph.plot.Parent.Position = [0.3 0.3 0.6 0.6];
    graph.x = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.05, .9, .15, .1], 'string', 'x-coordinate');
    graph.y = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.05, .8, .15, .1], 'string', 'y-coordinate');
    graph.title = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.45, .9, .30, .05], 'string', 'Plot Title');
    graph.plotButton = uicontrol('style','pushbutton','units','normalized','string','Plot','callback',{@plotStuff});
    graph.reset = uicontrol('style' , 'pushbutton', 'units', 'normalized', 'position', [0.15, .035, .1, .065], 'string', 'reset', 'callback', {@reset});
    graph.xtitle = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.45, .2, .30, .05], 'string', 'x-axis Title');
    graph.ytitle = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.01, .5, .25, .05], 'string', 'y-axis Title');     graph.buttongroup = uibuttongroup('visible','on','units','normalized','position', [.35, .1, .6, .1],'selectionchangedfcn', {@colorSelect});
    graph.r1 = uicontrol(graph.buttongroup, 'style', 'radiobutton', 'units', 'normalized', 'position', [.2, .3, .3, .3], 'HandleVisibility', 'off', 'string', 'red');
    graph.r2 = uicontrol(graph.buttongroup, 'style', 'radiobutton', 'units', 'normalized', 'position', [.5, .3, .3, .3], 'HandleVisibility', 'off', 'string', 'blue');
    graph.r3 = uicontrol(graph.buttongroup, 'style', 'radiobutton', 'units', 'normalized', 'position', [.8, .3, .3, .3], 'HandleVisibility', 'off', 'string', 'green');
    graph.buttongroup2 = uibuttongroup('visible','on','units','normalized','position', [.35, 0, .6, .1],'selectionchangedfcn', {@typeSelect});
    graph.r4 = uicontrol(graph.buttongroup2, 'style', 'radiobutton', 'units', 'normalized', 'position', [.2, .3, .3, .3], 'HandleVisibility', 'off', 'string', 'Dashed Line');
    graph.r5 = uicontrol(graph.buttongroup2, 'style', 'radiobutton', 'units', 'normalized', 'position', [.5, .3, .3, .3], 'HandleVisibility', 'off', 'string', 'Solid Line');
    graph.r6 = uicontrol(graph.buttongroup2, 'style', 'radiobutton', 'units', 'normalized', 'position', [.8, .3, .3, .3], 'HandleVisibility', 'off', 'string', 'Dash/Dot Line');
end

function [] = plotStuff(~,~)
    global graph;
    if isempty(str2num(graph.x.String)) || isempty(str2num(graph.y.String))
        msgbox('Please Input Numerical Data','User Input Error','error');
        return
    elseif length(str2num(graph.x.String)) ~= length(str2num(graph.y.String))
        msgbox('Please Input Equal Numbers of x and y Values','User Input Error', 'error');
        return
    else
    colorSelect()
    typeSelect()
    disp(graph.buttongroup.SelectedObject.String);
    x = str2num(graph.x.String);
    y = str2num(graph.y.String);
    hold on;
    plot(x,y,[graph.color graph.type]); 
    end
end

 function [] = colorSelect(~,~)
    global graph;
    if strcmp(graph.buttongroup.SelectedObject.String,'red')
        graph.color = 'r';
    elseif strcmp(graph.buttongroup.SelectedObject.String,'blue')
        graph.color = 'b';
    elseif strcmp(graph.buttongroup.SelectedObject.String,'green')
        graph.color = 'g';
    end
 end
 
 function [] = typeSelect(~,~)
    global graph;
    if strcmp(graph.buttongroup2.SelectedObject.String, 'Dashed Line')
        graph.type = '--';
    elseif strcmp(graph.buttongroup2.SelectedObject.String, 'Solid Line')
        graph.type = '-';
    elseif strcmp(graph.buttongroup2.SelectedObject.String, 'Dash/Dot Line')
        graph.type = '-.';
    end
 end


function [] = reset(source,event)
    global graph;
    cla reset;
    graph.title = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.45, .9, .30, .05], 'string', 'Plot Title');
    graph.xtitle = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.45, .2, .30, .05], 'string', 'x-axis Title');
    graph.ytitle = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.01, .5, .25, .05], 'string', 'y-axis Title');
    graph.x = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.05, .9, .15, .1], 'string', 'x-coordinate');
    graph.y = uicontrol('style', 'edit', 'units', 'normalized', 'position', [0.05, .8, .15, .1], 'string', 'y-coordinate');
end
 
%% Error messages not working for non numerical data
%%Line is always a green dash/dot line and I have no clue why
%%How do I get a link for my repository from GitDesktop?
%%Is my paper uploaded to Github correctly?