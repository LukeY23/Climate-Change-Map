% take user input for the year they want projected sea rise
yearx = input("Enter a future year to find the projected sea level: ");

% get the current year
d = datetime('today');
yearc = year(d);

% subtract yearx - yearc to get the difference
year_diff = yearx - yearc;

% use the average projection of 10mm/yr from 
% https://www-sciencedirect-com.srv-proxy1.library.tamu.edu/science/article/pii/S0025322713002636
% multiply the year difference by 10mm/yr to get the amount it will rise on average
rise_mm = 10 * year_diff;

% convert millimeters to feet
rise = rise_mm / 304.8;

% if less than 1 ft convert to inches
inches = false;
if rise < 1
    rise = rise * 12;
    inches = true;
end

% create the map by calling a Base Map from this URL
url = 'https://server.arcgisonline.com/arcgis/rest/services/World_Topo_Map/MapServer/tile/${z}/${y}/${x}';
addCustomBasemap('ustopo',url)
geobasemap('ustopo')

% South Padre Limits... geolimits([26.09 26.11], [-97.21 -97.11])

% Isla Blanca Park Geolimits
geolimits([26.06 26.08], [-97.21 -97.11])

% adds title
title("South Padre Island", "FontSize", 24)

legend('boxoff')
legend('FontSize', 13)

% changes legend title based on sea level
if inches == true
    title(legend,"The average rise in sea level by " + string(yearx) + " is " + string(rise) + " inches")
else
    title(legend,"The average rise in sea level by " + string(yearx) + " is " + string(rise) + " feet")
end