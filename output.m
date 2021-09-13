%output inline function

%variable to be output to an output file, updated each iteration.
pts = [V; I];


frame=getframe(1);
clf
writeVideo(v,frame);
figure(1)
hold on
grid on
plot(V);
ylim([-3, 3]);
xlabel('x(mm)');
ylabel('V');
m = num2str(n*dt*10^9,2);
title(['time: ',num2str(n*dt*1e9, '%.2f'), 'ns']);
pause(.05);


%Creates a file each iteration containing the V() and I() values.

    fileID = fopen(sprintf('data%d',n), 'w');
    fprintf(fileID, 'Transmission Line Data\nVoltage__Current\n');
    fclose(fileID);

    fileID = fopen(sprintf('data%d',n), 'a');
    fprintf(fileID, '%fV\n       %fA\n', pts);
    fclose(fileID);
    