
function [hold_state, cax, next] = terngrid (m)
%
% terngrid (m)
%
% makes a ternary point plot for a three phase system
% because I can't figure out how the other functions work
% replace ternaxes which is very buggy
%
% INPUTS
% m         number of grid lines [scalar]
%
% YQW, 12 January 2021

% prepare for plotting ternary plots
n      = m-1;
grids  = linspace(0,1,m+1);
grids  = grids(1:end-1);
labels = num2str(grids(2:end)');

% get hold state
cax = newplot;
next = lower(get(cax,'NextPlot'));
hold_state = ishold;

% set up ternary coordinates
[x1, y1] = terncoords(zeros(size(grids)), 1-grids, grids);      % left
[x2, y2] = terncoords(grids, zeros(size(grids)), 1-grids);      % bottom
[x3, y3] = terncoords(1-grids, grids, zeros(size(grids)));      % right

% only do grids if hold is off
if ~hold_state
    
    % plot ternary axes
    hold on;
    set(gca,'visible','off','defaultlinelinewidth',0.5);
    maxz = 2;
    plot3([0,1,0.5,0],[0,0,sin(1/3*pi),0],maxz.*ones(4,1),'color',[0,0,0],'LineWidth',3,'handlevisibility','off');
    axis equal tight;
    
    
    % plot grid on ternary axes
    for i = 1:n
        plot3([x1(i+1),x2(n-i+2)],[y1(i+1),y2(n-i+2)],maxz.*ones(2,1),'w','handlevisibility','off');
        plot3([x2(i+1),x3(n-i+2)],[y2(i+1),y3(n-i+2)],maxz.*ones(2,1),'w','handlevisibility','off');
        plot3([x3(i+1),x1(n-i+2)],[y3(i+1),y1(n-i+2)],maxz.*ones(2,1),'w','handlevisibility','off');
        plot3([x1(i+1),x2(n-i+2)],[y1(i+1),y2(n-i+2)],maxz.*ones(2,1),'k:','handlevisibility','off');
        plot3([x2(i+1),x3(n-i+2)],[y2(i+1),y3(n-i+2)],maxz.*ones(2,1),'k:','handlevisibility','off');
        plot3([x3(i+1),x1(n-i+2)],[y3(i+1),y1(n-i+2)],maxz.*ones(2,1),'k:','handlevisibility','off');
    end
    
    FontSize = get(gca,'FontSize');
    
    % label gridlines on ternary axis
    text(x1(2:end)-0.02,y1(2:end)     ,labels,'HorizontalAlignment','right' ,'VerticalAlignment','middle','FontSize',FontSize-2);
    text(x2(2:end)     ,y2(2:end)-0.02,labels,'HorizontalAlignment','center'  ,'VerticalAlignment','top','FontSize',FontSize-2);
    text(x3(2:end)+0.02,y3(2:end)     ,labels,'HorizontalAlignment','left','VerticalAlignment','middle'   ,'FontSize',FontSize-2);
    
end


end

