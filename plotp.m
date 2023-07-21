function plotp(X,varargin)
% Function plotp: plot a 2D or 3D point set X
%
% Plots a set of points X in 2D or 3D using either plot or plot3 without the need to separate coordinates of X.
% Supports additional arguments of plot/plot3. Default plotp(X) displays the point as blue stars
%
% INPUT
% 
% X -- an (m x d)-matrix of m points in R^d, d= 2 or 3
% varargin -- for additional arguments of plot/plot3
%
%
% Written by Oleg Davydov, 2019

if ~isempty(varargin)
    LineStyle = varargin{1};
    NameArray = varargin(2:2:end);
    ValueArray = varargin(3:2:end);
else
    LineStyle = '*';
end

if size(X,2) == 2
    p=plot(X(:,1),X(:,2),LineStyle);
    if length(varargin)>1
        set(p,NameArray,ValueArray)
    end
elseif size(X,2) == 3
    p=plot3(X(:,1),X(:,2),X(:,3),LineStyle);
    if length(varargin)>1
        set(p,NameArray,ValueArray)
    end
else
    error('plotp only displays 2D or 3D point sets')
end

