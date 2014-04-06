function centroids_out=climada_centroids_load(centroids_file)
% climada
% NAME:
%   climada_centroids_load
% PURPOSE:
%   load previously saved centroids (just to avoid typing long paths and
%   filenames in the cmd window)
% CALLING SEQUENCE:
%   centroids_out=climada_centroids_load(centroids_file)
% EXAMPLE:
%   centroids_out=climada_centroids_load(centroids_file)
% INPUTS:
%   centroids_file: the filename with path of previously saved centroids, see
%       climada_centroids_read
%       > promted for if not given
% OPTIONAL INPUT PARAMETERS:
% OUTPUTS:
%   centroids_out: a struct, see e.g. climada_centroids_read for details
% MODIFICATION HISTORY:
% David N. Bresch, david.bresch@gmail.com, 20130719
%-

global climada_global
if ~climada_init_vars,return;end % init/import global variables

% poor man's version to check arguments
if ~exist('centroids_file','var'),centroids_file=[];end

% PARAMETERS
%
% TEST
%%centroids_file=[climada_global.data_dir filesep 'system' filesep 'centroids_FortMyers.mat'];

% prompt for centroids_file if not given
if isempty(centroids_file) % local GUI
    centroids_file=[climada_global.data_dir filesep 'system' filesep '*.mat'];
    [filename, pathname] = uigetfile(centroids_file, 'Lead centroids:');
    if isequal(filename,0) || isequal(pathname,0)
        centroids_out = []; return; % cancel
    else
        centroids_file=fullfile(pathname,filename);
    end
end

load(centroids_file)
centroids_out=centroids;

return
