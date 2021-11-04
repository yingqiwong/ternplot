% VERTEXLABEL label ternary phase diagram at vertices
%   VERTEXLABEL('ALABEL', 'BLABEL', 'CLABEL') puts labels at vertices of ternary phase diagrams created using TERNPLOT
%   
%   VERTEXLABEL('ALABEL','BLABEL','CLABEL',OFFSET) sets the labels OFFSET units away from the vertices.
%   H = VERTEXLABEL('ALABEL', 'BLABEL', 'CLABEL') returns handles to the text objects created.
%   with the labels provided.  TeX escape codes are accepted.
%
%   See also TERNLABEL TERNPLOT TERNCONTOUR TERNCONTOURF

%       b
%      / \
%     /   \
%    c --- a 

% Author: Peter Selkin 20030508 Modified from Carl Sandrock 20020827

% To Do

% Modifications

% Modifiers

function h = vertexlabel(A, B, C, offset)

if (nargin~=4)
	offset=0.03;
end

FontSize = get(gca,'FontSize');

% label axis names
r(1) = text( 1.02, 0, A,'Units','normalized','FontSize',FontSize,...
    'HorizontalAlignment','left'  ,'VerticalAlignment','middle');

r(2) = text( 0.5 , 1, B,'Units','normalized','FontSize',FontSize,...
    'HorizontalAlignment','center','VerticalAlignment','bottom');

r(3) = text(-0.02, 0, C,'Units','normalized','FontSize',FontSize,...
    'HorizontalAlignment','right' ,'VerticalAlignment','middle');

if nargout > 0, h = r; end
end
