M = 15;
rng(0)
net = newff(minmax(datanormal),[100, 95, 14],{'logsig','logsig','logsig'}, 'trainscg');
net.trainParam.epochs = 600;
net.divideFcn = 'divideind';
net = init(net);
net.trainParam.lr = 0.01;

tstind = 1:M;
trnind = tstind(end)+1:N/14;

trnInd = [ind0(id1(trnind)),ind0(id2(trnind)),ind0(id3(trnind)),ind0(id4(trnind)),ind0(id5(trnind)),...
    ind0(id6(trnind)), ind0(id7(trnind)), ind0(id8(trnind)), ind0(id9(trnind)), ind0(id10(trnind)),...
    ind0(id11(trnind)), ind0(id12(trnind)), ind0(id13(trnind)), ind0(id14(trnind))];

tstInd = [ind0(id1(tstind)),ind0(id2(tstind)),ind0(id3(tstind)),ind0(id4(tstind)),ind0(id5(tstind)),...
    ind0(id6(tstind)), ind0(id7(tstind)), ind0(id8(tstind)), ind0(id9(tstind)), ind0(id10(tstind)),...
    ind0(id11(tstind)), ind0(id12(tstind)), ind0(id13(tstind)), ind0(id14(tstind))];

net.divideParam.trainInd = trnInd;
net.divideParam.testInd = tstInd;

% net = newff(trnInd, tstInd, 40,{'logsig'},'trainlm');
% net.trainParam.mc = 0.9;
% net.trainParam.lr = 0.05;
% net.trainParam.epochs = 500;
% net.trainParam.goal = 0.001;

[net, tr] = train(net, datanormal, label);
