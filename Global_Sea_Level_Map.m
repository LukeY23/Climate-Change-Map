fid = fopen('sealeveldata.txt');
SL = textscan(fid,'%f %f %f %f %f %f %f %f','headerlines',7);
fclose(fid);

sl = [SL{1} SL{2} SL{3} SL{4} SL{5} SL{6} SL{7} SL{8}]';
sl(sl==999)=NaN;
sl = (reshape(sl,[1440 716]))';

lat = repmat(linspace(89.5,-89.5,716)',1,1440);
lon = repmat(linspace(0,360,1440),716,1);

% Creates map
figure
ax = worldmap('World');
land = shaperead('landareas', 'UseGeoCoords', true);
geoshow(ax, land, 'FaceColor', 'k');

% plots sea level data
pcolorm(lat,lon,sl)  

cb = colorbar('location','southoutside');
caxis([-15 15])
title(ax,'Rising Sea Levels across the Globe','FontWeight','bold','FontSize',24)
xlabel(cb,'Sea level rise (mm/yr)','FontWeight','bold','FontSize',12)