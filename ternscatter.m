
% basically the same as ternplot but has color for data value
% yqw, 4 Nov 2021

function handles = ternscatter(A, B, C, data, varargin)


if nargin < 3
    C = 1 - (A+B);
end;

[varargin, majors    ] = extractpositional(varargin, 'majors', 10);
[varargin, sortpoints] = extractpositional(varargin, 'sortpoints', false);

[fA, fB, fC] = fractions(A, B, C);

[x, y] = terncoords(fA, fB, fC);

% Sort data points in x order
if sortpoints
    [x, i] = sort(x);
    y = y(i);
end

% Make ternary axes
[hold_state, cax, next] = terngrid(majors);

% plot data
q = scatter(x, y, 100, data, 'filled', varargin{:});
if nargout > 0
    handles = q;
end
if ~hold_state
    set(gca,'dataaspectratio',[1 1 1]), axis off; set(cax,'NextPlot',next);
end

end
