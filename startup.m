%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First add manually:                                                     %
% - MOSEK Solver (https://www.mosek.com/downloads/list/9/)                %
% - SMAC LFR Toolbox v2.1 (https://w3.onera.fr/smac/lfrt)                 %
% - SMAC GSS Library v2.1 (https://w3.onera.fr/smac/gss_download)         %
% to the Matlab path.                                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

addpath(genpath('/home/ppolcz/_/toolboxes/rsync/01_optimization/mosek'))
addpath(genpath('/home/ppolcz/_/toolboxes/rsync/02_modeling/GSS_Toolbox'))
addpath(genpath('/home/ppolcz/_/toolboxes/rsync/02_modeling/SMAC_LFR_Toolbox_v2.1'))

%%

fname = mfilename('fullpath');
if isempty(fname) || contains(fname,'/tmp/Editor')
    fname = matlab.desktop.editor.getActiveFilename;
end

ROOT = fileparts(fname);
setenv('ROOT',ROOT)

DIR_SUBM = fullfile(ROOT,'submodules');
DIR_FTOOLS = fullfile(DIR_SUBM,'FTOOLS');
DIR_SOSTOOLS = fullfile(DIR_SUBM,'SOSTOOLS','Code');

cd(DIR_FTOOLS)
addftools

cd(DIR_SOSTOOLS)
addsostools

%%

cd(ROOT)
if ~exist('tbxmanager','dir')
    mkdir('tbxmanager')
end
cd tbxmanager

if ~exist('tbxmanager.m','file')
    websave('tbxmanager.m', 'http://www.tbxmanager.com/tbxmanager.m');
    tbxmanager
    savepath
end

if ~exist('toolboxes/yalmip','dir')
    tbxmanager install yalmip
end
tbxmanager restorepath
cd(ROOT)
