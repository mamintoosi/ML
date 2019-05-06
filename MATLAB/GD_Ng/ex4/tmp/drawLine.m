% M.Amintoosi
% It is similar on rasmeKhat, but new green lines' data are used.
function drawLine(x,w,plotOpt)
hodood = [min(x(:,2))-.2 max(x(:,2)+.2) ,min(x(:,3))-.2 max(x(:,3)+.2)];
a=hodood(1):.1:hodood(2);
b=-w(2)/w(3).*a-w(1)/w(3);
a(b<hodood(3) | b>hodood(4)) = [];
b(b<hodood(3) | b>hodood(4)) = [];
% for the first and the last line, we draw it
if any(plotOpt=='r') || any(plotOpt=='k')
    plot(a,b,plotOpt);
else
    % If there is a previous line, we will find it
    plotHandle = findobj(get(gca,'Children'),'Tag','BorderLineW');
    if ~isempty(plotHandle)
        set(plotHandle,'Xdata',a,'Ydata',b);
    else
        plotHandle = plot(a,b,plotOpt);
        set(plotHandle,'Tag','BorderLineW')
    end
end
drawnow
axis(hodood)
axis equal
