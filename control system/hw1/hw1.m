%This is the first hw for control system
%Write the picture for Rlocus
%editor: Wang Bo An

clear; clc;

%(A) section

figure(1)
tiledlayout(2,2)

nexttile
plot(rlocus ([1],[1,0,1]));
title('(A) 1.') 
box on
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';

nexttile
plot(rlocus([1],[1,3,2,0]));
title('(A) 2.')
box on
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';

nexttile
plot(rlocus([1],[1,6,11,6,0]));
title('(A) 3.')
box on
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';

nexttile
plot(rlocus([1,2],[1,1,0]));
title('(A) 4.')
box on
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';

%(B) section

figure(2)
tiledlayout(2,3)

nexttile
plot(rlocus ([1],[1,0,0]));
title('(B) 5.') 
box on
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';

nexttile
plot(rlocus([1,1],[1,0,0,0]));
title('(B) 6.')
box on
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';

nexttile
plot(rlocus([1,1],[1,12,0,0]));
title('(B) 7.')
box on
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';

nexttile
plot(rlocus([1,1],[1,9,0,0]));
title('(B) 8.')
box on
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';

nexttile
plot(rlocus([1,1],[1,4,0,0]));
title('(B) 9.')
box on
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';

%(C) section

figure(3)
tiledlayout(2,2)

nexttile
plot(rlocus ([1,0],[1,0,4]));
title('(C) 10.') 
box on
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';

nexttile
plot(rlocus([1,0,1],[1,0,4,0]));
title('(C) 11.')
box on
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';

nexttile
plot(rlocus([1,0,4],[1,0,1,0]));
title('(C) 12.')
box on
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';

