ytst = net(datanormal(:,tr.testInd));
ttst = label(:,tr.testInd);

save net.mat net

[c,cm,idn,per] = confusion(ttst,ytst);
benar = sum(diag(cm));
totaldata = sum(sum(cm));
akurasi = (benar/totaldata)*100;
