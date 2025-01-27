% TERNLABEL label ternary phase diagram
%   TERNLABEL('ALABEL', 'BLABEL', 'CLABEL') labels a ternary phase diagram created using TERNPLOT
%   
%   H = TERNLABEL('ALABEL', 'BLABEL', 'CLABEL') returns handles to the text objects created.
%   with the labels provided.  TeX escape codes are accepted.
%
%   See also TERNPLOT

% Author: Carl Sandrock 20020827

% To Do

% Modifications

% Modifiers

function h = ternlabel(A, B, C)

FontSize = get(gca, 'FontSize');

r(1) = text(0.5             , -0.1, A, 'FontSize', FontSize, 'HorizontalAlignment', 'center');
r(2) = text(1-0.35*sind(30) ,  0.5, B, 'FontSize', FontSize, 'HorizontalAlignment', 'center', 'rotation', -60);
r(3) = text(0.35*sind(30)   ,  0.5, C, 'FontSize', FontSize, 'HorizontalAlignment', 'center', 'rotation',  60);

if nargout > 0
    h = r;
end
end