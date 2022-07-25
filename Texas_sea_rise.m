% take user input for the year they want projected sea rise
yearx = input("Enter the year you would like to know how much the sea is projected to rise by ");
% get the current year
d = datetime('today');
yearc = year(d);
% subtract yearx - yearc to get the difference
year_diff = yearx - yearc;
% use the average projection of 10mm/yr from 
% https://www-sciencedirect-com.srv-proxy1.library.tamu.edu/science/article/pii/S0025322713002636
% multiply the year difference by 10mm/yr to get the amount it will rise on
% average
rise_mm = 10 * year_diff;
% convert millimeters to feet
rise = rise_mm / 304.8;
% if less than 1 ft convert to inches
inches = false;
if rise < 1
    rise = rise * 12;
    inches = true;
end
% create the map
geolimits([25 31],[-97 -94])
geobasemap streets

% labelLat = 28;
% labelLon = 94;
% textm(labelLat, labelLon, 'rise');

%this kind of works. you just have to click on the map and the text goes
%where you click
if inches == true
    gtextm("The average sea level rise is " + string(rise) + " inches")

else
    gtextm("The average sea level rise is " + string(rise) + " feet")
end
    

