% Solve a Clustering Problem with a Self-Organizing Map

% This script assumes these variables are defined:
%
%   X - input data.

x = X';

% Create a Self-Organizing Map
dimension1 = 10;
dimension2 = 10;
net = selforgmap([dimension1 dimension2]);


net.plotFcns = {'plotsomtop','plotsomnc','plotsomnd', ...
    'plotsomplanes', 'plotsomhits', 'plotsompos'};

% Train the Network
[net,tr] = train(net,x);

% Test the Network
y = net(x);

% View the Network
view(net)

% Plots

figure, plotsomtop(net)
figure, plotsomnc(net)
figure, plotsomnd(net)
figure, plotsomplanes(net)
figure, plotsomhits(net,x)
figure, plotsompos(net,x)

if (false)
    % Generate a Simulink diagram for simulation or deployment with.
    % Simulink Coder tools.
    gensim(net);
end
